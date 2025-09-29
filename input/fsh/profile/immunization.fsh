Profile:     BDImmunizationProfile
Id:          bd-immunization
Parent:      Immunization
Title:       "Patient Immunization Profile for Bangladesh"
Description: "Patients Immunization Bangladesh Standard"
* ^url =  "https://fhir.dghs.gov.bd/core/StructureDefinition/bd-immunization"

* identifier 1..*
* identifier ^short = "Identifier"
* identifier ^definition = "Unique identifier for the vaccination event"
* ^url =  "https://fhir.dghs.gov.bd/core/identifier/bd-immunization"

* vaccineCode 1..1
* vaccineCode from BDVaccineValueSet (required)



