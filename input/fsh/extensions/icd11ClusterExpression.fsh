// ============================================================
// icd11ClusterExpression.fsh
// Extension for ICD-11 postcoordinated cluster expressions
// Context: Coding (broad — usable across all ICD-11 coded elements)
// ============================================================

Extension: ICD11ClusterExpression
Id: icd11-cluster-expression
Title: "ICD-11 Cluster Expression"
Description: """
Carries a postcoordinated ICD-11 cluster expression as a single string
on a Coding element where the stem code alone is insufficient to fully
represent the clinical concept.

A cluster expression combines a stem code with one or more satellite
codes using the & operator (combination) or / operator (specificity).
Example: NC72.Z&XK8G&XJ7ZH&XJ7YM
  - NC72.Z  — stem: Fracture of femur, unspecified
  - XK8G    — satellite: laterality
  - XJ7ZH   — satellite: fracture subtype
  - XJ7YM   — satellite: fracture open or closed

Usage rules:
  - SHALL only be present when the expression contains at least one
    satellite code joined by & or / operators.
  - Single stem codes SHALL be represented in Coding.code only and
    validated via OCL $validate-code. The cluster validator at
    https://icd11.dghs.gov.bd/cluster/validate explicitly rejects
    stem-only expressions.
  - The stem code in Coding.code SHALL match the leading stem code
    in this expression string.
  - Satellite codes in the cluster expression are exempt from the
    Diagnosis/Finding class restriction that applies to stem codes
    in Condition.code.
  - Cluster expressions SHALL be validated against the Bangladesh
    ICD-11 Cluster Validator at https://icd11.dghs.gov.bd/cluster/validate
    prior to submission to the HIE.

Cluster validator endpoint:
  POST https://icd11.dghs.gov.bd/cluster/validate
  Body: { "expression": "NC72.Z&XK8G&XJ7ZH&XJ7YM" }

This extension is not MustSupport and is not mandatory. It is present
only when postcoordination is clinically required. Cluster expressions
are typically sourced from the WHO Electronic Coding Tool (ECT) at the
point of care.
"""

* ^url = "https://fhir.dghs.gov.bd/core/StructureDefinition/icd11-cluster-expression"
* ^status = #active
* ^experimental = false
* ^publisher = "Directorate General of Health Services (DGHS), MoHFW, Bangladesh"
* ^contact.name = "DGHS Health Informatics Unit"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://dghs.gov.bd"
* ^jurisdiction = urn:iso:std:iso:3166#BD "Bangladesh"
* ^context[+].type = #element
* ^context[=].expression = "Coding"

* value[x] only string
* valueString 1..1
* valueString ^short = "ICD-11 postcoordinated cluster expression string"
* valueString ^definition = """
The full postcoordinated cluster expression, including the stem code and
all satellite codes joined by & or / operators. Example:
NC72.Z&XK8G&XJ7ZH&XJ7YM. The stem code in this string SHALL match
Coding.code on the parent Coding element.
"""