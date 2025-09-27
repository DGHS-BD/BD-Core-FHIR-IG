CodeSystem: BDAddressCS
Id: bd-address-cs
Title: "Bangladesh Address Codes"
Description: "Bangladesh Address Codes"
* ^url = "https://fhir.dghs.gov.bd/core/CodeSystem/bd-divisions"
* #30 "Dhaka"
* #20 "Chattogram"
* #50 "Rajshahi"
* #55 "Rangpur"
* #40 "Khulna"
* #10 "Barishal"
* #60 "Sylhet"
* #45 "Mymensingh"
* #3026 "Dhaka"


ValueSet: BDDivisionsVS
Id: bd-division-code-vs
Title: "Bangladesh Division ValueSet"
Description: "Bangladesh Division Codes (only two-digit codes)"
* ^url = "https://fhir.dghs.gov.bd/core/ValueSet/bd-divisions"

// include only codes that are exactly 2 digits
* include codes from system https://fhir.dghs.gov.bd/core/CodeSystem/bd-divisions
    where code regex "^[0-9]{2}$"


ValueSet: BDDistrictVS
Id: bd-district-code-vs
Title: "Bangladesh district ValueSet"
Description: "Bangladesh district Codes (only two-digit codes)"
* ^url = "https://fhir.dghs.gov.bd/core/ValueSet/bd-districts"

// include only codes that are exactly 2 digits
* include codes from system https://fhir.dghs.gov.bd/core/CodeSystem/bd-districts
    where code regex "^[0-9]{4}$"


ValueSet: BDCityCorporationVS
Id: bd-city-corporations-code-vs
Title: "Bangladesh district ValueSet"
Description: "Bangladesh district Codes (only two-digit codes)"
* ^url = "https://fhir.dghs.gov.bd/core/ValueSet/bd-city-corporations"

// include only codes that are exactly 2 digits
* include codes from system https://fhir.dghs.gov.bd/core/CodeSystem/bd-city-corporations
    where code regex "^[0-9]{6}$"


ValueSet: BDUpazillaVS
Id: bd-upazilla-code-vs
Title: "Bangladesh district ValueSet"
Description: "Bangladesh district Codes (only two-digit codes)"
* ^url = "https://fhir.dghs.gov.bd/core/ValueSet/bd-upazilla"

// include only codes that are exactly 2 digits
* include codes from system https://fhir.dghs.gov.bd/core/CodeSystem/bd-upazilla
    where code regex "^[0-9]{8}$"