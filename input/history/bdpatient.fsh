
Profile:     BDPatientProfile

Id:          bd-patient
Parent:      Patient
Title:       "Bangladesh Patient Profile"
Description: "All patient information of BD"

// ^ url = https://fhir.dghs.gov.bd/core/StructureDefinition/bd-patient

* identifier 1..*

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Identifier"
* identifier ^slicing.ordered = false

// nid, brn, uhid, passport, dl, tin
// * identifier contains nid 0..1 and  brn 0..1 and uhid 0..1 and passport 0..1 and dl 0..1 and tin 0..1

// * name 2..2

// * name ^slicing.discriminator.type = #value
// * name ^slicing.discriminator.path = ""
// * name ^slicing.rules = #open
// * name ^slicing.description = "Patient names (Bangla and English required) "
// * name ^slicing.ordered = false

// * name contains 
//     bangla 1..1 and 
//     english 1..1

// * name[bangla].text = "Full name in Bangla"
// //* name[bangla].language = "BN" 

// * name[english].text 1..1

* name 1..1
* name.text 1..1

* birthDate 1..1
//* birthplace 1..1

* gender 1..1 
* gender from http://hl7.org/fhir/ValueSet/administrative-gender

* telecom 0..* MS
* telecom.system 1..1 
* telecom.system from http://hl7.org/fhir/ValueSet/contact-point-system (required)
* telecom.value 1..1
* telecom.use 0..1
* telecom.use from http://hl7.org/fhir/ValueSet/contact-point-use (required)

* extension contains http://hl7.org/fhir/StructureDefinition/patient-nationality named PatientNationality 1..1


* link 2..*
* link ^slicing.discriminator.type = #value
* link ^slicing.discriminator.path = "system"
* link ^slicing.rules = #open
* link ^slicing.description = ""
* link ^slicing.ordered = false

* link contains 
    father 1..1 and
    mother 1..1

// * link[father].other.reference 1..1


// * link[father].other.identifier 0..1
// definition of identifier

// TODO
// * link[father].other.identifier from BdIdentifierTypeVS (required)

// * link[father].other.relationship 1..1
// definition of relationship

// * link[mother].other only Reference(RelatedPerson)
// * link[mother].other.reference 1..1

// * link[mother].other.identifier 0..1
// TODO
// * link[mother].other.identifier from BdIdentifierTypeVS (required)

Profile: RelatedPersonMother
Id: relatedperson-mother
Parent: RelatedPerson
Title: "RelatedPerson Mother Profile"
Description: "Profile for RelatedPerson representing the mother"
* relationship.coding.code = #MTH
* identifier 1..1

// TODO
// * identifier includes codes from system  BdIdentifierTypeVs# (required)
// * identifier from  BdIdentifierTypeVs# (required)


Profile: RelatedPersonFather
Id: relatedperson-father
Parent: RelatedPerson
Title: "RelatedPerson Father Profile"
Description: "Profile for RelatedPerson representing the father"
* relationship.coding.code = #FTH
* identifier 1..1

// TODO
// * includes codes from system  BdIdentifierTypeVs# (required)


//Address
* address 1..* MS
* address only BDAddress