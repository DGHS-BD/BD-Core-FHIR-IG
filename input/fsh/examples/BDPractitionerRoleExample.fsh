Instance: BDPractitionerRoleExample
InstanceOf: BDPractitionerRole
Usage: #example
Title: "Example of a Bangladesh Practitioner Role"
Description: "A physician's affiliation with a health facility. Carries no sanctioned post."

* practitioner = Reference(BDPractitionerExample)
* organization = Reference(BDOrganizationExample)
* active = true
