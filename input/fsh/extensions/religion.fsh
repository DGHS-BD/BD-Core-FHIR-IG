Extension: ReligionBD
Description: "Example Religion"
Id: religion-bd 
Title: "Religion Extension"
Context: Patient


// Religion using standard HL7 extension
* extension contains http://hl7.org/fhir/StructureDefinition/patient-religion named religion 0..1
* extension[religion] ^short = "ধর্ম (Religion)"
* extension[religion] ^definition = "The patient's religious affiliation."
* extension[religion].valueCodeableConcept from http://hl7.org/fhir/ValueSet/religious-affiliation