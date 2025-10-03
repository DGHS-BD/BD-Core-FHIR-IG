// ---------- ValueSet ----------
ValueSet: BDEncounterClassSubsetVS
Id: bd-encounter-class-subset
Title: "BD Encounter Class Subset"
Description: "Subset of EncounterClass limited to inpatient, ambulatory, and emergency."
* ^url = "https://fhir.dghs.gov.bd/core/ValueSet/bd-encounter-class-subset"
* ^status = #active
* ^experimental = false

// Explicitly include the three concepts from the core EncounterClass system
* include http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP "Inpatient"
* include http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB "Ambulatory"
* include http://terminology.hl7.org/CodeSystem/v3-ActCode#EMER "Emergency"
