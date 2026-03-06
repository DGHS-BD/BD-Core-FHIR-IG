// ============================================================
// CodeSystem-icd11-mms.fsh
// ICD-11 Mortality and Morbidity Statistics (MMS) — stub only
// Content is hosted externally; canonical authority is WHO.
// Runtime resolution via OCL: https://tr.ocl.dghs.gov.bd
// ============================================================

CodeSystem: ICD11MMSCS
Id: icd11-mms
Title: "ICD-11 Mortality and Morbidity Statistics (MMS)"
Description: """
WHO ICD-11 Mortality and Morbidity Statistics linearization.
Canonical system URI: http://id.who.int/icd/release/11/mms

This CodeSystem is declared as a stub (content = #not-present).
The authoritative content is maintained by the World Health Organization.
In Bangladesh, runtime code validation and lookup are delegated to the
national OCL terminology server at https://tr.ocl.dghs.gov.bd.

Supported operations (use `system=` parameter, not `url=`):
  - $validate-code: https://tr.ocl.dghs.gov.bd/api/fhir/CodeSystem/$validate-code?system=http://id.who.int/icd/release/11/mms&code={code}
  - $lookup:        https://tr.ocl.dghs.gov.bd/api/fhir/CodeSystem/$lookup?system=http://id.who.int/icd/release/11/mms&code={code}

$expand is not supported — known OCL limitation. Expansion must not be
attempted at build time or by IG Publisher.

Preferred code form: short stem codes (e.g. 1A00, NC72.Z).
Linearization URIs are not used as code identifiers in this IG.

Version 2025-01 is imported into OCL with 36,941 concepts across
the following concept classes: Diagnosis, Finding, Substance, Organism,
Device, Anatomy, Misc.
"""

* ^url = "http://id.who.int/icd/release/11/mms"
* ^version = "2025-01"
* ^status = #active
* ^experimental = false
* ^publisher = "World Health Organization (WHO)"
* ^contact.name = "Directorate General of Health Services (DGHS), MoHFW, Bangladesh"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://dghs.gov.bd"
* ^jurisdiction = urn:iso:std:iso:3166#BD "Bangladesh"
* ^copyright = "ICD-11 is copyright © World Health Organization. Used under licence."
* ^content = #not-present
* ^count = 36941
* ^caseSensitive = true