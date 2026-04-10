// ============================================================
// BDConditionProfile.fsh
// BD-Core Condition profile with mandatory ICD-11 MMS stem slice
// Binding: Diagnosis and Finding class concepts only
// Runtime enforcement via OCL ValueSet $validate-code
// ============================================================

Profile: BDConditionProfile
Parent: Condition
Id: bd-condition
Title: "BD Core Condition Profile (ICD-11)"
Description: """
Condition resource coded with ICD-11 MMS, restricted to Diagnosis and
Finding class concepts. Defined in the Bangladesh Core FHIR Implementation
Guide (BD-Core-FHIR-IG) published by DGHS/MoHFW.
"""

* code 1..1 MS
* code from bd-condition-icd11-diagnosis-valueset (required)
* code ^comment = """
Condition.code SHALL contain at least one coding conforming to the
coding[stem] slice with system = http://id.who.int/icd/release/11/mms.

Stem code rules:
  - The stem code SHALL be a Diagnosis or Finding class ICD-11 MMS concept.
  - This restriction is enforced at runtime via OCL ValueSet $validate-code
    against the Bangladesh ICD-11 MMS Condition ValueSet.
  - Stem-only codes SHALL be validated via OCL $validate-code.
  - Substance, Organism, Device, Anatomy, and Misc class concepts SHALL NOT
    appear as standalone stem codes in Condition.code.

Cluster expression rules:
  - When a concept requires postcoordination, the full cluster expression
    SHALL be carried in the icd11-cluster-expression extension on coding[stem].
  - The icd11-cluster-expression extension SHALL only be present when the
    expression contains at least one satellite code joined by & or / operators.
  - Satellite codes in the cluster expression are exempt from the
    Diagnosis/Finding class restriction.
  - Cluster expressions SHALL be validated against the Bangladesh ICD-11
    Cluster Validator at https://icd11.dghs.gov.bd/cluster/validate
    prior to submission to the HIE.

Additional local codings are permitted alongside the mandatory ICD-11 stem
(slicing is open). Cluster expressions are typically sourced from the WHO
Electronic Coding Tool (ECT) at the point of care.
"""

* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding ^slicing.description = "Slice requiring exactly one ICD-11 MMS stem code. Additional local codings permitted."

* code.coding contains stem 1..1
* code.coding[stem] ^short = "Mandatory ICD-11 MMS stem code"
* code.coding[stem] ^definition = """
Exactly one ICD-11 MMS stem code is required. The stem code SHALL be a
Diagnosis or Finding class concept. When the condition requires
postcoordination, the full cluster expression is carried in the
icd11-cluster-expression extension on this coding element.
"""
* code.coding[stem].system 1..1
* code.coding[stem].system = "http://id.who.int/icd/release/11/mms" (exactly)
* code.coding[stem].code 1..1
* code.coding[stem].extension contains
    https://fhir.dghs.gov.bd/core/StructureDefinition/icd11-cluster-expression named clusterExpression 0..1