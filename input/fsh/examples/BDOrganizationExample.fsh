Instance: BDOrganizationExample
InstanceOf: BDOrganization
Usage: #example
Title: "Example of a Bangladesh Healthcare Organization"
Description: "An example of a hospital or clinic identifier for the DGHS HIE."

// Required Identifier (1..* MS)
// Using a mock DGHS Facility ID (often referred to as 'Org Code' in Bangladesh)
* identifier[0].system = "https://fhir.dghs.gov.bd/core/identifier/facility-id"
* identifier[0].value = "10001234"
* identifier[0].type = http://terminology.hl7.org/CodeSystem/v2-0203#FI "Facility ID"

* name = "Dhaka Medical College Hospital"

// Optional but helpful contact info
* telecom[0].system = #phone
* telecom[0].value = "+88029669340"
* telecom[0].use = #work

* address[0].line = "100 Ramna"
* address[0].city = "Dhaka"
* address[0].district = "Dhaka"
* address[0].division = "Dhaka"
* address[0].country = "BD"