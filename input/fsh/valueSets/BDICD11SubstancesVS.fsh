ValueSet: BDICD11SubstancesVS
Id: icd11-substances-valueset
Title: "ICD-11 Substances Value Set"
Description: """
Value set containing all ICD-11 MMS substance and medicament concepts
(XM-prefix concept class: Substance) maintained in the national OCL
terminology server at https://tr.ocl.dghs.gov.bd.

This value set contains 7,776 substance concepts and is used for coding
active pharmaceutical ingredients in the BDMedication.ingredient element
to support IPS generation and cross-border data exchange.

This value set is defined and maintained in OCL. It is declared here as a
minimal stub to allow IG publisher binding resolution only.

**OCL collection canonical:** https://fhir.dghs.gov.bd/core/ValueSet/icd11-substances-valueset
**OCL FHIR endpoint:** https://tr.ocl.dghs.gov.bd/orgs/MoHFW/collections/icd11-substances-valueset/
"""

* ^url = "https://fhir.dghs.gov.bd/core/ValueSet/icd11-substances-valueset"
* ^version = "2025-01"
* ^status = #active
* ^experimental = false
* ^publisher = "World Health Organization (WHO) — served via DGHS National OCL"
* ^contact.name = "DGHS Health Informatics Unit"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://dghs.gov.bd"
* ^jurisdiction = urn:iso:std:iso:3166#BD "Bangladesh"
* ^immutable = false

* include codes from system http://id.who.int/icd/release/11/mms
    where concept-class = "Substance"