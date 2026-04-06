ValueSet:    BDLoincAnswerListsVS
Id:          bd-loinc-answer-lists-valueset
Title:       "Bangladesh LOINC Answer Lists ValueSet"
Description: "LOINC answer codes (LA-prefixed) and answer list groupers (LL-prefixed) 
for Bangladesh laboratory results. Includes all answer codes referenced by in-scope 
lab result codes from LOINC 2.82. Used as Observation.valueCodeableConcept in 
bd-lab-result-observation for ordinal and nominal scale results."

* ^url = "https://fhir.dghs.gov.bd/core/ValueSet/bd-loinc-answer-lists-valueset"
* ^status = #draft
* ^experimental = true
* ^version = "0.1.0"
* ^publisher = "Directorate General of Health Services (DGHS), MoHFW, Bangladesh"
* ^contact.name = "DGHS Health Information Unit"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://dghs.gov.bd"
* ^jurisdiction = urn:iso:std:iso:3166#BD "Bangladesh"
* ^copyright = "This content from LOINC® is copyright © 1995 Regenstrief Institute, Inc. and the LOINC Committee, and available at no cost under the license at http://loinc.org/terms-of-use."
* ^immutable = false

* include codes from system http://loinc.org
    where concept in "https://fhir.dghs.gov.bd/core/ValueSet/loinc-answer-lists"
