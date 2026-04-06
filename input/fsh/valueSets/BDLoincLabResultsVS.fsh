ValueSet:    BDLoincLabResultsVS
Id:          bd-loinc-lab-results-valueset
Title:       "Bangladesh LOINC Lab Results ValueSet"
Description: "LOINC leaf-level laboratory result codes for Bangladesh. Includes 
individual component/result codes from LOINC 2.82 scoped to the Universal Lab Orders 
ValueSet. Excludes discouraged and non-laboratory codes. Used as Observation.code 
in bd-lab-result-observation."

* ^url = "https://fhir.dghs.gov.bd/core/ValueSet/bd-loinc-lab-results-valueset"
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
    where concept in "https://fhir.dghs.gov.bd/core/ValueSet/loinc-lab-results"
