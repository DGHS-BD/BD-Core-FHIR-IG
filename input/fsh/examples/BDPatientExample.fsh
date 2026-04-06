Instance: BDPatientExample
InstanceOf: BDPatientProfile
Usage: #example
Title: "Example of a Bangladesh Patient"
Description: "A minimal example for a patient satisfying name translations and address requirements."

// Required Name with English and Bangla Translations
* name[0].use = #official
* name[0].text = "Abul Kashem"
* name[0].text.extension[nameEn].extension[lang].valueCode = #en
* name[0].text.extension[nameEn].extension[content].valueString = "Abul Kashem"
* name[0].text.extension[nameBn].extension[lang].valueCode = #bn
* name[0].text.extension[nameBn].extension[content].valueString = "আবুল কাশেম"

// Required Gender and BirthDate (for clinical completeness)
* gender = #male
* birthDate = "1985-05-20"

// Identifier Slice: NID Example
* identifier[NID].type.coding.system = "https://fhir.dghs.gov.bd/core/CodeSystem/bd-identifier-type"
* identifier[NID].type.coding.code = #NID
* identifier[NID].value = "1234567890"

// --- Address with required extensions ---
* address[0].use = #home
* address[0].line = "House 12, Road 5"
* address[0].city = "Dhamrai"
* address[0].district = "Dhaka" // This is a native field in your profile
* address[0].postalCode = "1350"
* address[0].country = "BD"

// The "Division" extension (Must match the name in BDAddress)
* address[0].extension[division].valueCodeableConcept = https://fhir.dghs.gov.bd/core/CodeSystem/bd-geo-codes#30 "Dhaka"

// The "Upazilla" extension (Must match the name in BDAddress)
* address[0].extension[upazilla].valueCodeableConcept = https://fhir.dghs.gov.bd/core/CodeSystem/bd-geo-codes#3026 "Dhamrai"

// Optional Religion Extension
* extension[religion].valueCodeableConcept = https://fhir.dghs.gov.bd/core/CodeSystem/bd-religions-cs#islam "Islam"