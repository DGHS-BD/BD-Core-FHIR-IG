//codeSystems/bd-regions.fsh
CodeSystem: bd-religions
Id: bangladesh-religions-cs
Title: "Bangladesh Religions"
* ^url =  "https://fhir.dghs.gov.bd/core/CodeSystem/bd-religions"

* #1 "Islam" "Muslim"
* #2 "Hinduism" "Hindu"
* #3 "Buddhism" "Buddhist"
* #4 "Christianity" "Christian"
* #8 "Refuse to disclose" "Patient declined to state religion"
* #9 "Not a believer" "Identifies as not having a religion"
* #0 "Other (specify)" "Other religion (to be specified in free text)"

ValueSet: bd-religions
Id: bd-religions-vs
Title: "Bangladesh Religions ValueSet"
Description: "Religions value set according to CCDS guideline"
* ^url =  "https://fhir.dghs.gov.bd/core/ValueSet/bd-religions"
* include codes from system https://fhir.dghs.gov.bd/core/CodeSystem/bd-religions
