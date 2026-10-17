// ============================================================
// BDProviderIdNamingSystem.fsh
// NamingSystem for the identifier namespace https://hris.mohfw.gov.bd/identifier/provider-id
// The IG defines the URI string; the responsible body issues the identifiers.
// Identifier URIs are exact-match keys in vendor data: never change or repurpose them.
// ============================================================

Instance: bd-provider-id
InstanceOf: NamingSystem
Usage: #definition
Title: "HRIS Provider ID"
Description: """
Provider identifier issued by HRIS. Held by government providers; private providers do not currently receive one.

Identifier system URI: https://hris.mohfw.gov.bd/identifier/provider-id
"""

* name = "BDProviderId"
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
* uniqueId[=].value = "https://hris.mohfw.gov.bd/identifier/provider-id"
* uniqueId[=].preferred = true
* uniqueId[=].comment = "Identifier system URI defined by this IG."

