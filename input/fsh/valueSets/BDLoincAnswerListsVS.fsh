ValueSet:    BDLoincAnswerListsVS
Id:          bd-loinc-answer-lists-valueset
Title:       "Bangladesh LOINC Answer Lists ValueSet"
Description: """
LOINC answer codes (LA-prefixed, property Answer) and answer lists
(LL-prefixed, property AnswerList) for coded laboratory results. Used as
Observation.valueCodeableConcept in bd-lab-result-observation for ordinal and
nominal scale results.

This value set is the guide's broad definition. It is expressed with LOINC
filters, so no codes are enumerated here. The curated national list is the value
set `loinc-answer-lists` on the national terminology server, which enforces membership at
runtime through $validate-code. Bindings to this value set are extensible.
"""

* ^url = "https://fhir.dghs.gov.bd/core/ValueSet/bd-loinc-answer-lists-valueset"
* ^status = #draft
* ^experimental = true
* ^version = "0.2.0"
* ^publisher = "Directorate General of Health Services (DGHS), MoHFW, Bangladesh"
* ^contact.name = "DGHS Health Information Unit"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://dghs.gov.bd"
* ^jurisdiction = urn:iso:std:iso:3166#BD "Bangladesh"
* ^copyright = "This content from LOINC® is copyright © 1995 Regenstrief Institute, Inc. and the LOINC Committee, and available at no cost under the license at http://loinc.org/terms-of-use."
* ^immutable = false

* include codes from system http://loinc.org
    where Answer exists true
* include codes from system http://loinc.org
    where AnswerList exists true
