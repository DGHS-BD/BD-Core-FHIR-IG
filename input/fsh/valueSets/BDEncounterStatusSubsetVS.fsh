// ---------- ValueSet ----------
ValueSet: BDEncounterStatusSubsetVS
Id: bd-encounter-status-subset
Title: "BD Encounter Status Subset"
Description: "Subset of EncounterStatus limited to planned, in-progress, finished, and cancelled."
* ^url = "https://fhir.dghs.gov.bd/core/ValueSet/bd-encounter-status-subset"
* ^status = #active
* ^experimental = false

// Explicitly include the four concepts from the core code system
* include http://hl7.org/fhir/encounter-status#planned "Planned"
* include http://hl7.org/fhir/encounter-status#in-progress "In Progress"
* include http://hl7.org/fhir/encounter-status#finished "Finished"
* include http://hl7.org/fhir/encounter-status#cancelled "Cancelled"

