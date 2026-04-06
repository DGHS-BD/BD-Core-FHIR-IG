Instance: BDPractitionerExample
InstanceOf: BDPractitioner
Usage: #example
Title: "Example of a Bangladesh Practitioner"
Description: "A licensed physician example for the Bangladesh HIE."

// Required Identifier (1..* MS)
// Using BMDC (Bangladesh Medical & Dental Council) registration number
* identifier[0].system = "https://fhir.dghs.gov.bd/core/identifier/bmdc-registration"
* identifier[0].value = "A-12345"
* identifier[0].type = http://terminology.hl7.org/CodeSystem/v2-0203#MD "Medical License number"

// Recommended Name
* name[0].use = #official
* name[0].family = "Ahmed"
* name[0].given[0] = "Tanvir"
* name[0].prefix[0] = "Dr."

// Contact Information
* telecom[0].system = #phone
* telecom[0].value = "+8801712345678"
* telecom[0].use = #work

// Gender (Commonly used in health records)
* gender = #male