Profile: BDFacility
Id: bd-facility
Parent: BDOrganization
Title: "Health Facility Organization for Bangladesh"
Description: """An Organization that is a health facility registered in the HRIS facility registry.
The HRIS facility code is the single national facility identifier; other systems (DHIS2, OpenMRS, OpenSRP) use the same code, so no other facility identifier slices are defined."""

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Sliced by identifier namespace"
* identifier contains facilityCode 1..1 MS
* identifier[facilityCode].system = $BD-FACILITY-CODE
* identifier[facilityCode].value 1..1
