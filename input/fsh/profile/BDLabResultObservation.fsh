Profile:     BDLabResultObservationProfile
Id:          bd-lab-result-observation
Parent:      bd-observation
Title:       "Bangladesh Laboratory Result Observation"
Description: """
Profile for individual laboratory result (component-level) Observations
in Bangladesh. Represents a single test result within a laboratory panel
(e.g. Haemoglobin within a CBC panel).

Usage:
  - Observation.code is the result/component code (from BD LOINC Lab Results ValueSet)
  - Observation.value[x] is required — every leaf result must carry a value
  - Observation.hasMember is prohibited — leaf results cannot group further
  - Observation.derivedFrom references the parent panel Observation
  - Observation.category is fixed to 'laboratory'

FHIR hasMember pattern:
  bd-lab-panel-observation
      └── hasMember --> bd-lab-result-observation (this profile)

Coded results (Ord/Nom scale):
  Use valueCodeableConcept with codes from BD LOINC Answer Lists ValueSet.
"""

* ^url = "https://fhir.dghs.gov.bd/core/StructureDefinition/bd-lab-result-observation"
* ^version = "0.1.0"
* ^status = #draft

// ── Identifier ────────────────────────────────────────────────────────────
// Result observations carry the accession number or result ID.
* identifier 1..* MS
* identifier.value 1..1

// ── Category ──────────────────────────────────────────────────────────────
// Fixed to 'laboratory' for all lab result observations.
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* category ^definition = "Fixed to 'laboratory' for laboratory result observations"

// ── Code ──────────────────────────────────────────────────────────────────
// Bound to BD LOINC Lab Results ValueSet — leaf result codes only.
* code 1..1 MS
* code from https://fhir.dghs.gov.bd/core/ValueSet/loinc-lab-results (extensible)
* code ^definition = "LOINC result/component code for this individual laboratory result"
* code ^comment = "E.g. 718-7 Hemoglobin, 2160-0 Creatinine"

// ── Status ────────────────────────────────────────────────────────────────
* status from http://hl7.org/fhir/ValueSet/observation-status (required)

// ── Effective ─────────────────────────────────────────────────────────────
* effective[x] 1..1 MS
* effective[x] only dateTime or Period
* effectiveDateTime ^definition = "Date/time the result was obtained"

// ── Value[x] ──────────────────────────────────────────────────────────────
// Required — every leaf result must carry a value.
* value[x] 1..1 MS
* value[x] only Quantity or CodeableConcept
* value[x] ^definition = "The actual result value for this laboratory test"

// Numeric results (Qn scale) — UCUM units required
* valueQuantity MS
* valueQuantity.value 1..1
* valueQuantity.unit 1..1
* valueQuantity.system 1..1
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code 1..1
* valueQuantity ^comment = "Use for quantitative (Qn scale) results. Units must be UCUM."

// Coded results (Ord/Nom scale) — bound to LOINC Answer Lists
* valueCodeableConcept MS
* valueCodeableConcept from https://fhir.dghs.gov.bd/core/ValueSet/loinc-answer-lists (extensible)
* valueCodeableConcept ^comment = "Use for ordinal or nominal (Ord/Nom scale) results."

// ── hasMember ─────────────────────────────────────────────────────────────
// Leaf results cannot group further observations.
* hasMember 0..0

// ── derivedFrom ───────────────────────────────────────────────────────────
// References the parent panel Observation.
* derivedFrom 0..* MS
* derivedFrom only Reference(BDLabPanelObservationProfile)
* derivedFrom ^definition = "Reference to the parent panel Observation this result belongs to"

// ── Interpretation ────────────────────────────────────────────────────────
// Strongly recommended for lab results — High, Low, Normal, etc.
* interpretation 0..* MS
* interpretation from http://hl7.org/fhir/ValueSet/observation-interpretation (extensible)
* interpretation ^definition = "Clinical interpretation of the result value"
* interpretation ^comment = "E.g. H (High), L (Low), N (Normal), A (Abnormal)"

// ── Reference Range ───────────────────────────────────────────────────────
* referenceRange 0..* MS
* referenceRange ^definition = "Normal reference range for this result"
* referenceRange ^comment = "Should be present when reference ranges are known"

// ── Specimen ──────────────────────────────────────────────────────────────
// May reference the same specimen as the parent panel.
* specimen 0..1 MS
* specimen ^definition = "Specimen used for this result observation"
* specimen ^comment = "Should be consistent with the parent panel specimen"

// ── Note ──────────────────────────────────────────────────────────────────
* note 0..* MS
* note ^definition = "Comments about this individual result"
