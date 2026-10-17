// @Name: Profile
// @Description: Profile of the Organization resource for Bangladesh.

Profile: BDOrganization
Id: bd-organization
Parent: Organization
Title: "Organization for Bangladesh"
Description: """Any organization exchanged in Bangladesh: facilities, payers, programme bodies, organizations outside Bangladesh.
Deliberately loose: it requires well-formed identifiers but NOT a facility code. Health facilities registered in the HRIS facility registry use BDFacility."""

* identifier 1..* MS
* identifier.system 1..1
* identifier.value 1..1
* name MS
