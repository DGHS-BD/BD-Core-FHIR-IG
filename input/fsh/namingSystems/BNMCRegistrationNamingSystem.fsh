// ============================================================
// BNMCRegistrationNamingSystem.fsh
// NamingSystem for the identifier namespace https://fhir.dghs.gov.bd/identifier/bnmc-registration
// The IG defines the URI string; the responsible body issues the identifiers.
// Identifier URIs are exact-match keys in vendor data: never change or repurpose them.
// ============================================================

Instance: bnmc-registration
InstanceOf: NamingSystem
Usage: #definition
Title: "BNMC Registration Number"
Description: """
Registration number issued by the Bangladesh Nursing and Midwifery Council to nurses and midwives. BNMC does not publish an identifier URI; the URI is defined by this IG in the DGHS namespace. If BNMC publishes its own, it is added here as an alias.

Identifier system URI: https://fhir.dghs.gov.bd/identifier/bnmc-registration
"""

* name = "BNMCRegistration"
* status = #draft
* kind = #identifier
* date = "2026-10-18"
* publisher = "Directorate General of Health Services (DGHS), MoHFW, Bangladesh"
* contact.name = "DGHS Health Informatics Unit"
* contact.telecom.system = #url
* contact.telecom.value = "https://dghs.gov.bd"
* jurisdiction = urn:iso:std:iso:3166#BD "Bangladesh"
* responsible = "Bangladesh Nursing and Midwifery Council (BNMC)"

* uniqueId[+].type = #uri
* uniqueId[=].value = "https://fhir.dghs.gov.bd/identifier/bnmc-registration"
* uniqueId[=].preferred = true
* uniqueId[=].comment = "Identifier system URI defined by this IG."

