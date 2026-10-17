// OperationOutcome examples for a private (non-government) sending facility.

Instance: BDExampleOutcomeRejected
InstanceOf: OperationOutcome
Usage: #example
Title: "Rejected: prescriber could not be verified"
Description: "HTTP 422. A private facility submits a prescription whose requester is not found in HRIS or BMDC. The cause is not disclosed."
* issue[0].severity = #error
* issue[=].code = #not-found
* issue[=].details = BDValidationOutcome#BD-PRV-002 "Practitioner could not be verified"
* issue[=].expression[0] = "Bundle.entry[2].resource.ofType(MedicationRequest).requester"
* issue[=].diagnostics = "Practitioner could not be verified in allowed registries."

Instance: BDExampleOutcomeAccepted
InstanceOf: OperationOutcome
Usage: #example
Title: "Accepted: prescriber verified, nurse attested"
Description: "HTTP 200. The prescriber was verified; a nurse outside the prescriber and orderer roles was accepted on the facility's attestation."
* issue[0].severity = #information
* issue[=].code = #informational
* issue[=].details = BDValidationOutcome#BD-PRV-010 "Practitioner identity verified"
* issue[=].expression[0] = "Bundle.entry[2].resource.ofType(MedicationRequest).requester"
* issue[+].severity = #information
* issue[=].code = #informational
* issue[=].details = BDValidationOutcome#BD-PRV-006 "Practitioner accepted on facility attestation"
* issue[=].expression[0] = "Bundle.entry[4].resource.ofType(Observation).performer"

Instance: BDExampleOutcomeUnauthorised
InstanceOf: OperationOutcome
Usage: #example
Title: "Rejected: sender not authorised for facility"
Description: "HTTP 403. Returned alone; no further checks run, so nothing about the facility or practitioners is disclosed."
* issue[0].severity = #error
* issue[=].code = #forbidden
* issue[=].details = BDValidationOutcome#BD-SND-001 "Sender not authorised for sending facility"
* issue[=].expression[0] = "Bundle.meta.tag"
* issue[=].diagnostics = "Sender is not authorised for the declared sending facility."
