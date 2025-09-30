
Profile:     BDEncounterProfile
Id:          bd-encounter
Parent:      Encounter
Title:       "Encounter Profile for Bangladesh"
Description: "Profile of Encounter Bangladesh Standard"

* identifier 1..*

* status 1..1 MS
* status from BDEncounterStatusSubsetVS

* class 1..1 MS
* class from BDEncounterClassSubsetVS

* subject  1..1 MS
//* subject from https://fhir.dghs.gov.bd/core/StructureDefinition/bd-patient

* basedOn 0..1 MS

* partOf 0..1 MS

* serviceProvider 1..1 MS

* participant 1..* MS
* participant.period 1..1 MS

* diagnosis 0..* MS
* diagnosis.condition only Reference(BDConditionProfile)


//* admission 0..* MS
//* admission.dischargeDisposition 0..1 MS
//* encounter.admission.dischargeDisposition 0..1
