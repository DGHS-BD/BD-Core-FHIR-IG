Instance: BDLabResultHemoglobinExample
InstanceOf: BDLabResultObservationProfile
Usage: #example
Title: "Example of a Bangladesh Laboratory Result (numeric): Hemoglobin"
Description: "A quantitative (Qn scale) laboratory result: hemoglobin in blood, a component of the CBC panel example. Uses LOINC 718-7 from the BD LOINC Lab Results value set and a UCUM quantity."

// Identifier (1..*): accession / result id
* identifier[0].system = "https://fhir.dghs.gov.bd/core/identifier/lab-accession"
* identifier[0].value = "LAB-2023-000123-HGB"

* status = #final

// Category is fixed to 'laboratory'
* category[0] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory "Laboratory"

// Code is bound (required) to the BD LOINC Lab Results value set
* code = http://loinc.org#718-7 "Hemoglobin [Mass/volume] in Blood"

* subject = Reference(BDPatientExample)
* subject.display = "Abul Kashem"
* encounter = Reference(BDEncounterExample)

* effectiveDateTime = "2023-10-27T10:10:00Z"
* issued = "2023-10-27T14:30:00Z"
* performer[0] = Reference(BDOrganizationExample)

// Quantitative result: value, unit, UCUM system and code are all required by the profile
* valueQuantity.value = 13.8
* valueQuantity.unit = "g/dL"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #"g/dL"

* interpretation[0] = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#N "Normal"

// Illustrative adult reference range
* referenceRange[0].low.value = 13.0
* referenceRange[0].low.unit = "g/dL"
* referenceRange[0].low.system = "http://unitsofmeasure.org"
* referenceRange[0].low.code = #"g/dL"
* referenceRange[0].high.value = 17.0
* referenceRange[0].high.unit = "g/dL"
* referenceRange[0].high.system = "http://unitsofmeasure.org"
* referenceRange[0].high.code = #"g/dL"
* referenceRange[0].text = "13.0 - 17.0 g/dL"

// Result belongs to the CBC panel example
* derivedFrom[0] = Reference(BDLabPanelObservationExample)
