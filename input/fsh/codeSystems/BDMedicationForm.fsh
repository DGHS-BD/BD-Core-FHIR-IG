// ---------------------------
// CodeSystem for BD Medication Dose Forms
// ---------------------------
CodeSystem: BDMedicationDoseForm
Id: bd-dose-form
Title: "Bangladesh Medication Dose Form CodeSystem"
Description: "Medication dose form codes according to CCDS guideline"
* ^url = "https://fhir.dghs.gov.bd/core/CodeSystem/bd-dose-form"
* ^content = #complete

* #TAB "Tablet"
    "Solid oral dosage form, usually uncoated or coated, intended for swallowing."
* #DTAB "Dispersible Tablet"
    "Tablet designed to be dissolved/dispersed in water before administration."
* #CAP "Capsule"
    "Solid dosage form with active ingredients enclosed in a gelatin shell."
* #SYP "Syrup"
    "Liquid oral dosage form containing active substance(s) in solution."
* #SUSP "Suspension"
    "Liquid oral dosage form with insoluble particles dispersed in a liquid."
* #PFS "Powder for Suspension"
    "Powder that requires reconstitution into a liquid suspension before use."
* #INJ "Injection"
    "Sterile solution or suspension intended for parenteral administration."
* #SOL "Solution"
    "Liquid dosage form where drug is fully dissolved in a solvent."
* #CRM "Cream"
    "Semi-solid topical dosage form containing the drug in an emulsion base."
* #LOT "Lotion"
    "Low-viscosity liquid topical dosage form for external application."


// ---------------------------
// ValueSet for BD Medication Dose Forms
// ---------------------------
ValueSet: BDMedicationDoseFormVS
Id: bd-dose-form-valueset
Title: "Bangladesh Medication Dose Form ValueSet"
Description: "Medication dose form value set according to CCDS guideline"
* ^url = "https://fhir.dghs.gov.bd/core/ValueSet/bd-dose-form-valueset"
* include codes from system BDMedicationDoseForm