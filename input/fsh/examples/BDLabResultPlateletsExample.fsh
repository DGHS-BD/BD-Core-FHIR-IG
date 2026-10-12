Instance: BDLabResultPlateletsExample
InstanceOf: BDLabResultObservationProfile
Usage: #example
Title: "Example of a Bangladesh Laboratory Result (numeric): Platelets"
Description: "A quantitative laboratory result: platelet count by automated count, a component of the CBC panel example. Uses LOINC 777-3 from the BD LOINC Lab Results value set."

* identifier[0].system = "https://fhir.dghs.gov.bd/core/identifier/lab-accession"
* identifier[0].value = "LAB-2023-000123-PLT"

* status = #final
* category[0] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory "Laboratory"
* code = http://loinc.org#777-3 "Platelets [#/volume] in Blood by Automated count"

* subject = Reference(BDPatientExample)
* subject.display = "Abul Kashem"
* encounter = Reference(BDEncounterExample)

* effectiveDateTime = "2023-10-27T10:10:00Z"
* issued = "2023-10-27T14:30:00Z"
* performer[0] = Reference(BDOrganizationExample)

* valueQuantity.value = 245
* valueQuantity.unit = "10*3/uL"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #"10*3/uL"

* interpretation[0] = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#N "Normal"

// Illustrative adult reference range
* referenceRange[0].low.value = 150
* referenceRange[0].low.unit = "10*3/uL"
* referenceRange[0].low.system = "http://unitsofmeasure.org"
* referenceRange[0].low.code = #"10*3/uL"
* referenceRange[0].high.value = 400
* referenceRange[0].high.unit = "10*3/uL"
* referenceRange[0].high.system = "http://unitsofmeasure.org"
* referenceRange[0].high.code = #"10*3/uL"
* referenceRange[0].text = "150 - 400 10*3/uL"

* derivedFrom[0] = Reference(BDLabPanelObservationExample)
