Instance: BDOrganizationExample
InstanceOf: BDFacility
Usage: #example
Title: "Example of a Bangladesh Health Facility"
Description: "Example for DMCH using the HRIS Facility Code 10000033"

* identifier[facilityCode].system = $BD-FACILITY-CODE
* identifier[facilityCode].value = "10000033"
* identifier[facilityCode].type = http://terminology.hl7.org/CodeSystem/v2-0203#FI "Facility ID"

* name = "Dhaka Medical College Hospital"

// Standard FHIR Address fields (No 'division' as a top-level field)
* address[0].line = "100 Ramna"
* address[0].city = "Dhaka"
* address[0].district = "Dhaka"
* address[0].country = "BD"

// To include Division without a 'does not exist' error, use the extension syntax:
* address[0].extension[0].url = "https://fhir.dghs.gov.bd/core/StructureDefinition/bd-divisions"
* address[0].extension[0].valueCodeableConcept = https://fhir.dghs.gov.bd/core/CodeSystem/bd-geocodes#30 "Dhaka"
