Extension: Nationality
Id: nationality
Title: "Patient Nationality"
Description: "Nationality of the patient based on Bangladesh country list."
* ^url = "https://fhir.dghs.gov.bd/core/StructureDefinition/nationality"

// Define where this extension can be used
* ^context[0].type = #element
* ^context[0].expression = "Patient"

// Only one value, bound to your ValueSet
* value[x] only CodeableConcept
* valueCodeableConcept from https://fhir.dghs.gov.bd/core/ValueSet/bd-country-list-valueset (required)