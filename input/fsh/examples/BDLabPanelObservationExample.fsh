Instance: BDLabPanelObservationExample
InstanceOf: BDLabPanelObservationProfile
Usage: #example
Title: "Example of a Bangladesh Laboratory Panel Observation: CBC"
Description: "A laboratory panel (order-level) Observation for a complete blood count. It carries no value of its own; the individual results are referenced through hasMember. Uses LOINC 58410-2 from the BD LOINC Lab Panels value set."

// Identifier (1..*): accession / order id
* identifier[0].system = "https://fhir.dghs.gov.bd/core/identifier/lab-accession"
* identifier[0].value = "LAB-2023-000123"

* status = #final
* category[0] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory "Laboratory"

// Code is bound (required) to the BD LOINC Lab Panels value set
* code = http://loinc.org#58410-2 "CBC panel - Blood by Automated count"

* subject = Reference(BDPatientExample)
* subject.display = "Abul Kashem"
* encounter = Reference(BDEncounterExample)

* effectiveDateTime = "2023-10-27T10:10:00Z"
* issued = "2023-10-27T14:30:00Z"
* performer[0] = Reference(BDOrganizationExample)

// value[x] is prohibited (0..0) on panels, so no value is given.
// derivedFrom is prohibited (0..0) on panels as well.

// hasMember is required (1..*): one entry per component result
* hasMember[0] = Reference(BDLabResultHemoglobinExample)
* hasMember[1] = Reference(BDLabResultWBCExample)
* hasMember[2] = Reference(BDLabResultPlateletsExample)
