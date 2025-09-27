// ---------------------------
// CodeSystem for BD Blood Groups
// ---------------------------
CodeSystem: BDBloodGroupCS
Id: bd-blood-groups
Title: "Bangladesh Blood Group CodeSystem"
Description: "Blood group codes according to CCDS guideline"
* ^url = "https://fhir.dghs.gov.bd/core/CodeSystem/bd-blood-groups"
* ^content = #complete
* #1 "O Positive"
* #2 "O Negative"
* #3 "A Positive"
* #4 "A Negative"
* #5 "B Positive"
* #6 "B Negative"
* #7 "AB Positive"
* #8 "AB Negative"

// ---------------------------
// ValueSet for BD Blood Groups
// ---------------------------
ValueSet: BDBloodGroupVS
Id: bd-blood-group-vs
Title: "Bangladesh Blood Group ValueSet"
Description: "Blood group value set according to CCDS guideline"
* include codes from system BDBloodGroupCS
