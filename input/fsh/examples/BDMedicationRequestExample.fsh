Instance: BDMedicationRequestExample
InstanceOf: BDMedicationRequest
Title: "Medication Request Example — Marvelous Fe Prescription"
Description: """
Example BDMedicationRequest instance prescribing Marvelous Fe. Demonstrates
the full prescription chain: BDMedicationRequest → BDMedication → DGDA code
→ ICD-11 substance ingredients. Route of administration coded using HL7 v3
RouteOfAdministration.
"""
Usage: #example

* identifier[0].system = "https://fhir.dghs.gov.bd/identifier/prescription"
* identifier[0].value = "RX-2024-BD-000001"

* status = #active
* intent = #order

* medicationReference = Reference(BDMedicationExample)

* subject = Reference(BDPatientExample)
* subject.display = "Example Patient"

* encounter = Reference(BDEncounterExample)
* encounter.display = "Example Outpatient Encounter"

* authoredOn = "2024-11-01T10:30:00+06:00"

* requester = Reference(BDPractitionerExample)
* requester.display = "Example Practitioner"

* dosageInstruction[0].text = "Take 1 tablet daily after meals"
* dosageInstruction[0].timing.repeat.frequency = 1
* dosageInstruction[0].timing.repeat.period = 1
* dosageInstruction[0].timing.repeat.periodUnit = #d
* dosageInstruction[0].route.coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-RouteOfAdministration"
* dosageInstruction[0].route.coding[0].code = #PO
* dosageInstruction[0].route.coding[0].display = "Swallow, oral"
* dosageInstruction[0].doseAndRate[0].doseQuantity.value = 1
* dosageInstruction[0].doseAndRate[0].doseQuantity.unit = "tablet"
* dosageInstruction[0].doseAndRate[0].doseQuantity.system = "http://unitsofmeasure.org"
* dosageInstruction[0].doseAndRate[0].doseQuantity.code = #{tbl}