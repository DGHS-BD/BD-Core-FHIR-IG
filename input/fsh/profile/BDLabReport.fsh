Profile:     BDLabReportProfile
Id:          bd-lab-report
Parent:      DiagnosticReport
Title:       "Bangladesh Laboratory Report"
Description: """
Profile for laboratory DiagnosticReport in Bangladesh, aligned with IPS
(International Patient Summary) DiagnosticReport pattern.

Usage:
  - Represents a complete laboratory report for a patient encounter
  - DiagnosticReport.result references panel-level Observations
    (bd-lab-panel-observation) or standalone result Observations
    (bd-lab-result-observation) where no panel grouping exists
  - DiagnosticReport.code is fixed to LOINC 11502-2 (Laboratory report)
  - specimen is SHOULD (MS, 0..*)

Report structure:
  bd-lab-report (DiagnosticReport)
      ├── result --> bd-lab-panel-observation
      │                 └── hasMember --> bd-lab-result-observation (x N)
      └── result --> bd-lab-result-observation  (standalone, no panel)
"""

* ^url = "https://fhir.dghs.gov.bd/core/StructureDefinition/bd-lab-report"
* ^version = "0.1.0"
* ^status = #draft

// ── Identifier ────────────────────────────────────────────────────────────
// Lab reports must carry an accession number or report ID.
* identifier 1..* MS
* identifier.value 1..1

// ── Status ────────────────────────────────────────────────────────────────
* status 1..1
* status from http://hl7.org/fhir/ValueSet/diagnostic-report-status (required)
* status ^definition = "Status of the laboratory report"
* status ^comment = "E.g. registered, partial, preliminary, final, amended, corrected"

// ── Category ──────────────────────────────────────────────────────────────
// Fixed to LAB (laboratory) category.
* category 1..* MS
* category = http://terminology.hl7.org/CodeSystem/v2-0074#LAB "Laboratory"
* category ^definition = "Fixed to 'LAB' for laboratory diagnostic reports"

// ── Code ──────────────────────────────────────────────────────────────────
// Fixed to LOINC 11502-2 (Laboratory report) — IPS-aligned.
* code 1..1 MS
* code = http://loinc.org#11502-2 "Laboratory report"
* code ^definition = "Fixed to LOINC 11502-2 — Laboratory report"

// ── Subject ───────────────────────────────────────────────────────────────
* subject 1..1 MS
* subject only Reference(Patient)
* subject.reference 1..1 MS
* subject.display 1..1 MS
* subject ^definition = "Reference to the Patient this report is about"

// ── Encounter ─────────────────────────────────────────────────────────────
* encounter 1..1 MS
* encounter.reference 1..1 MS
* encounter ^definition = "Reference to the Encounter during which this report was ordered"

// ── Effective ─────────────────────────────────────────────────────────────
// When the report was clinically relevant — required for lab context.
* effective[x] 1..1 MS
* effective[x] only dateTime or Period
* effectiveDateTime ^definition = "Date/time the specimen was collected or the report period"

// ── Issued ────────────────────────────────────────────────────────────────
// Date/time the report was released — required for lab reports.
* issued 1..1 MS
* issued ^definition = "Date/time the report was issued by the laboratory"

// ── Performer ─────────────────────────────────────────────────────────────
// Who performed the laboratory test (laboratory organization or practitioner).
// Kept flexible — may be Organization, Practitioner, or PractitionerRole.
* performer 1..* MS
* performer ^definition = "Laboratory or practitioner who performed the test"
* performer ^comment = "Typically the laboratory Organization. May also include the responsible Practitioner."

// ── Results Interpreter ───────────────────────────────────────────────────
// Who interpreted the results (clinician, pathologist).
// Optional but MustSupport — include when a formal interpretation was made.
* resultsInterpreter 0..* MS
* resultsInterpreter ^definition = "Clinician or pathologist who interpreted the laboratory results"
* resultsInterpreter ^comment = "Include when a formal interpretation or authorisation was made by a named clinician."

// ── Specimen ──────────────────────────────────────────────────────────────
// SHOULD be present per IPS alignment — MustSupport, optional cardinality.
* specimen 0..* MS
* specimen ^definition = "Specimen(s) used for this laboratory report"
* specimen ^comment = "Should be present when specimen information is available. IPS alignment: SHOULD."

// ── Result ────────────────────────────────────────────────────────────────
// References panel-level Observations or standalone result Observations.
// At least one result is required for a meaningful report.
* result 1..* MS
* result only Reference(BDLabPanelObservationProfile or BDLabResultObservationProfile)
* result ^definition = "References to Observation resources that are part of this report"
* result ^comment = """
Use BDLabPanelObservationProfile for ordered panels (CBC, LFT, RFT, etc.)
where individual results are grouped under a panel using hasMember.
Use BDLabResultObservationProfile directly for standalone results
that are not part of a named panel.
"""

// ── Conclusion ────────────────────────────────────────────────────────────
// Free-text clinical interpretation of the overall report.
* conclusion 0..1 MS
* conclusion ^definition = "Clinical interpretation or summary of the laboratory report"

// ── Conclusion Code ───────────────────────────────────────────────────────
// Coded clinical finding — may reference ICD-11 diagnosis codes.
* conclusionCode 0..* MS
* conclusionCode ^definition = "Coded representation of the clinical conclusion"
* conclusionCode ^comment = "May use ICD-11 MMS codes consistent with bd-condition-icd11-diagnosis-valueset"

// ── Presented Form ────────────────────────────────────────────────────────
// Attach the original PDF or HL7 CDA report if available.
* presentedForm 0..* MS
* presentedForm ^definition = "Entire report as issued — e.g. PDF attachment"
* presentedForm ^comment = "Include the original report document when available"
