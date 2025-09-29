// @Name: Profile
// @Description: Example of a profile of the MedicationRequest resource. This example includes a few of the most commonly used constraints and documentation features of FHIR profiles.

Profile: BDMedicationRequest
Id: bd-medication-request
Parent: MedicationRequest
Title: "Medication Request Profile for Bangladesh-V2"
Description: "Profile of MedicationRequest Bangladesh Standard V2"



* identifier 1..*
* medication[x] 1..1 MS
* medication[x] only Reference(BDMedication) or CodeableConcept
* subject only Reference(BDPatientProfile)

// TODO: BDEncounter referencing
* authoredOn 1..1
* requester 1..1
* reported[x] 1..1

* requester only Reference(BDPractitioner)
* reported[x] only Reference(BDOrganization)
