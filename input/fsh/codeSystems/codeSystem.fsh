//// this code systems for Identifier types

CodeSystem: BangladeshIdentifierType
Id: bangladesh-identifier-type-cs
Title: "Bangladesh Identifier Types"
* ^url =  "https://fhir.dghs.gov.bd/core/ValueSet/bd-identifier-type"

* #NID "National ID"
* #BRN "Birth Registration Number"
* #UID "Unique ID"


ValueSet: BangladeshIdentifierTypeVS
Id: bangladesh-identifier-type-vs
Title: "Bangladesh Identifier Type"
Description: "Bangladesh Standard Identifier type"
// * include codes from valueset http://hl7.org/fhir/ValueSet/identifier-type /// use name or uri
* include codes from system https://fhir.dghs.gov.bd/core/ValueSet/bd-identifier-type

////////////// end identifier types