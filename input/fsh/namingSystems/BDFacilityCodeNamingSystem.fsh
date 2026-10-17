// ============================================================
// BDFacilityCodeNamingSystem.fsh
// NamingSystem for the identifier namespace https://hris.mohfw.gov.bd/identifier/facility-code
// The IG defines the URI string; the responsible body issues the identifiers.
// Identifier URIs are exact-match keys in vendor data: never change or repurpose them.
// ============================================================

Instance: bd-facility-code
InstanceOf: NamingSystem
Usage: #definition
Title: "HRIS Facility Code"
Description: """
National health facility code issued by the HRIS facility registry. Unique and stable; the same code is used by DHIS2, OpenMRS and OpenSRP. HRIS is the source of truth for facility identity.

Identifier system URI: https://hris.mohfw.gov.bd/identifier/facility-code

The URI http://hrm.dghs.gov.bd/facilities/code was used in earlier examples of this IG. It is kept only so that data carrying it can be recognised; new data SHALL use the system URI above."""

* name = "BDFacilityCode"
* status = #draft
* kind = #identifier
* date = "2026-10-18"
* publisher = "Directorate General of Health Services (DGHS), MoHFW, Bangladesh"
* contact.name = "DGHS Health Informatics Unit"
* contact.telecom.system = #url
* contact.telecom.value = "https://dghs.gov.bd"
* jurisdiction = urn:iso:std:iso:3166#BD "Bangladesh"
* responsible = "HRIS, MoHFW (managed by DGHS)"

* uniqueId[+].type = #uri
* uniqueId[=].value = "https://hris.mohfw.gov.bd/identifier/facility-code"
* uniqueId[=].preferred = true
* uniqueId[=].comment = "Identifier system URI defined by this IG."

* uniqueId[+].type = #uri
* uniqueId[=].value = "http://hrm.dghs.gov.bd/facilities/code"
* uniqueId[=].preferred = false
* uniqueId[=].comment = "Legacy identifier used in the Organization example before this namespace was fixed."
* uniqueId[=].period.end = "2026-10-18"
