Instance: BDMedicationExample
InstanceOf: BDMedication
Title: "Medication Example — Marvelous Fe (Combination Drug)"
Description: """
Example BDMedication instance for Marvelous Fe, a combination drug containing
ferrous sulphate and folic acid. Demonstrates multi-ingredient handling with
ICD-11 MMS substance codes populated from OCL Has-active-ingredient mappings.
Dose form coded using EDQM Standard Terms.
"""
Usage: #example

* code.coding[0].system = "https://dgda.gov.bd/drug-registry"
* code.coding[0].code = #353-0026-039--marvelous-fe
* code.coding[0].display = "Marvelous Fe"
* code.text = "Marvelous Fe"

* form.coding[0].system = "http://standardterms.edqm.eu"
* form.coding[0].code = #10219000
* form.coding[0].display = "Tablet"

// Ingredient 1: Ferrous Sulphate → ICD-11 XM substance code
* ingredient[0].itemCodeableConcept.coding[0].system = "http://id.who.int/icd/release/11/mms"
* ingredient[0].itemCodeableConcept.coding[0].code = #XM3SQ1
* ingredient[0].itemCodeableConcept.coding[0].display = "Ferrous sulphate"
* ingredient[0].itemCodeableConcept.text = "Ferrous sulphate"
* ingredient[0].isActive = true

// Ingredient 2: Folic Acid → ICD-11 XM substance code
* ingredient[1].itemCodeableConcept.coding[0].system = "http://id.who.int/icd/release/11/mms"
* ingredient[1].itemCodeableConcept.coding[0].code = #XM7R82
* ingredient[1].itemCodeableConcept.coding[0].display = "Folic acid"
* ingredient[1].itemCodeableConcept.text = "Folic acid"
* ingredient[1].isActive = true