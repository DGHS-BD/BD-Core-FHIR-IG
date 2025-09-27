// @Name: Profile
// @Description: Example of a profile of the Patient resource. This example includes a few of the most commonly used constraints and documentation features of FHIR profiles.

Profile:     bdAddress
Id:             bd-address
Parent:      Address
Title:         "Address for Bangladesh"
Description: "Address for Bangladesh Standard"


* country 1..1 MS
* extension contains Division named division 1..1 MS