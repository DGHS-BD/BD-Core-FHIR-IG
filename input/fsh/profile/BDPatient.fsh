Alias: $translation = http://hl7.org/fhir/StructureDefinition/translation
// @Name: Profile
// @Description: Example of a profile of the Patient resource. This example includes a few of the most commonly used constraints and documentation features of FHIR profiles.
Profile:     BDPatientProfile
Id:          bd-patient
Parent:      Patient
Title:       "Patient Profile for Bangladesh"
Description: """
Patient profile for Bangladesh.  
- Identifiers: NID, BRN, UHID  
- Name must be provided in both Bangla and English.  
- SHALL have at least one RelatedPerson with relationship = father or mother, and that RelatedPerson SHALL include both a name and an identifier.
"""

// ----- Begin rules:
// Require exactly one HumanName
* name 1..1 MS
* name.use 1..1
* name.use = #official (exactly)

// Require a text element
* name.text 1..1 MS

// Require translation extensions on text
* name.text.extension 2..* MS
* name.text.extension contains
    $translation named nameEn 1..1 MS and
    $translation named nameBn 1..1 MS

// Constraints on English name
* name.text.extension[nameEn].extension[lang].valueCode = #en (exactly)
* name.text.extension[nameEn].extension[content] 1..1 MS

// Constraints on Bangla name
* name.text.extension[nameBn].extension[lang].valueCode = #bn (exactly)
* name.text.extension[nameBn].extension[content] 1..1 MS

//////////////////////

* identifier 1..*
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier ^slicing.description = "Slice based on the type of identifier."
* identifier contains
    NID 0..1 and
    BRN 0..1 and
    UHID 0..1

* identifier[NID].system = "http://dghs.gov.bd/identifier/nid"
* identifier[NID].type.coding.code = #NID
// * identifier[NID].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[NID].type.coding.system = "https://fhir.dghs.gov.bd/core/ValueSet/bd-identifier-type"
* identifier[NID].type from BangladeshIdentifierTypeVS (extensible)
* identifier[NID].type.text = "Organization identifier"
// * identifier[NID].value = "Personal identifier National ID"

// Then in your profile:
// * identifier.type from BangladeshIdentifierTypeVS (extensible)

* identifier[BRN].system = "http://dghs.gov.bd/identifier/brn"
* identifier[BRN].type.coding.code = #BRN
* identifier[BRN].type.coding.system = "https://fhir.dghs.gov.bd/core/ValueSet/bd-identifier-type"
* identifier[BRN].type from BangladeshIdentifierTypeVS (extensible)
* identifier[BRN].type.text = "Organization identifier"
// * identifier[BRN].value = "Personal identifier Birth Registration"


* identifier[UHID].system = "http://dghs.gov.bd/identifier/uhid"
* identifier[UHID].type.coding.code = #UHID
* identifier[UHID].type.coding.system = "https://fhir.dghs.gov.bd/core/ValueSet/bd-identifier-type"
* identifier[UHID].type from BangladeshIdentifierTypeVS (extensible)
* identifier[UHID].type.text = "Organization identifier"


// Mark elements as MustSupport
// * name and name.given and name.family MS
// * name ^short = "dak nam"
// * name ^definition = "Official name (i.e., legal name) of the patient, corresponding to official in [this value set](https://www.hl7.org/fhir/valueset-name-use.html)."

// The contents of ^comment are also displayed on the "Detailed Descriptions" tab
// in the built Implementation Guide.
* birthDate ^comment = "If exact date of birth is partially or completely unknown, Implementers SHALL populate this element with the date of birth information listed on the patient's government-issued identification."

// Do not allow gender to be included.
* gender 1..1
// * include codes from system http://hl7.org/fhir/ValueSet/administrative-gender


// Require a value from a specific value set be used for an element
* maritalStatus from http://hl7.org/fhir/ValueSet/marital-status

// Restrict something[x] to a specific type -- in this case only allowing dateTime to be used
* deceased[x] only dateTime

// Religion using standard HL7 extension
* extension contains http://hl7.org/fhir/StructureDefinition/patient-religion named religion 0..1
* extension[religion].valueCodeableConcept from https://fhir.dghs.gov.bd/core/ValueSet/bd-religions

* address 1..* MS
* address only BDAddress
