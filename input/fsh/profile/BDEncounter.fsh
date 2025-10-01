
Profile:     BDEncounterProfile
Id:          bd-encounter
Parent:      Encounter
Title:       "Encounter Profile for Bangladesh"
Description: "Profile of Encounter Bangladesh Standard"

* identifier 1..*

* status 1..1 
* status from BDEncounterStatusSubsetVS
* status ^short = "Encounter status in BD"
* status ^definition = "Status of patient encounter (planned, in-progress, finished, cancelled)"

* class 1..1 
* class from BDEncounterClassSubsetVS

* subject  1..1
//* subject from https://fhir.dghs.gov.bd/core/StructureDefinition/bd-patient

* basedOn 0..1 MS
//* basedOn only Reference (CarePlan or DeviceRequest or MedicationRequest or ServiceRequest)

* partOf 0..1 MS

* serviceProvider 1..1

* participant 1..*
* participant.period 1..1 

* diagnosis 0..* MS
* diagnosis.condition only Reference(BDConditionProfile)




* hospitalization.dischargeDisposition 0..1 MS