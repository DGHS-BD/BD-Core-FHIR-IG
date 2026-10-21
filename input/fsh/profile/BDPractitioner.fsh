// @Name: Profile
// @Description: Profile of the Practitioner resource for Bangladesh.

Profile: BDPractitioner
Id: bd-practitioner
Parent: Practitioner
Title: "Practitioner for Bangladesh"
Description: """A health professional. Identifiers are sliced by registry/council namespace. Slicing is open: practitioners of councils without a defined slice may carry other identifiers.
There is deliberately NO invariant requiring one of the named identifiers. Whether a practitioner must be verified, and against which registry, depends on the sending facility and the practitioner's role in the bundle (see the Validation page).
The facilityStaffId slice is for staff who hold no licence or registration number (for example laboratory technologists): a staff identifier that is unique within the facility that assigns it.
name.text carries the practitioner's official full name. It is required because it is compared with the registry record for practitioners that are verified."""

* identifier 1..* MS
* identifier.system 1..1
* identifier.value 1..1
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Sliced by registry/council namespace"
* identifier contains
    hrisId 0..1 MS and
    bmdcReg 0..1 MS and
    bnmcReg 0..1 MS and
    facilityStaffId 0..1 MS

* identifier[hrisId].system = $BD-PROVIDER-ID
* identifier[bmdcReg].system = $BMDC-REG
* identifier[bnmcReg].system = $BNMC-REG
* identifier[facilityStaffId].system = $BD-FACILITY-STAFF-ID

* name 1..* MS
* name.text 1..1
* qualification MS
