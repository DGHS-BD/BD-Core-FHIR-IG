## ICD-11 Implementation

### Overview

The Bangladesh Core FHIR Implementation Guide uses ICD-11 Mortality and
Morbidity Statistics (MMS) as the mandatory coding system for clinical
conditions. This page documents the system URI, terminology infrastructure,
conformance requirements, and postcoordination conventions for implementers.

---

### System URI

All ICD-11 MMS codes SHALL use the WHO canonical system URI:
```
http://id.who.int/icd/release/11/mms
```

The preferred code form is the short stem code (e.g. `1A00`, `NC72.Z`).
Linearization URIs are not used as code identifiers in this IG.

---

### Terminology Infrastructure

#### National OCL Terminology Server

Runtime code validation and lookup are delegated to the national
OpenConceptLab (OCL) terminology server operated by DGHS/MoHFW:

**Public FHIR R4 endpoint:** `https://tr.ocl.dghs.gov.bd`

OCL hosts ICD-11 MMS version 2025-01 with 36,941 concepts across the
following concept classes: Diagnosis, Finding, Substance, Organism,
Device, Anatomy, and Misc.

Vendors do not interact with OCL directly. All vendor submissions are
validated at the HIE boundary via the Bangladesh ICD-11 Cluster Validator
(see [Cluster Expressions](#cluster-expressions) below).

#### Supported OCL Operations

The following FHIR terminology operations are supported. The `system=`
parameter must be used — `url=` is not supported by OCL.

**CodeSystem $validate-code**
```
GET https://tr.ocl.dghs.gov.bd/api/fhir/CodeSystem/$validate-code
    ?system=http://id.who.int/icd/release/11/mms&code={code}
```

**CodeSystem $lookup**
```
GET https://tr.ocl.dghs.gov.bd/api/fhir/CodeSystem/$lookup
    ?system=http://id.who.int/icd/release/11/mms&code={code}
```

**ValueSet $validate-code**
```
GET https://tr.ocl.dghs.gov.bd/api/fhir/ValueSet/$validate-code
    ?url=https://fhir.dghs.gov.bd/core/ValueSet/bd-condition-icd11-diagnosis-valueset
    &system=http://id.who.int/icd/release/11/mms&code={code}
```

#### Unsupported OCL Operations

`$expand` is not supported — this is a known limitation of the national
OCL instance. Build-time expansion is suppressed. Implementers SHALL NOT
depend on `$expand` for ICD-11 ValueSets in this IG.

#### Local ICD-11 Docker Instance

A local WHO ICD-11 Docker instance is maintained internally by DGHS at
`https://icd11.dghs.gov.bd` running release 2025-01. This instance is
internal only and is not exposed to vendors. It serves as the import
source for OCL and as the backend for the cluster validator.

---

### Condition.code Binding and Class Restriction

`Condition.code` is bound to the
[Bangladesh ICD-11 MMS Condition ValueSet](ValueSet-bd-condition-icd11-diagnosis-valueset.html)
at `preferred` strength. This ValueSet includes only Diagnosis (14,071)
and Finding (5,590) class concepts — 19,661 concepts total as of
version 2025-01.

`Condition.code` SHALL contain at least one coding conforming to the
`coding[stem]` slice with `system = http://id.who.int/icd/release/11/mms`.
Vendors cannot omit ICD-11 by substituting a local code.

The following concept classes SHALL NOT appear as standalone stem codes
in `Condition.code`: Substance, Organism, Device, Anatomy, Misc.

This restriction exists because these classes represent entities that
are not themselves diagnoses or clinical findings — they are axes used
in postcoordination (e.g. a causative substance, an affected anatomy
site). Their correct use is as satellite codes within a cluster
expression, not as standalone condition codes.

Class restriction is enforced at runtime via OCL ValueSet `$validate-code`
against the Bangladesh ICD-11 MMS Condition ValueSet. At the HAPI FHIR
layer, enforcement is via `RemoteTerminologyServiceValidationSupport`
configured to call OCL. HAPI FHIR deployment will be completed before
vendor onboarding.

The `coding[stem]` slice is open (`#open`) — additional local codings
are permitted alongside the mandatory ICD-11 stem.

---

### Cluster Expressions

#### Background

ICD-11 supports postcoordination — the combination of a stem code with
one or more satellite codes to precisely represent a clinical concept
that cannot be expressed by a stem code alone. A postcoordinated
expression is called a cluster expression.

Cluster expressions are typically sourced from the WHO Electronic Coding
Tool (ECT) at the point of care.

#### Syntax

A cluster expression combines a stem code with satellite codes using
the `&` operator (combination) or `/` operator (specificity):
```
NC72.Z&XK8G&XJ7ZH&XJ7YM
```

Where:
- `NC72.Z` — stem code: Fracture of femur, unspecified
- `XK8G` — satellite: laterality
- `XJ7ZH` — satellite: fracture subtype
- `XJ7YM` — satellite: fracture open or closed

#### FHIR Representation

The stem code is carried in `Coding.code`. The full cluster expression
is carried in the
[ICD-11 Cluster Expression extension](StructureDefinition-icd11-cluster-expression.html)
on the same `Coding` element:
```json
"code": {
  "coding": [
    {
      "system": "http://id.who.int/icd/release/11/mms",
      "code": "NC72.Z",
      "display": "Fracture of femur, unspecified",
      "extension": [
        {
          "url": "https://fhir.dghs.gov.bd/core/StructureDefinition/icd11-cluster-expression",
          "valueString": "NC72.Z&XK8G&XJ7ZH&XJ7YM"
        }
      ]
    }
  ],
  "text": "Fracture of femur, unspecified — left, transverse, closed"
}
```

The stem code in `Coding.code` SHALL match the leading stem code in the
cluster expression string.

#### Stem-Only vs Cluster

| Scenario | Representation | Validation |
|---|---|---|
| Single stem code | `Coding.code` only | OCL `$validate-code` |
| Postcoordinated expression | `Coding.code` + cluster extension | Cluster Validator |

The cluster validator explicitly rejects stem-only expressions. Single
stem codes SHALL be represented in `Coding.code` only and validated via
OCL `$validate-code`.

#### Satellite Code Class Restriction Exemption

Satellite codes in a cluster expression are exempt from the
Diagnosis/Finding class restriction that applies to stem codes in
`Condition.code`. Substance, Anatomy, Organism, and other axis codes
are valid and expected as satellites.

#### Bangladesh ICD-11 Cluster Validator

All postcoordinated cluster expressions SHALL be validated against the
Bangladesh ICD-11 Cluster Validator prior to submission to the HIE:
```
POST https://icd11.dghs.gov.bd/cluster/validate
Content-Type: application/json

{"expression": "NC72.Z&XK8G&XJ7ZH&XJ7YM"}
```

Example response:
```json
{
  "valid": true,
  "stem": {
    "code": "NC72.Z",
    "display": "Fracture of femur, unspecified",
    "ocl_validated": true
  },
  "satellites": [
    {"code": "XK8G",  "axis": "laterality",           "valid": true},
    {"code": "XJ7ZH", "axis": "fractureSubtype",       "valid": true},
    {"code": "XJ7YM", "axis": "fractureOpenOrClosed",  "valid": true}
  ],
  "errors": []
}
```

The cluster validator is a mandatory HIE boundary gate. All vendor
submissions containing postcoordinated ICD-11 expressions pass through it.

---

### Conformance Statements

**ICD-11-CONF-01:** ICD-11 MMS codes SHALL use system URI
`http://id.who.int/icd/release/11/mms`. Stem code validation is available
via OCL at:
`https://tr.ocl.dghs.gov.bd/api/fhir/CodeSystem/$validate-code?system=http://id.who.int/icd/release/11/mms&code={code}`

**ICD-11-CONF-02:** The `icd11-cluster-expression` extension SHALL only
be present when the expression contains at least one postcoordination
satellite code using `&` or `/` operators. Single stem codes SHALL be
represented in `Coding.code` only and validated via OCL `$validate-code`.

**ICD-11-CONF-03:** Postcoordinated cluster expressions SHALL be validated
against the Bangladesh ICD-11 Cluster Validator at
`https://icd11.dghs.gov.bd/cluster/validate` prior to submission to the HIE.

**ICD-11-CONF-04:** `Condition.code` SHALL contain at least one coding
conforming to the `coding[stem]` slice with
`system = http://id.who.int/icd/release/11/mms`. The stem code SHALL be
a member of the Bangladesh ICD-11 MMS Condition ValueSet, which includes
only Diagnosis and Finding class concepts. This restriction is enforced
at runtime via OCL ValueSet `$validate-code`.

**ICD-11-CONF-05:** Substance, Organism, Device, Anatomy, and Misc class
ICD-11 concepts SHALL NOT appear as standalone stem codes in
`Condition.code`. This restriction does not apply to satellite codes
carried in the `icd11-cluster-expression` extension.