// Validation outcome codes returned by the national exchange. Codes are never reused or changed once published.

CodeSystem: BDValidationOutcome
Id: bd-validation-outcome
Title: "BD Bundle Validation Outcome Codes"
Description: "Stable codes returned in OperationOutcome.issue.details when a submission bundle is validated against HRIS and BMDC. See the Validation page."
* ^status = #draft
* ^caseSensitive = true

* #BD-SND-001 "Sender not authorised for sending facility" "The authenticated sender is not authorised to submit for the facility declared in the bundle."
* #BD-SND-002 "Too many failed verifications" "The sender has exceeded the allowed number of failed practitioner verifications. Retry later."
* #BD-FAC-001 "Sending facility not declared" "The sender is authorised for more than one facility and the bundle does not declare its sending facility in meta.tag."
* #BD-FAC-002 "Facility not found in HRIS" "A facility code (sending or referenced) is not in the HRIS facility registry."
* #BD-FAC-003 "Sending facility inactive" "The sending facility exists but is inactive in HRIS."
* #BD-FAC-004 "Referenced facility inactive" "A facility referenced in the bundle (not the sending facility) exists but is inactive in HRIS. Accepted; reported for information."
* #BD-PRV-001 "No HRIS-identified practitioner in a clinical role" "A bundle from a government facility must include at least one practitioner, identified by an HRIS provider ID, in a clinical role."
* #BD-PRV-002 "Practitioner could not be verified" "The practitioner could not be verified in the allowed registries, or a prescriber or orderer does not reference a practitioner. Causes include a missing or mistyped identifier, or a registration that is not currently valid. The cause is not distinguished."
* #BD-PRV-003 "Practitioner name does not match registry record" "The practitioner name clearly differs from the registry record."
* #BD-PRV-004 "Registration expired on encounter date" "The practitioner's licence had expired on the date of the encounter."
* #BD-PRV-005 "Verification source unavailable, retry later" "The registry needed to verify a practitioner could not be reached. Nothing was accepted; retry."
* #BD-PRV-006 "Practitioner accepted on facility attestation" "The practitioner is not required to be verified in this role, or carries only identifiers that cannot be verified; accepted on the sending facility's attestation without registry verification."
* #BD-PRV-010 "Practitioner identity verified" "The practitioner was verified in a national registry."
