Profile:     BDObservationProfile
Id:          bd-observation
Parent:      Observation
Title:       "Bangladesh Observation Profile"
Description: """
Base observation profile for Bangladesh. This is an abstract-style base profile
from which all BD-Core observation profiles are derived. It is not intended to
be used directly in clinical resources — use a derived profile instead.

Derived profiles (v0.4.0):
  - bd-lab-panel-observation  : Laboratory panel/order (hasMember pattern)
  - bd-lab-result-observation : Laboratory leaf result (child of hasMember)

Planned derived profiles (v0.5.0+):
  - bd-vital-signs-observation
  - bd-exam-observation
"""

* ^url = "https://fhir.dghs.gov.bd/core/StructureDefinition/bd-observation"
* ^version = "2.0.0"
* ^status = #draft

// ── Identifier ────────────────────────────────────────────────────────────
// 0..* at base — not all observation types carry identifiers.
// Child profiles (e.g. lab results) constrain to 1..*.
* identifier 0..* MS
* identifier.value 1..1

// ── Status ────────────────────────────────────────────────────────────────
* status 1..1

// ── Category ──────────────────────────────────────────────────────────────
// Preferred binding at base — child profiles fix to specific category codes
// (e.g. laboratory, vital-signs). Required binding here would block child
// profiles from narrowing to a fixed category slice.
* category 1..* MS
* category from http://hl7.org/fhir/ValueSet/observation-category (preferred)
* category ^definition = "Type of observation category"
* category ^comment = "E.g. laboratory, vital-signs, exam. Child profiles fix this to a specific value."

// ── Code ──────────────────────────────────────────────────────────────────
// Extensible binding at base — child profiles bind to narrower ValueSets
// (e.g. BD LOINC lab panels, BD LOINC lab results). Required binding here
// would prevent child profiles from using a subset binding.
* code 1..1 MS
* code from http://hl7.org/fhir/ValueSet/observation-codes (extensible)
* code ^definition = "Type of observation / test / measurement"
* code ^comment = "E.g. Hb, RBS, CBC. Child profiles bind to specific ValueSets."

// ── Subject ───────────────────────────────────────────────────────────────
* subject 1..1 MS
* subject only Reference(Patient)
* subject.reference 1..1 MS
* subject.display 1..1 MS
* subject.identifier 0..1
* subject ^definition = "Reference to the Patient this observation is about"
* subject ^comment = "EX: http://mci.mcishr.dghs.gov.bd/api/v1/patients/98002412586"

// ── Encounter ─────────────────────────────────────────────────────────────
* encounter 1..1 MS
* encounter.reference 1..1 MS
* encounter ^definition = "Reference to the Encounter during which this observation was made"
* encounter ^comment = "EX: uuid:34c38499-58ab-41e0-8e94-c3931491ad0e"

// ── Performer ─────────────────────────────────────────────────────────────
* performer 1..*
* performer.reference 1..1

// ── Part Of ───────────────────────────────────────────────────────────────
* partOf 0..*

// ── Value[x] ──────────────────────────────────────────────────────────────
// 0..1 at base — child profiles constrain presence and type.
// Panel observations set value[x] to 0..0.
// Result observations set value[x] to 1..1.
* value[x] 0..1
* value[x] ^definition = "Result value (Quantity, string, code, boolean, etc.)"
* valueQuantity 0..1
* valueQuantity ^comment = "If numeric, must include UCUM unit"
* valueQuantity.system 0..1
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code 0..1
* valueString 0..1
* valueCodeableConcept 0..1
* valueBoolean 0..1
* valueInteger 0..1
* valueRange 0..1
* valueRatio 0..1
* valueSampledData 0..1
* valueTime 0..1
* valueDateTime 0..1
* valuePeriod 0..1

// ── Interpretation ────────────────────────────────────────────────────────
// Extensible at base — required was too strict for general observation use.
* interpretation 0..*
* interpretation from http://hl7.org/fhir/ValueSet/observation-interpretation (extensible)
* interpretation ^definition = "Assessment of the observation result"
* interpretation ^comment = "E.g. High, Low, Normal"

// ── Method ────────────────────────────────────────────────────────────────
// Extensible at base — required was too strict for general observation use.
* method 0..1
* method from http://hl7.org/fhir/ValueSet/observation-methods (extensible)
* method ^definition = "Type of observation method"
* method ^comment = "E.g. Technique, Total measurement"

// ── Issued ────────────────────────────────────────────────────────────────
* issued 0..1
* issued ^definition = "Date/time the result was issued"

// ── Reference Range ───────────────────────────────────────────────────────
* referenceRange 0..*
* referenceRange ^definition = "Normal reference range for the observation"

// ── Specimen ──────────────────────────────────────────────────────────────
// MustSupport at base — relevant for lab, pathology, and future imaging.
* specimen 0..1 MS
* specimen ^definition = "Specimen used for this observation"

// ── hasMember ─────────────────────────────────────────────────────────────
// Defined at base to support the panel/component pattern.
// bd-lab-panel-observation constrains this to 1..* typed references.
// bd-lab-result-observation constrains this to 0..0.
* hasMember 0..* MS
* hasMember ^definition = "References to component result Observations that belong to this panel"
* hasMember ^comment = "Used in panel-type Observations. Leaf result Observations must not use hasMember."

// ── derivedFrom ───────────────────────────────────────────────────────────
// Defined at base to support child results referencing their parent panel.
* derivedFrom 0..* MS
* derivedFrom ^definition = "References to the panel Observation from which this result is derived"
* derivedFrom ^comment = "Used in leaf result Observations to reference their parent panel."
