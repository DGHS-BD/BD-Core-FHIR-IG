Instance: BDMedicationExample
InstanceOf: BDMedication
Title: "Medication Example — Marvelous-FE (Combination Drug)"
Description: """
Example BDMedication instance for Marvelous-FE, a combination drug containing
desogestrel, ethinyloestradiol and ferrous fumarate. Demonstrates multi-ingredient
handling with ICD-11 MMS substance codes taken from the Has-active-ingredient
mappings of the drug concept in the national OCL terminology server.
Dose form coded using EDQM Standard Terms.
"""
Usage: #example

* code.coding[0].system = "https://fhir.dghs.gov.bd/core/CodeSystem/dgda-drug-registry"
* code.coding[0].code = #353-0026-039--marvelous-fe
* code.coding[0].display = "Marvelous-FE"
* code.text = "Marvelous-FE"

* form.coding[0].system = "http://standardterms.edqm.eu"
* form.coding[0].code = #10219000
* form.coding[0].display = "Tablet"

// Ingredient 1: Desogestrel -> ICD-11 XM substance code (Has-active-ingredient mapping in OCL)
* ingredient[0].itemCodeableConcept.coding[0].system = "http://id.who.int/icd/release/11/mms"
* ingredient[0].itemCodeableConcept.coding[0].code = #XM7ZG5
* ingredient[0].itemCodeableConcept.coding[0].display = "Desogestrel"
* ingredient[0].itemCodeableConcept.text = "Desogestrel"
* ingredient[0].isActive = true

// Ingredient 2: Ethinyloestradiol -> ICD-11 XM substance code (Has-active-ingredient mapping in OCL)
* ingredient[1].itemCodeableConcept.coding[0].system = "http://id.who.int/icd/release/11/mms"
* ingredient[1].itemCodeableConcept.coding[0].code = #XM1SV5
* ingredient[1].itemCodeableConcept.coding[0].display = "Ethinyloestradiol"
* ingredient[1].itemCodeableConcept.text = "Ethinyloestradiol"
* ingredient[1].isActive = true

// Ingredient 3: Ferrous fumarate -> ICD-11 XM substance code (Has-active-ingredient mapping in OCL)
* ingredient[2].itemCodeableConcept.coding[0].system = "http://id.who.int/icd/release/11/mms"
* ingredient[2].itemCodeableConcept.coding[0].code = #XM04C6
* ingredient[2].itemCodeableConcept.coding[0].display = "Ferrous fumarate"
* ingredient[2].itemCodeableConcept.text = "Ferrous fumarate"
* ingredient[2].isActive = true
