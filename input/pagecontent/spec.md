## Bangladesh Core FHIR Implementation Guide — General Specification

### Purpose and Scope

This Implementation Guide (IG) defines the national FHIR R4 core profiles,
value sets, code systems, extensions, and implementation rules for digital
health systems in Bangladesh. It is published by the Directorate General of
Health Services (DGHS), Ministry of Health and Family Welfare (MoHFW).

This IG is a foundational component of the **Shareable Health Record (SHR)**
system — the national Health Information Exchange (HIE) and gateway for
producing a Personal Health Profile for every citizen of Bangladesh.

This IG is aligned with and gives technical expression to:
- **Bangladesh Digital Health Strategy 2023–2027**
- **Bangladesh Digital Health Architecture Blueprint**

The Patient profile strictly conforms to the **Citizen Core Data Structure
(CCDS)** defined by the Cabinet Division of the Government of Bangladesh.

---

### Intended Audience

This IG is addressed to all software systems exchanging health data with
the national SHR, including but not limited to:

- Electronic Medical Record (EMR) systems
- Laboratory Information Systems (LIS)
- Picture Archiving and Communication Systems (PACS)
- Hospital Information Systems (HIS)

This includes systems operated by public sector facilities, private
hospitals and clinics, autonomous bodies, and non-governmental
organisations (NGOs) operating within Bangladesh.

---

### FHIR Version and Conventions

This IG is built on **FHIR R4 (4.0.1)**. All profiles, extensions, value
sets, and code systems defined here conform to the FHIR R4 specification.

Conformance language in this IG follows **RFC 2119**: SHALL, SHALL NOT,
SHOULD, SHOULD NOT, and MAY carry their standard normative meanings.

---

### Design Principles

**1. National terminology over international defaults**
Where international code systems are used (ICD-11, LOINC, SNOMED CT),
they are bound through national infrastructure. The national OpenConceptLab
(OCL) terminology server at `https://tr.ocl.dghs.gov.bd` is the single
public-facing terminology resolution point. Vendors never interact with
upstream terminology sources directly.

**2. HIE boundary enforcement**
All vendor submissions pass through the national SHR HIE boundary. Mandatory
validation gates — including the Bangladesh ICD-11 Cluster Validator — are
applied at the HIE layer. Profile conformance is a necessary but not
sufficient condition for acceptance; HIE boundary rules apply additionally.

**3. Open slicing for extensibility**
Where slices are defined on coding elements, slicing is open (`#open`).
Mandatory slices enforce the presence of nationally required codes;
additional local or proprietary codings are permitted alongside them.
This ensures national interoperability without preventing systems from
carrying additional coded data.

**4. Citizen-centred identity**
The Patient profile conforms to the Citizen Core Data Structure (CCDS),
ensuring that patient identity in the SHR is anchored to the national
citizen identity infrastructure.

**5. Must Support obligations**
Must Support (MS) in this IG means that conformant systems SHALL be capable
of populating the element if the data is held by the system, and SHALL be
capable of processing it when received. Specific sender and receiver
obligations are \[TODO: to be defined in a future revision\].

---

### Profiles

The following national core profiles are defined in this IG:

| Profile | Base Resource | Purpose |
|---|---|---|
| [BD Patient](StructureDefinition-bd-patient.html) | Patient | Citizen identity conforming to CCDS |
| [BD Condition](StructureDefinition-bd-condition.html) | Condition | Clinical conditions coded with ICD-11 MMS |
| [BD Observation](StructureDefinition-bd-observation.html) | Observation | Vital signs, laboratory results, clinical findings |
| [BD Encounter](StructureDefinition-bd-encounter.html) | Encounter | Clinical visits and episodes of care |
| [BD Medication](StructureDefinition-bd-medication.html) | Medication | Medication definitions |
| [BD MedicationRequest](StructureDefinition-bd-medicationrequest.html) | MedicationRequest | Prescriptions and medication orders |
| [BD Immunization](StructureDefinition-bd-immunization.html) | Immunization | Vaccination records |
| [BD Organization](StructureDefinition-bd-organization.html) | Organization | Health facilities and organisations |
| [BD Practitioner](StructureDefinition-bd-practitioner.html) | Practitioner | Healthcare providers |
| [BD Location](StructureDefinition-bd-location.html) | Location | Physical locations and administrative geography |

---

### Terminology

The following external code systems are used in this IG:

| System | URI | Purpose |
|---|---|---|
| ICD-11 MMS | `http://id.who.int/icd/release/11/mms` | Condition coding |
| LOINC | `http://loinc.org` | Observation coding |
| UCUM | `http://unitsofmeasure.org` | Observation units |
| SNOMED CT | `http://snomed.info/sct` | Clinical terminology |

Runtime terminology resolution is provided by the national OCL terminology
server. See the [ICD-11 Implementation](icd11.html) page for full details
of ICD-11 integration, postcoordination conventions, and conformance
requirements.

---

### Known Gaps and Planned Work

This IG is currently at version 0.2.5 with status `draft`. The following
are known gaps to be addressed in future revisions:

- **Must Support semantics** — sender and receiver obligations not yet
  formally defined
- **Capability Statements** — no CapabilityStatement resources defined yet
- **Search Parameters** — no defined search parameter requirements yet
- **Transaction Patterns** — no defined FHIR transaction or message patterns yet
- **HAPI FHIR deployment** — `RemoteTerminologyServiceValidationSupport`
  configuration for OCL not yet deployed; this is a prerequisite for
  runtime ICD-11 class restriction enforcement before vendor onboarding
- **Must Support definitions per profile** — individual profile pages do
  not yet carry explicit MS obligation tables
