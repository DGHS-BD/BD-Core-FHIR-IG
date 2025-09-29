CodeSystem: BDMedicationCodeSystem
Id: bd-medication-cs
Title: "Bangladesh Medication Codes"
Description: "Bangladesh Medication Codes"
* ^url = "https://fhir.dghs.gov.bd/core/CodeSystem/bd-medication-code"
// DGDA DAR Code "Brand Name"
* #394-0010-030 "Tubutol" "Ethambutol"
* #394-0011-030	"AFDCDT-2" "Isoniazid + Rifampicin"
* #394-0012-030	"AFDCDT-3" "Isoniazid + Pyrazinamide + Rifampicin"
* #394-0017-046	"Levetiracetam 250" "Levetiracetam"
* #394-0021-028	"Donepezil Hydrochloride 5" "Donepezil Hydrochloride"
* #355-0065-023	"Cefufine" "Cefuroxime"


// ---------------------------
// ValueSet for BD Medication
// ---------------------------
ValueSet: BDMedicationVS
Id: bd-medication-vs
Title: "Bangladesh Medication ValueSet"
Description: "Bangladesh Medication ValueSet"
* include codes from system BDMedicationCodeSystem
