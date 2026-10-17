Profile: BDSubmissionBundle
Id: bd-submission-bundle
Parent: Bundle
Title: "Submission Bundle for Bangladesh"
Description: """A bundle submitted to the national exchange. It may declare the sending facility in meta.tag, using the HRIS facility code namespace as the tag system. The declaration is required when the sender is authorised for more than one facility; when the sender is authorised for exactly one, the exchange uses that facility. The declared facility must be one the authenticated sender is authorised for."""

* meta MS
* meta.tag ^slicing.discriminator.type = #value
* meta.tag ^slicing.discriminator.path = "system"
* meta.tag ^slicing.rules = #open
* meta.tag ^slicing.description = "Sliced by tag system"
* meta.tag contains sendingFacility 0..1 MS
* meta.tag[sendingFacility].system 1..1
* meta.tag[sendingFacility].system = $BD-FACILITY-CODE
* meta.tag[sendingFacility].code 1..1
