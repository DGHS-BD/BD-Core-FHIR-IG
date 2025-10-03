//codeSystems/bd-regions.fsh
CodeSystem: BDReligionsCS
Id: bd-religions
Title: "Bangladesh Religions"
* ^url =  "https://fhir.dghs.gov.bd/core/CodeSystem/bd-religions"

* #1 "Islam" "Muslim"
* #2 "Hinduism" "Hindu"
* #3 "Buddhism" "Buddhist"
* #4 "Christianity" "Christian"
* #8 "Refuse to disclose" "Patient declined to state religion"
* #9 "Not a believer" "Identifies as not having a religion"
* #0 "Other (specify)" "Other religion (to be specified in free text)"

ValueSet: BDReligionsVS 
Id: bd-religions-valueset
Title: "Bangladesh Religions ValueSet"
Description: "Religions value set according to CCDS guideline"
* ^url =  "https://fhir.dghs.gov.bd/core/ValueSet/bd-religions-valueset"
* include codes from system https://fhir.dghs.gov.bd/core/CodeSystem/bd-religions
