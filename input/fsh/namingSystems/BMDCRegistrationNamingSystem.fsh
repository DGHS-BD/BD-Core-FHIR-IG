// ============================================================
// BMDCRegistrationNamingSystem.fsh
// NamingSystem for the identifier namespace https://fhir.dghs.gov.bd/identifier/bmdc-registration
// The IG defines the URI string; the responsible body issues the identifiers.
// Identifier URIs are exact-match keys in vendor data: never change or repurpose them.
// ============================================================

Instance: bmdc-registration
InstanceOf: NamingSystem
Usage: #definition
Title: "BMDC Registration Number"
Description: """
Registration number issued by the Bangladesh Medical & Dental Council to physicians and dentists. BMDC does not publish an identifier URI; the URI is defined by this IG in the DGHS namespace. If BMDC publishes its own, it is added here as an alias.

Identifier system URI: https://fhir.dghs.gov.bd/identifier/bmdc-registration

The URI https://fhir.dghs.gov.bd/core/identifier/bmdc-registration was used in earlier examples of this IG. It is kept only so that data carrying it can be recognised; new data SHALL use the system URI above."""

* name = "BMDCRegistration"
* status = #draft
* kind = #identifier
* date = "2026-10-18"
* publisher = "Directorate General of Health Services (DGHS), MoHFW, Bangladesh"
* contact.name = "DGHS Health Informatics Unit"
* contact.telecom.system = #url
* contact.telecom.value = "https://dghs.gov.bd"
* jurisdiction = urn:iso:std:iso:3166#BD "Bangladesh"
* responsible = "Bangladesh Medical & Dental Council (BMDC)"

* uniqueId[+].type = #uri
* uniqueId[=].value = "https://fhir.dghs.gov.bd/identifier/bmdc-registration"
* uniqueId[=].preferred = true
* uniqueId[=].comment = "Identifier system URI defined by this IG."

* uniqueId[+].type = #uri
* uniqueId[=].value = "https://fhir.dghs.gov.bd/core/identifier/bmdc-registration"
* uniqueId[=].preferred = false
* uniqueId[=].comment = "Legacy identifier used in the Practitioner example before this namespace was fixed."
* uniqueId[=].period.end = "2026-10-18"
