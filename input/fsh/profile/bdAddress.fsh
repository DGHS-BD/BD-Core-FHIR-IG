// @Name: Profile
// @Description: Example of a profile of the Address resource for Bangladesh.

Profile:     BDAddress
Id:             bd-address
Parent:      Address
Title:         "Address for Bangladesh"
Description: "Address for Bangladesh Standard"


* country 1..1 MS
* extension contains Division named division 1..1 MS

* district 1..1 MS
* district from BDDistrictsVS

* extension contains Upazillas named upazilla 1..1 MS