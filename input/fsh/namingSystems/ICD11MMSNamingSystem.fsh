// ============================================================
// ICD11MMSNamingSystem.fsh
// NamingSystem for ICD-11 MMS in the Bangladesh national context
// Canonical authority: WHO
// National resolver: OCL at https://tr.ocl.dghs.gov.bd
// ============================================================

Instance: icd11-mms-bd
InstanceOf: NamingSystem
Usage: #definition
Title: "ICD-11 MMS NamingSystem — Bangladesh"
Description: """
Declares the ICD-11 Mortality and Morbidity Statistics (MMS) coding system
as a known and supported terminology within the Bangladesh national health
information infrastructure.

Canonical system URI: http://id.who.int/icd/release/11/mms
Canonical authority: World Health Organization (WHO)

Preferred code form: short stem codes (e.g. 1A00, NC72.Z).
Linearization URIs are not used as code identifiers in this IG.

National terminology resolver (OCL):
  https://tr.ocl.dghs.gov.bd

Supported OCL operations (use system= parameter, not url=):
  - $validate-code: https://tr.ocl.dghs.gov.bd/api/fhir/CodeSystem/$validate-code
      ?system=http://id.who.int/icd/release/11/mms&code={code}
  - $lookup: https://tr.ocl.dghs.gov.bd/api/fhir/CodeSystem/$lookup
      ?system=http://id.who.int/icd/release/11/mms&code={code}

$expand is not supported — known OCL limitation.

Version 2025-01 is active in the national OCL instance with 36,941
imported concepts. The OCL resolver is an internal national service;
vendors do not interact with it directly. All vendor submissions are
validated at the HIE boundary via the Bangladesh ICD-11 Cluster Validator
at https://icd11.dghs.gov.bd/cluster/validate.
"""

* name = "ICD11MMSBangladesh"
* status = #active
* kind = #codesystem
* date = "2025-01-01"
* publisher = "Directorate General of Health Services (DGHS), MoHFW, Bangladesh"
* contact.name = "DGHS Health Informatics Unit"
* contact.telecom.system = #url
* contact.telecom.value = "https://dghs.gov.bd"
* jurisdiction = urn:iso:std:iso:3166#BD "Bangladesh"
* responsible = "World Health Organization (WHO)"

// Primary identifier — canonical system URI (WHO authority)
* uniqueId[+].type = #uri
* uniqueId[=].value = "http://id.who.int/icd/release/11/mms"
* uniqueId[=].preferred = true
* uniqueId[=].comment = "Canonical ICD-11 MMS system URI. Canonical authority is WHO."
* uniqueId[=].period.start = "2025-01-01"

// Secondary identifier — national OCL source locator (machine-discoverable, not canonical)
* uniqueId[+].type = #uri
* uniqueId[=].value = "https://tr.ocl.dghs.gov.bd/orgs/MoHFW/sources/ICD-11-MMS/"
* uniqueId[=].preferred = false
* uniqueId[=].comment = "National terminology resolver — Bangladesh OCL instance. Not the canonical system URI."