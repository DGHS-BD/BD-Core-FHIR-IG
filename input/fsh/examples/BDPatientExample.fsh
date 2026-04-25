Instance: BDPatientExample
InstanceOf: BDPatient
Usage: #example
Title: "Example of a Bangladesh Patient"
Description: "A minimal example for a patient satisfying name translations and address requirements."

// Required Name with English and Bangla Translations using separate extensions
* name[0].use = #official
* name[0].text = "Abul Kashem"
* name[0].text.extension[nameEn].valueString = "Abul Kashem"
* name[0].text.extension[nameBn].valueString = "আবুল কাশেম"

// Required Gender and BirthDate
* gender = #male
* birthDate = "1985-05-20"

// Identifier Slice: NID Example
* identifier[NID].type.coding.system = "https://fhir.dghs.gov.bd/core/CodeSystem/bd-identifier-type"
* identifier[NID].type.coding.code = #NID
* identifier[NID].type.text = "Organization identifier"
* identifier[NID].value = "1234567890"

// Address with required extensions
* address[0].use = #home
* address[0].district = "3026"
* address[0].country = "BD"

// Division extension
* address[0].extension[division].valueCodeableConcept = https://fhir.dghs.gov.bd/core/CodeSystem/bd-geocodes#30 "Dhaka"

// Upazilla extension
* address[0].extension[upazilla].valueCodeableConcept = https://fhir.dghs.gov.bd/core/CodeSystem/bd-geocodes#10040028 "Dhamrai"

// Optional Religion Extension
* extension[religion].valueCodeableConcept = https://fhir.dghs.gov.bd/core/CodeSystem/bd-religions#1 "Islam"