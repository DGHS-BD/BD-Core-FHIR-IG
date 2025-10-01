
Profile:     BDEncounterProfile
Id:          bd-encounter
Parent:      Encounter
Title:       "Encounter Profile for Bangladesh"
Description: "Profile of Encounter Bangladesh Standard"

* identifier 1..*

* status 1..1 MS
* status from BDEncounterStatusSubsetVS
* status ^definition = "planned, in-progress, finished, cancelled"

* class 1..1 MS
* class from BDEncounterClassSubsetVS

* subject  1..1 MS
//* subject from https://fhir.dghs.gov.bd/core/StructureDefinition/bd-patient

* basedOn 0..1 MS
//* basedOn only Reference (CarePlan or DeviceRequest or MedicationRequest or ServiceRequest)

* partOf 0..1 MS

* serviceProvider 1..1 MS

* participant 1..* MS
* participant.period 1..1 MS

* diagnosis 0..* MS
* diagnosis.condition only Reference(BDConditionProfile)


//* admission 0..* MS
//* admission.dischargeDisposition 0..1 MS

* hospitalization.dischargeDisposition 0..1 MS