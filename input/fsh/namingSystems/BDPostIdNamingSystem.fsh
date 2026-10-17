// ============================================================
// BDPostIdNamingSystem.fsh
// NamingSystem for the identifier namespace https://hris.mohfw.gov.bd/identifier/post-id
// The IG defines the URI string; the responsible body issues the identifiers.
// Identifier URIs are exact-match keys in vendor data: never change or repurpose them.
// ============================================================

Instance: bd-post-id
InstanceOf: NamingSystem
Usage: #definition
Title: "HRIS Sanctioned Post ID"
Description: """
Identifier of a sanctioned post (a designation at a facility) in HRIS. Identifies the seat, not the person.

Identifier system URI: https://hris.mohfw.gov.bd/identifier/post-id
"""

* name = "BDPostId"
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
* uniqueId[=].value = "https://hris.mohfw.gov.bd/identifier/post-id"
* uniqueId[=].preferred = true
* uniqueId[=].comment = "Identifier system URI defined by this IG."

