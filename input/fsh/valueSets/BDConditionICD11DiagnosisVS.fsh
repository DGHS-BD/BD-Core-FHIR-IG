// ============================================================
// BDConditionICD11DiagnosisVS.fsh
// ICD-11 MMS ValueSet restricted to Diagnosis and Finding classes
// Binding target for Condition.code in BDConditionProfile
// Empty stub — runtime enforcement via OCL $validate-code
// $expand not available — suppressed in sushi-config.yaml
// ============================================================

ValueSet: BDConditionICD11DiagnosisVS
Id: bd-condition-icd11-diagnosis-valueset
Title: "Bangladesh ICD-11 MMS Condition ValueSet (Diagnosis and Finding)"
Description: """
ICD-11 MMS concepts restricted to the Diagnosis (14,071) and Finding (5,590)
concept classes, totalling 19,661 concepts as of version 2025-01.

This ValueSet is the binding target for Condition.code in the BD-Core
Condition profile. Substance, Organism, Device, Anatomy, and Misc class
concepts are excluded and SHALL NOT appear as standalone stem codes in
Condition.code. This restriction applies to stem codes only — satellite
codes carried in the icd11-cluster-expression extension are exempt.

This ValueSet is an empty stub. No compose block is declared because
$expand is not supported by the national OCL terminology server and
no machine-executable filter for concept_class is available at the
IG layer. The compose would be nominal only and is omitted to avoid
misrepresenting machine-executable semantics.

The ValueSet is hosted in OCL as a collection with 19,661 explicit
concept references (Diagnosis and Finding classes only). Runtime
enforcement is via OCL ValueSet $validate-code:

  GET https://tr.ocl.dghs.gov.bd/api/fhir/ValueSet/$validate-code
      ?url=https://fhir.dghs.gov.bd/core/ValueSet/bd-condition-icd11-diagnosis-valueset
      &system=http://id.who.int/icd/release/11/mms
      &code={code}

Confirmed behaviour:
  - Diagnosis class (e.g. 1A00): accepted
  - Finding class: accepted
  - Device class (e.g. XD7EB1): rejected
  - Substance class (e.g. XM6RB2): rejected

At the HAPI FHIR layer, enforcement is via RemoteTerminologyServiceValidationSupport
configured to call OCL. HAPI FHIR deployment is a known gap to be closed
before vendor onboarding.

VERSION UPGRADES:
  Upgrading to a new ICD-11 MMS release requires re-running
  populate_condition_valueset.py. Automated via version_upgrade.py.
"""

* ^url = "https://fhir.dghs.gov.bd/core/ValueSet/bd-condition-icd11-diagnosis-valueset"
* ^status = #active
* ^experimental = false
* ^version = "2025-01"
* ^publisher = "Directorate General of Health Services (DGHS), MoHFW, Bangladesh"
* ^contact.name = "DGHS Health Informatics Unit"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://dghs.gov.bd"
* ^jurisdiction = urn:iso:std:iso:3166#BD "Bangladesh"
* ^copyright = "ICD-11 is copyright © World Health Organization. Used under licence."
* ^immutable = false