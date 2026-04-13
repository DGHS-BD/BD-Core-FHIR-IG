Instance: BDOrganizationExample
InstanceOf: BDOrganization
Usage: #example
Title: "Example of a Bangladesh Organization"
Description: "Example for DMCH using the Facility Code 10000033"

// Strictly following 'identifier 1..* MS' from your profile
* identifier[0].value = "10000033"
* identifier[0].system = "http://hrm.dghs.gov.bd/facilities/code" // Using a generic DGHS system
* identifier[0].type = http://terminology.hl7.org/CodeSystem/v2-0203#FI "Facility ID"

* name = "Dhaka Medical College Hospital"

// Standard FHIR Address fields (No 'division' as a top-level field)
* address[0].line = "100 Ramna"
* address[0].city = "Dhaka"
* address[0].district = "Dhaka"
* address[0].country = "BD"

// To include Division without a 'does not exist' error, use the extension syntax:
* address[0].extension[0].url = "https://fhir.dghs.gov.bd/core/StructureDefinition/bd-division"
* address[0].extension[0].valueCodeableConcept = https://fhir.dghs.gov.bd/core/CodeSystem/bd-geocodes#30 "Dhaka"