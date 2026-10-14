ValueSet:    BDLoincLabPanelsVS
Id:          bd-loinc-lab-panels-valueset
Title:       "Bangladesh LOINC Lab Panels ValueSet"
Description: """
LOINC laboratory panel (order) codes for Bangladesh: LOINC codes of the
laboratory class (CLASSTYPE 1) that are orders (ORDER_OBS = Order) and of
panel type (PanelType = Panel). Used as Observation.code in
bd-lab-panel-observation.

This value set is the guide's broad definition. It is expressed with LOINC
filters, so no codes are enumerated here. The curated national list is the value
set `loinc-lab-panels` on the national terminology server, which enforces membership at
runtime through $validate-code. Bindings to this value set are extensible.
"""

* ^url = "https://fhir.dghs.gov.bd/core/ValueSet/bd-loinc-lab-panels-valueset"
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
    where CLASSTYPE = "1" and ORDER_OBS = "Order" and PanelType = "Panel"
