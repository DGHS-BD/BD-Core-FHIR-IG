Profile:     BDObservationProfile
Id:          bd-observation
Parent:      Observation
Title:       "Bangladesh Observation Profile"
Description: "Bangladesh Observation Profile"
* ^url = "https://fhir.dghs.gov.bd/core/StructureDefinition/bd-observation"
* ^version = "1.0.0"
* ^status = #active

* identifier 1..* MS
* identifier.value 1..1

* status 1..1

* partOf 0..*

* category 1..* MS
* category from http://hl7.org/fhir/ValueSet/observation-category (required)
* category ^definition = "Type of category"
* category ^comment = "E.g. vital, physical examination"

* code 1..1 MS
* code from http://hl7.org/fhir/ValueSet/observation-codes (required)
* code ^definition = "Type of test/measurement"
* code ^comment = "E.g., Hb, RBS, CBC"

// Subject: Reference to Patient Profile (Required)
* subject 1..1 MS
* subject.reference 1..1 MS
* subject.display 1..1 MS
* subject.identifier 0..1
* subject ^definition = "Reference to Patient Profile"
* subject ^comment = "EX: http://mci.mcishr.dghs.gov.bd/api/v1/patients/98002412586"


* encounter 1..1 MS
* encounter.reference 1..1 MS
* encounter ^definition = "Reference to Patient Profile"
* encounter ^comment = "EX: uuid:34c38499-58ab-41e0-8e94-c3931491ad0e - bundle encounter uuid from local"

* performer 1..*
* performer.reference 1..1

// Value[x]: Result value (Optional, but constrained)
* value[x] 0..1
* value[x] ^definition = "Result value (Quantity, string, code, boolean, etc.)"
* valueQuantity 0..1
* valueQuantity ^comment = "If numeric, must include UCUM unit"
* valueQuantity.system 0..1
* valueQuantity.code 0..1
* valueString 0..1
* valueCodeableConcept 0..1
* valueBoolean 0..1
* valueInteger 0..1
* valueRange 0..1
* valueRatio 0..1
* valueSampledData 0..1
* valueTime 0..1
* valueDateTime 0..1
* valuePeriod 0..1

* interpretation 0..*
* interpretation from http://hl7.org/fhir/ValueSet/observation-interpretation (required)
* interpretation ^definition = "Type of test/measurement"
* interpretation ^comment = "E.g.: High, low, normal, etc"

* method 0..1
* method from http://hl7.org/fhir/ValueSet/observation-methods (required)
* method ^definition = "Type of observation method"
* method ^comment = "E.g.: Technique, Total measurement"

// Issued: Date/time result was issued (Optional)
* issued 0..1
* issued ^definition = "Date/time result was issued"

// Reference Range: Normal reference range (Optional)
* referenceRange 0..*
* referenceRange ^definition = "Normal reference range"
* referenceRange ^comment = "Optional"

// Specimen: Specimen used for the observation (Optional)
* specimen 0..1
* specimen ^definition = "Specimen used for the observation"
* specimen ^comment = "Optional"