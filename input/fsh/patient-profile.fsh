// @Name: Profile
// @Description: Example of a profile of the Patient resource. This example includes a few of the most commonly used constraints and documentation features of FHIR profiles.

Profile:     BDPatientProfile
Id:          bd-patient
Parent:      Patient
Title:       "Patient Profile for Bangladesh"
Description: "Profile of Patient Bangladesh Standard"

// ----- Begin rules:

// Require at least one value inside the name element
* name 2..*
// === 1. Declare slicing on name by 'use' ===
* name ^slicing.discriminator.type = #value
* name ^slicing.discriminator.path = "system"
* name ^slicing.rules = #open
* name ^slicing.description = "Slice name by use (official for English, usual for Bangla)"

// === 2. Define slices ===
* name contains
    nameEnglish 1..1 MS and   // slice alias for English name
    nameBangla 1..1 MS        // slice alias for Bangla name

// === 3. Constrain English (official) name ===
* name[nameEnglish].use = #en (exactly)
* name[nameEnglish].given 0..*
* name[nameEnglish].family 0..1
* name[nameEnglish] ^short = "Legal name (English/Romanized)"
* name[nameEnglish] ^definition = "Official name as registered in government documents."


// === 4. Constrain Bangla name ===
* name[nameBangla].use = #bn (exactly)
* name[nameBangla].given 0..*
* name[nameBangla].family 0..1
* name[nameBangla] ^short = "নাম (বাংলা)"
* name[nameBangla] ^definition = "Patient's name written in Bengali script."


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
    UID 0..1

* identifier[NID].system = "http://dghs.gov.bd/identifier/nid"
* identifier[NID].type.coding.code = #NID
* identifier[NID].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[NID].type from BangladeshIdentifierTypeVS (extensible)
* identifier[NID].type.text = "Organization identifier"
* identifier[NID].value = "Personal identifier National ID"

// Then in your profile:
// * identifier.type from BangladeshIdentifierTypeVS (extensible)
 
* identifier[BRN].system = "http://dghs.gov.bd/identifier/brn"
* identifier[BRN].type.coding.code = #BRN
* identifier[BRN].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[BRN].type from BangladeshIdentifierTypeVS (extensible)
* identifier[BRN].type.text = "Organization identifier"
* identifier[BRN].value = "Personal identifier Birth Registration"


* identifier[UID].system = "http://dghs.gov.bd/identifier/uid"
* identifier[UID].type.coding.code = #UID
* identifier[UID].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[UID].type from BangladeshIdentifierTypeVS (extensible)
* identifier[UID].type.text = "Organization identifier"
* identifier[UID].value = "Personal identifier"


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
* extension[religion] ^short = "ধর্ম (Religion)"
* extension[religion] ^definition = "The patient's religious affiliation."
* extension[religion].valueCodeableConcept from http://hl7.org/fhir/ValueSet/religious-affiliation

* address 1..* MS
* address only BDAddress 