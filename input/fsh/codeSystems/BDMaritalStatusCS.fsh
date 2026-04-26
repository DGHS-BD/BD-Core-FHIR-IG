//codeSystems/bd-regions.fsh
CodeSystem: BDMaritalStatusCS
Id: bd-marital-status
Title: "Bangladesh Marital Status"
* ^url =  "https://fhir.dghs.gov.bd/core/CodeSystem/bd-marital-status"

* #1 "Unmarried" "Unmarried"
* #2 "Married" "Married"
* #3 "Widowed" "Widowed"
* #4 "Separated" "Separated"
* #5 "Divorced" "Divorced"

ValueSet: BDMaritalStatusVS 
Id: bd-marital-status-valueset
Title: "Bangladesh Marital Status ValueSet"
Description: "Marital status value set according to CCDS guideline"
* ^url =  "https://fhir.dghs.gov.bd/core/ValueSet/bd-marital-status-valueset"
* include codes from system https://fhir.dghs.gov.bd/core/CodeSystem/bd-marital-status
