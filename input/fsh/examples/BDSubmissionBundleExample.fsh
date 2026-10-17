Instance: BDSubmissionBundleExample
InstanceOf: BDSubmissionBundle
Usage: #example
Title: "Example of a Submission Bundle"
Description: "A bundle declaring its sending facility (DMCH, HRIS facility code 10000033) in meta.tag. Reduced to the facility, practitioner and role; a real submission also carries the clinical resources."

* meta.tag[sendingFacility].system = $BD-FACILITY-CODE
* meta.tag[sendingFacility].code = #10000033
* type = #collection
* entry[0].fullUrl = "https://fhir.dghs.gov.bd/core/Organization/BDOrganizationExample"
* entry[0].resource = BDOrganizationExample
* entry[+].fullUrl = "https://fhir.dghs.gov.bd/core/Practitioner/BDPractitionerExample"
* entry[=].resource = BDPractitionerExample
* entry[+].fullUrl = "https://fhir.dghs.gov.bd/core/PractitionerRole/BDPractitionerRoleExample"
* entry[=].resource = BDPractitionerRoleExample
