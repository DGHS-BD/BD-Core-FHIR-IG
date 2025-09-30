

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
* reasonReference only Reference(Condition or Observation or DiagnosticReport)

* vaccineCode 1..1
* vaccineCode from BDVaccineValueSet (required)

//* ^url = "https://fhir.dghs.gov.bd/core/StructureDefinition/bd-medication"

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
* patient only Reference(BDPatientProfile) 

* encounter 1..1
* encounter ^definition = "Encounter during which vaccine was administered"
* encounter only Reference(BDEncounterProfile)

* occurrence[x] 1..1 

* location 0..1
* location ^definition = "Location where vaccine was administered"
//* location only Reference(Location)

* site 0..1
* site ^definition = "Body site of administration"
* site from BDImmunizationSiteValueSet

* route 0..1
* route ^definition = "Route of administration"
* route from BDImmunizationRouteValueSet

* doseQuantity 0..1
* doseQuantity ^definition = "Amount of vaccine administered"
* doseQuantity.system = "http://unitsofmeasure.org"

* performer 0..* 
* performer ^definition = "Individual who performed the immunization"
* performer.actor only Reference(BDPractitioner)

* reaction 0..*
* reaction ^definition = "Adverse reaction following immunization"
* reaction.detail only Reference(Observation)