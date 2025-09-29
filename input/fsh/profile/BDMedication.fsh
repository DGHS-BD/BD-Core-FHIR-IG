// @Name: Profile
// @Description: Example of a profile of the Medication resource. This example includes a few of the most commonly used constraints and documentation features of FHIR profiles.

Profile: BDMedication
Id: bd-medication
Parent: Medication
Title: "Medication Profile for Bangladesh-V2"
Description: "Profile of Medication Bangladesh Standard V2"

* form 1..1 MS
* form from BDMedicationDoseFormVS

* code 1..1 MS
* code from BDMedicationVS

* ingredient 1..* MS
* ingredient.strength 1..1 MS