//// this code systems for Identifier types

CodeSystem: BangladeshIdentifierType
Id: bd-identifier-type
Title: "Bangladesh Identifier Types"
Description: "Codes identifying the type of identifiers used in Bangladesh."
* ^url =  "https://fhir.dghs.gov.bd/core/CodeSystem/bd-identifier-type"
* ^caseSensitive = true
* ^experimental = false

* #NID "National ID"
* #BRN "Birth Registration Number"
* #UHID "Unique Health ID"


ValueSet: BangladeshIdentifierTypeVS
Id: bd-identifier-type-valueset
Title: "Bangladesh Identifier Type"
Description: "Bangladesh Standard Identifier type"
* ^url =  "https://fhir.dghs.gov.bd/core/ValueSet/bd-identifier-type-valueset"
// * include codes from valueset http://hl7.org/fhir/ValueSet/identifier-type /// use name or uri
* include codes from system https://fhir.dghs.gov.bd/core/CodeSystem/bd-identifier-type

////////////// end identifier types