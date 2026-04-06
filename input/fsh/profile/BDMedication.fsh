Profile: BDMedication
Id: bd-medication
Parent: Medication
Title: "Medication Profile for Bangladesh"
Description: """
Profile of the Medication resource for the Bangladesh National Health Information
Exchange (HIE). Drug products are coded using the DGDA Drug Registry maintained
by the Drug Registration Authority of Bangladesh and served via the national OCL
terminology server at https://tr.ocl.dghs.gov.bd.

Ingredient coding uses ICD-11 MMS substance codes (XM-prefix) to support
International Patient Summary (IPS) generation and cross-border data exchange.
Ingredient data is system-populated from OCL Has-active-ingredient mappings and
is not required to be entered manually by clinicians.

Combination drugs are supported via the repeating `ingredient` element.
Unmatched ingredients (not yet mapped to ICD-11 substances) may be represented
using `ingredient.itemCodeableConcept.text` without a coded value.

Dose form is optional and should be coded using EDQM Standard Terms when
populated. Dose form is derivable from the DGDA drug concept via OCL lookup.
A DGDA plain text dose form to EDQM code mapping is planned for a future
IG version.
"""

* code 1..1 MS
* code from BDDGDADrugsVS (required)
* code ^short = "DGDA registered drug product code"
* code ^definition = """
The DGDA drug registry code identifying the finished pharmaceutical product.
Concept ID format: {DAR-number}--{trade-name-slug}
Example: 353-0026-039--marvelous-fe
"""
* code.text 1..1 MS
* code.text ^short = "Trade name of the drug product"
* code.text ^definition = """
The trade name of the drug product as registered with DGDA. Mandatory for
human readability in IPS documents and cross-border data exchange scenarios.
"""

* form 0..1 MS
* form from BDMedicationDoseFormVS (preferred)
* form ^short = "Pharmaceutical dose form — EDQM Standard Terms (optional)"
* form ^definition = """
The pharmaceutical dose form of the drug product. Optional in this profile
as dose form is carried as plain text in the DGDA drug concept and is
derivable via OCL lookup. When populated, EDQM Standard Terms codes served
from the national OCL terminology server should be used.
A DGDA dose form to EDQM mapping is planned for a future IG version.
"""

* ingredient MS
* ingredient ^short = "Active ingredient(s) of the drug product"
* ingredient ^definition = """
Active pharmaceutical ingredients of the drug product, coded using ICD-11 MMS
substance codes (XM-prefix). Populated automatically by clinical systems via
OCL Has-active-ingredient mappings. Combination drugs will carry multiple
ingredient entries. Unmatched ingredients may use text only without a coded value.
"""
* ingredient.item[x] only CodeableConcept
* ingredient.itemCodeableConcept 1..1 MS
* ingredient.itemCodeableConcept from BDICD11SubstancesVS (extensible)
* ingredient.itemCodeableConcept ^short = "ICD-11 substance code for the ingredient"
* ingredient.itemCodeableConcept ^definition = """
ICD-11 MMS substance code (XM-prefix) identifying the active ingredient.
Source value set: https://fhir.dghs.gov.bd/core/ValueSet/icd11-substances-valueset
served from the national OCL terminology server.
For ingredients not yet mapped to ICD-11 substances, use text only.
"""
* ingredient.strength 0..1
* ingredient.strength ^short = "Strength of the ingredient (optional)"
* ingredient.strength ^definition = """
Strength of the active ingredient. Optional in this profile as strength data
is maintained in the DGDA registry and accessible via OCL. May be populated
by dispensing systems for precision medication management.
"""