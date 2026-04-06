Instance: BDEncounterExample
InstanceOf: BDEncounter
Usage: #example
Title: "Example of a Bangladesh Patient Encounter"
Description: "An example of an outpatient encounter for a Bangladesh patient."

* identifier[0].value = "ENC-2023-001"
* identifier[0].system = "https://fhir.dghs.gov.bd/core/identifier/encounter"

* status = #finished

// Must use a code from your BDEncounterClassSubsetVS
// Example using standard HL7 ActCode for ambulatory (outpatient)
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB "ambulatory"

// Reference the patient example we created in the previous step
* subject = Reference(BDPatientExample)

// serviceProvider is 1..1 in your profile
* serviceProvider = Reference(BDOrganizationExample) 

// participant and participant.period are 1..1
* participant[0].individual = Reference(BDPractitionerExample)
* participant[0].period.start = "2023-10-27T10:00:00Z"
* participant[0].period.end = "2023-10-27T10:30:00Z"