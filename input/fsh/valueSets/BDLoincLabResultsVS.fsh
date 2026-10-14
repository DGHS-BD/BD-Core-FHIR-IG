ValueSet:    BDLoincLabResultsVS
Id:          bd-loinc-lab-results-valueset
Title:       "Bangladesh LOINC Lab Results ValueSet"
Description: """
LOINC laboratory result (observation) codes for Bangladesh: LOINC codes of
the laboratory class (CLASSTYPE 1) that can be reported as observations
(ORDER_OBS = Observation, or Both). Panel-only order codes are not included.
Used as Observation.code in bd-lab-result-observation.

This value set is the guide's broad definition. It is expressed with LOINC
filters, so no codes are enumerated here. The curated national list is the value
set `loinc-lab-results` on the national terminology server, which enforces membership at
runtime through $validate-code. Bindings to this value set are extensible.
"""

* ^url = "https://fhir.dghs.gov.bd/core/ValueSet/bd-loinc-lab-results-valueset"
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
    where CLASSTYPE = "1" and ORDER_OBS = "Both"
* include codes from system http://loinc.org
    where CLASSTYPE = "1" and ORDER_OBS = "Observation"
