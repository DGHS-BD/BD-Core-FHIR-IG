Profile:     BDLabPanelObservationProfile
Id:          bd-lab-panel-observation
Parent:      bd-observation
Title:       "Bangladesh Laboratory Panel Observation"
Description: """
Profile for laboratory panel (order-level) Observations in Bangladesh.
Represents an ordered laboratory test panel (e.g. CBC, LFT, RFT) as the
parent Observation in a hasMember hierarchy.

Usage:
  - Observation.code is the panel/order code (from BD LOINC Lab Panels ValueSet)
  - Observation.hasMember references individual result Observations
    (bd-lab-result-observation) for each component
  - Observation.value[x] is prohibited — panels do not carry a direct result value
  - Observation.category is fixed to 'laboratory'

FHIR hasMember pattern:
  DiagnosticReport.result --> bd-lab-panel-observation
                                  └── hasMember --> bd-lab-result-observation (x N)
"""

* ^url = "https://fhir.dghs.gov.bd/core/StructureDefinition/bd-lab-panel-observation"
* ^version = "0.1.0"
* ^status = #draft

// ── Identifier ────────────────────────────────────────────────────────────
// Lab panels must carry an identifier (accession number or order ID).
* identifier 1..* MS
* identifier.value 1..1

// ── Category ──────────────────────────────────────────────────────────────
// Fixed to 'laboratory' for all lab panel observations.
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* category ^definition = "Fixed to 'laboratory' for laboratory panel observations"

// ── Code ──────────────────────────────────────────────────────────────────
// Bound to BD LOINC Lab Panels ValueSet — orderable panel codes only.
* code 1..1 MS
* code from https://fhir.dghs.gov.bd/core/ValueSet/loinc-lab-panels (extensible)
* code ^definition = "LOINC panel/order code for this laboratory panel"
* code ^comment = "E.g. 58410-2 CBC panel, 24323-8 Comprehensive metabolic panel"

// ── Status ────────────────────────────────────────────────────────────────
// Restrict to statuses relevant to lab reporting.
* status from http://hl7.org/fhir/ValueSet/observation-status (required)

// ── Effective ─────────────────────────────────────────────────────────────
// When the panel was performed — required for lab context.
* effective[x] 1..1 MS
* effective[x] only dateTime or Period
* effectiveDateTime ^definition = "Date/time the laboratory panel was performed"

// ── Value[x] ──────────────────────────────────────────────────────────────
// Panels do not carry a direct result value — results are in hasMember children.
* value[x] 0..0

// ── hasMember ─────────────────────────────────────────────────────────────
// Must reference at least one component result Observation.
// Typed to bd-lab-result-observation.
* hasMember 1..* MS
* hasMember only Reference(BDLabResultObservationProfile)
* hasMember ^definition = "References to individual component result Observations for this panel"
* hasMember ^comment = "Each hasMember entry is a bd-lab-result-observation"

// ── derivedFrom ───────────────────────────────────────────────────────────
// Panels are not derived from other observations — prohibited at this level.
* derivedFrom 0..0

// ── Specimen ──────────────────────────────────────────────────────────────
// SHOULD be present for laboratory panels per IPS alignment.
* specimen 0..1 MS
* specimen ^definition = "Specimen collected for this laboratory panel"
* specimen ^comment = "Should be present when specimen information is available"

// ── Note ──────────────────────────────────────────────────────────────────
* note 0..* MS
* note ^definition = "Comments about the laboratory panel"
