Profile: BDMedicationRequest
Id: bd-medication-request
Parent: MedicationRequest
Title: "Medication Request Profile for Bangladesh"
Description: """
Profile of the MedicationRequest resource for the Bangladesh National Health
Information Exchange (HIE). Prescriptions must reference a `BDMedication`
resource coded against the DGDA Drug Registry, ensuring all prescribed
medications are traceable to DGDA-registered drug products.

This profile constrains medication references to `BDMedication` only.
Inline `medicationCodeableConcept` is not permitted — all medication data
must be carried in a referenced `BDMedication` resource to support ingredient
coding for IPS and cross-border data exchange.

Route of administration is coded using HL7 v3 RouteOfAdministration served
via the national OCL terminology server.
"""

* identifier 1..* MS
* identifier ^short = "Prescription identifier"
* identifier ^definition = """
Business identifier for this prescription. At least one identifier is required
to support prescription tracking within the Bangladesh HIE.
"""

* medication[x] 1..1 MS
* medication[x] only Reference(BDMedication)
* medication[x] ^short = "Reference to DGDA-registered medication"
* medication[x] ^definition = """
Reference to a BDMedication resource identifying the prescribed drug product.
The referenced BDMedication must carry a valid DGDA drug registry code.
Inline CodeableConcept is not permitted in this profile.
"""

* subject 1..1 MS
* subject only Reference(BDPatientProfile)
* subject ^short = "Patient for whom the medication is prescribed"

* encounter 0..1 MS
* encounter only Reference(BDEncounterProfile)
* encounter ^short = "Encounter during which this prescription was created"
* encounter ^definition = """
The encounter during which this prescription was created. Should be populated
for inpatient and outpatient prescriptions where an encounter record exists.
"""

* authoredOn 1..1 MS
* authoredOn ^short = "Date and time the prescription was authored"

* requester 1..1 MS
* requester only Reference(BDPractitioner or BDOrganization)
* requester ^short = "Practitioner or organisation that authored the prescription"

* reportedReference only Reference(BDPractitioner or BDOrganization or BDPatientProfile)

* priorPrescription only Reference(BDMedicationRequest)
* priorPrescription ^short = "Reference to a prior prescription this replaces"

* basedOn only Reference(BDMedicationRequest or ServiceRequest or CarePlan or ImmunizationRecommendation)
* basedOn ^short = "Plan or request this prescription is based on"

* dosageInstruction.route from BDRouteOfAdministrationVS (required)
* dosageInstruction.route ^short = "Route of administration coded using HL7 v3 RouteOfAdministration"