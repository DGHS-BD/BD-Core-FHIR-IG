ValueSet: BDMedicationDoseFormVS
Id: bd-medication-dose-form
Title: "Medication Dose Form Value Set"
Description: """
Value set containing pharmaceutical dose form concepts from the European
Directorate for the Quality of Medicines (EDQM) Standard Terms, domain:
Pharmaceutical Dose Forms (PDF).

This value set is used to code the physical form of a medication product
in BDMedication.form. EDQM Standard Terms are maintained and versioned
by the Council of Europe and are the WHO-recommended international standard
for pharmaceutical dose form coding.

Concepts are loaded into the national OCL terminology server at
https://tr.ocl.dghs.gov.bd under the MoHFW organisation as source EDQM-PDF.

**Binding:** preferred on BDMedication.form — systems should use EDQM
codes when populating dose form, but omission is permitted. A mapping from
DGDA plain text dose forms to EDQM codes is planned for a future IG version.

**Code system canonical:** https://standardterms.edqm.eu
**OCL source:** https://tr.ocl.dghs.gov.bd/#/orgs/MoHFW/sources/EDQM-PDF/
"""

* ^url = "https://fhir.dghs.gov.bd/core/ValueSet/bd-medication-dose-form"
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^publisher = "DGHS Health Informatics Unit"
* ^contact.name = "DGHS Health Informatics Unit"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://dghs.gov.bd"
* ^jurisdiction = urn:iso:std:iso:3166#BD "Bangladesh"
* ^immutable = false

* include codes from system https://standardterms.edqm.eu