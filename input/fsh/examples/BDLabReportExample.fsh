Instance: BDLabReportExample
InstanceOf: BDLabReportProfile
Usage: #example
Title: "Example of a Bangladesh Laboratory Report"
Description: "A final laboratory report that references a CBC panel (with its component results) and a standalone coded result (HBsAg)."

* identifier[0].system = "https://fhir.dghs.gov.bd/core/identifier/lab-report"
* identifier[0].value = "LR-2023-000123"

* status = #final

// Category and code are fixed by the profile
* category[0] = http://terminology.hl7.org/CodeSystem/v2-0074#LAB "Laboratory"
* code = http://loinc.org#11502-2 "Laboratory report"

* subject = Reference(BDPatientExample)
* subject.display = "Abul Kashem"
* encounter = Reference(BDEncounterExample)

* effectiveDateTime = "2023-10-27T10:10:00Z"
* issued = "2023-10-27T14:30:00Z"

// Laboratory that performed the tests, and the clinician who interpreted the results
* performer[0] = Reference(BDOrganizationExample)
* resultsInterpreter[0] = Reference(BDPractitionerExample)

// A panel (with hasMember results) and a standalone result
* result[0] = Reference(BDLabPanelObservationExample)
* result[1] = Reference(BDLabResultHBsAgExample)

* conclusion = "All reported values are within the reference range. HBsAg negative."
