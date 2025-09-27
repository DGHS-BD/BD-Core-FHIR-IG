// @Name: Profile
// @Description: Example of a profile of the Patient resource. This example includes a few of the most commonly used constraints and documentation features of FHIR profiles.

Profile:     PatientProfile
Id:             patient-profile
Parent:      Patient
Title:         "Patient Profile for Bangladesh"
Description: "Profile of Patient Bangladesh Standard"

// ----- Begin rules:

// Require at least one value inside the name element
* name 1..* MS
* name ^slicing.discriminator.type = #value
* name ^slicing.discriminator.path = "use"
* name ^slicing.rules = #open
* name contains
    EN 1..1 and
    BN 1..1

* name[EN].use = #official
* name[BN].use = #usual

* identifier 1..* MS
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
* identifier[NID].type.text = "Organization identifier"
 
* identifier[BRN].system = "http://dghs.gov.bd/identifier/brn"
* identifier[BRN].type.coding.code = #BRN
* identifier[BRN].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[BRN].type.text = "Organization identifier"


* identifier[UID].system = "http://dghs.gov.bd/identifier/uid"
* identifier[UID].type.coding.code = #UID
* identifier[UID].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[UID].type.text = "Organization identifier"


// Mark elements as MustSupport
// * name and name.given and name.family MS
// * name ^short = "dak nam"
// * name ^definition = "Official name (i.e., legal name) of the patient, corresponding to official in [this value set](https://www.hl7.org/fhir/valueset-name-use.html)."

// The contents of ^comment are also displayed on the "Detailed Descriptions" tab
// in the built Implementation Guide.
* birthDate ^comment = "If exact date of birth is partially or completely unknown, Implementers SHALL populate this element with the date of birth information listed on the patient's government-issued identification."

// Do not allow gender to be included.
* gender 1..1

// Require a value from a specific value set be used for an element
* maritalStatus from http://hl7.org/fhir/ValueSet/marital-status

// Restrict something[x] to a specific type -- in this case only allowing dateTime to be used
* deceased[x] only dateTime
