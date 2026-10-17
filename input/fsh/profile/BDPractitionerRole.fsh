Profile: BDPractitionerRole
Id: bd-practitioner-role
Parent: PractitionerRole
Title: "Practitioner Role for Bangladesh"
Description: """One affiliation of a practitioner with a health facility. A practitioner may have several (one per facility), e.g. a government doctor who also practises in a private facility in the evening.
Submitting a role is the facility's attestation that the practitioner works there. The sanctioned post slice is optional and, when present, is used only as a stronger match."""

* practitioner 1..1 MS
* practitioner only Reference(BDPractitioner)
* organization 1..1 MS
* organization only Reference(BDFacility)
* active MS
* period MS
* code MS

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Sliced by identifier namespace"
* identifier contains hrisPost 0..1 MS
* identifier[hrisPost].system = $BD-POST-ID
* identifier[hrisPost].value 1..1
