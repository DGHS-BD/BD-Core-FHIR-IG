// ============================================================
// DGDADrugRegistryNamingSystem.fsh
// NamingSystem for the national drug registry code system
// Data owner: DGDA. Definition steward: DGHS.
// ============================================================

Instance: dgda-drug-registry-bd
InstanceOf: NamingSystem
Usage: #definition
Title: "DGDA Drug Registry NamingSystem - Bangladesh"
Description: """
Declares the national drug registry code system and records its identifiers.

Registration data owner: Directorate General of Drug Administration (DGDA),
Government of Bangladesh. Definition steward and terminology maintainer:
DGHS (national OCL terminology server, https://tr.ocl.dghs.gov.bd).

Concept codes follow the format {DAR-number}--{trade-name-slug}
(example: 353-0026-039--marvelous-fe).

Canonical system URI since v2.0.0:
  https://fhir.dghs.gov.bd/core/CodeSystem/dgda-drug-registry

The identifier https://dgda.gov.bd/drug-registry was used in v1.0.0. It was a logical identifier
that DGDA does not publish or resolve. It is kept only so that data coded
with the v1.0.0 identifier can be recognised; new data SHALL use the canonical
system URI above.
"""

* name = "DGDADrugRegistryBangladesh"
* status = #active
* kind = #codesystem
* date = "2026-10-14"
* publisher = "Directorate General of Health Services (DGHS), MoHFW, Bangladesh"
* contact.name = "DGHS Health Informatics Unit"
* contact.telecom.system = #url
* contact.telecom.value = "https://dghs.gov.bd"
* jurisdiction = urn:iso:std:iso:3166#BD "Bangladesh"
* responsible = "Directorate General of Health Services (DGHS), MoHFW, Bangladesh"

// Primary identifier - canonical system URI (DGHS namespace)
* uniqueId[+].type = #uri
* uniqueId[=].value = "https://fhir.dghs.gov.bd/core/CodeSystem/dgda-drug-registry"
* uniqueId[=].preferred = true
* uniqueId[=].comment = "Canonical system URI since v2.0.0."
* uniqueId[=].period.start = "2026-10-14"

// Legacy identifier (v1.0.0) - not canonical, not resolvable
* uniqueId[+].type = #uri
* uniqueId[=].value = "https://dgda.gov.bd/drug-registry"
* uniqueId[=].preferred = false
* uniqueId[=].comment = "Legacy logical identifier used in v1.0.0. Not published by DGDA and not resolvable."
* uniqueId[=].period.end = "2026-10-14"
