Instance: BDPractitionerExample
InstanceOf: BDPractitioner
Usage: #example
Title: "Example of a Bangladesh Practitioner"
Description: "A government physician with an HRIS provider ID and a BMDC registration number. Identifier values are illustrative, not real."

// HRIS provider ID (government providers)
* identifier[hrisId].system = $BD-PROVIDER-ID
* identifier[hrisId].value = "100001"

// BMDC (Bangladesh Medical & Dental Council) registration number
* identifier[bmdcReg].system = $BMDC-REG
* identifier[bmdcReg].value = "A-12345"
* identifier[bmdcReg].type = http://terminology.hl7.org/CodeSystem/v2-0203#MD "Medical License number"

// name.text is the official full name and is required
* name[0].use = #official
* name[0].text = "Dr. Tanvir Ahmed"

// Contact Information
* telecom[0].system = #phone
* telecom[0].value = "+8801712345678"
* telecom[0].use = #work

* gender = #male
