// @Name: Profile
// @Description: Immunization Profile of the Bangladeshi Patient. 
Profile:     BDImmunizationProfile
Id:          bd-immunization
Parent:      Immunization
Title:       "Immunization Profile for Bangladesh"
Description: "Bangladesh Immunization Profile"
* ^url = "https://fhir.dghs.gov.bd/core/StructureDefinition/bd-immunization"


* identifier 1..*
* identifier ^short = "Unique identifier"
* identifier ^definition = "Unique identifier for the vaccination event"

* ^url = "https://fhir.dghs.gov.bd/core/identifier/bd-immunization"

* reasonReference 0..*


* vaccineCode 1..1
//* vaccineCode from BDVaccineValueSet (required)

* ^url = "https://fhir.dghs.gov.bd/core/StructureDefinition/bd-medication"

* manufacturer 0..1
* manufacturer ^short = "Manufacturer"
* manufacturer ^definition = "Vaccine manufacturer"
* ^url = "https://fhir.dghs.gov.bd/core/StructureDefinition/bd-organization"


* lotNumber 0..1 
* lotNumber ^short = "Vaccine Lot Number"
* lotNumber ^definition = "Vaccine lot or batch number"

* expirationDate 0..1
* expirationDate ^short = "Expiration Date"
* expirationDate ^definition = "Expiration date of vaccine lot"

* patient 1..1
* patient ^definition = "The patient receiving the vaccine"
//* patient from BD Patient Profile

* encounter 1..1
* encounter ^definition = "Encounter during which vaccine was administered"
//* encounter from BD Encounter Profile

* occurrence[x] 1..1 

* location 0..1
* location ^definition = "Location where vaccine was administered"
//* location from Location Profile
* ^url = "https://fhir.dghs.gov.bd/core/StructureDefinition/bd-location"

* site 0..1
* site ^definition = "Body site of administration"
//* site from BD Immunization Site

* route 0..1
* route ^definition = "Route of administration"
//* route from BD Immunization Route

* doseQuantity 0..1
* doseQuantity ^definition = "Amount of vaccine administered"
//* doseQuantity from UCUM Units
* ^url = "http://unitsofmeasure.org"

* performer 0..* 
* performer ^definition = "Individual who performed the immunization"
//* performer from BD Practitioner Profile
* ^url = "https://fhir.dghs.gov.bd/core/StructureDefinition/bd-practitioner"

* reaction 0..*
* reaction ^definition = "Adverse reaction following immunization"
//* reaction from BD Immunization Reaction
* ^url = "https://fhir.dghs.gov.bd/core/ValueSet/bd-immunization-reaction"


