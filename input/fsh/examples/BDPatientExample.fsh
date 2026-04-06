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
* identifier[NID].system = "http://dghs.gov.bd/identifier/nid"
* identifier[NID].value = "1234567890"
* identifier[NID].type = http://terminology.hl7.org/CodeSystem/v2-0203#NI "National unique individual identifier"

// Required Address using BDAddress profile
* address[0].line = "123 Green Road"
* address[0].city = "Dhaka"
* address[0].district = "Dhaka"
* address[0].division = "Dhaka"
* address[0].country = "BD"

// Optional Religion Extension
* extension[religion].valueCodeableConcept = https://fhir.dghs.gov.bd/core/CodeSystem/bd-religions-cs#islam "Islam"