// ============================================================
// BDFacilityStaffIdNamingSystem.fsh
// NamingSystem for the identifier namespace https://fhir.dghs.gov.bd/identifier/facility-staff-id
// The IG defines the URI string; each health facility issues the values.
// Identifier URIs are exact-match keys in vendor data: never change or repurpose them.
// ============================================================

Instance: bd-facility-staff-id
InstanceOf: NamingSystem
Usage: #definition
Title: "Facility Staff ID"
Description: """
Staff identifier assigned by a health facility to a member of its staff who holds no licence or registration number in a national register, for example a laboratory technologist.

The value is unique only within the facility that assigns it. It identifies the person to that facility; it is not verified against any national registry, and the same value at two facilities refers to two different people.

Identifier system URI: https://fhir.dghs.gov.bd/identifier/facility-staff-id
"""

* name = "BDFacilityStaffId"
* status = #draft
* kind = #identifier
* date = "2026-10-18"
* publisher = "Directorate General of Health Services (DGHS), MoHFW, Bangladesh"
* contact.name = "DGHS Health Informatics Unit"
* contact.telecom.system = #url
* contact.telecom.value = "https://dghs.gov.bd"
* jurisdiction = urn:iso:std:iso:3166#BD "Bangladesh"
* responsible = "Each health facility, for its own staff"

* uniqueId[+].type = #uri
* uniqueId[=].value = "https://fhir.dghs.gov.bd/identifier/facility-staff-id"
* uniqueId[=].preferred = true
* uniqueId[=].comment = "Identifier system URI defined by this IG."
