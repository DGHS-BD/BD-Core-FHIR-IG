Instance: BDLabResultHBsAgExample
InstanceOf: BDLabResultObservationProfile
Usage: #example
Title: "Example of a Bangladesh Laboratory Result (coded): HBsAg"
Description: "A coded (Ord/Nom scale) standalone laboratory result, not part of a panel: hepatitis B surface antigen by immunoassay. Uses LOINC 5196-1 from the BD LOINC Lab Results value set and a LOINC answer code (LA6577-6 Negative) from the BD LOINC Answer Lists value set."

* identifier[0].system = "https://fhir.dghs.gov.bd/core/identifier/lab-accession"
* identifier[0].value = "LAB-2023-000124"

* status = #final
* category[0] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory "Laboratory"
* code = http://loinc.org#5196-1 "Hepatitis B virus surface Ag [Presence] in Serum or Plasma by Immunoassay"

* subject = Reference(BDPatientExample)
* subject.display = "Abul Kashem"
* encounter = Reference(BDEncounterExample)

* effectiveDateTime = "2023-10-27T10:10:00Z"
* issued = "2023-10-27T14:30:00Z"
* performer[0] = Reference(BDOrganizationExample)

// Coded result: bound (required) to the BD LOINC Answer Lists value set
* valueCodeableConcept = http://loinc.org#LA6577-6 "Negative"

* interpretation[0] = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#N "Normal"
