Profile: BDRelatedPerson
Id: bd-related-person
Parent: RelatedPerson
Title: "Related Person Profile for Bangladesh"
Description: """
Profile for RelatedPerson in Bangladesh.
Used to represent father, mother, or guardian of a patient.
- Identifier is mandatory and must use BD identifier systems (NID, BRN, UHID)
- Relationship is mandatory
- Name is mandatory
"""

* ^url = "https://fhir.dghs.gov.bd/core/StructureDefinition/bd-related-person"

// ── Identifier ────────────────────────────────────────────────────────────
// Mandatory BD identifier — NID, BRN, or UHID
* identifier 1..* MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier contains
    NID 0..1 and
    BRN 0..1 and
    UHID 0..1

* identifier[NID].system = "http://dghs.gov.bd/identifier/nid"
* identifier[NID].type.coding.code = #NID
* identifier[NID].type.coding.system = "https://fhir.dghs.gov.bd/core/CodeSystem/bd-identifier-type"
* identifier[NID].type.text = "Organization identifier"

* identifier[BRN].system = "http://dghs.gov.bd/identifier/brn"
* identifier[BRN].type.coding.code = #BRN
* identifier[BRN].type.coding.system = "https://fhir.dghs.gov.bd/core/CodeSystem/bd-identifier-type"
* identifier[BRN].type.text = "Organization identifier"

* identifier[UHID].system = "http://dghs.gov.bd/identifier/uhid"
* identifier[UHID].type.coding.code = #UHID
* identifier[UHID].type.coding.system = "https://fhir.dghs.gov.bd/core/CodeSystem/bd-identifier-type"
* identifier[UHID].type.text = "Organization identifier"

// ── Relationship ──────────────────────────────────────────────────────────
// Mandatory — must specify the relationship to the patient
* relationship 1..* MS
* relationship ^definition = "Relationship of this person to the patient"
* relationship ^comment = "E.g. FTH (father), MTH (mother), GUARD (guardian) from v3-RoleCode"

// ── Name ──────────────────────────────────────────────────────────────────
* name 1..1 MS
* name ^definition = "Name of the related person"

// ── Patient ───────────────────────────────────────────────────────────────
* patient 1..1 MS
* patient only Reference(BDPatient)
* patient ^definition = "The patient this related person is associated with"