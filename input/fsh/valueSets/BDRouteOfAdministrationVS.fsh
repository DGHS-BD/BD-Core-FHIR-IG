ValueSet: BDRouteOfAdministrationVS
Id: bd-route-of-administration
Title: "Route of Administration Value Set"
Description: """
Value set containing route of administration concepts from the HL7 Version 3
RouteOfAdministration code system.

This value set is used to code the route by which a medication is administered
in MedicationRequest.dosageInstruction.route. HL7 v3 RouteOfAdministration
is a license-free, internationally recognised vocabulary already embedded in
the FHIR ecosystem.

Concepts are loaded into the national OCL terminology server at
https://tr.ocl.dghs.gov.bd under the MoHFW organisation.

**Code system canonical:** http://terminology.hl7.org/CodeSystem/v3-RouteOfAdministration
**Binding:** required on BDMedicationRequest.dosageInstruction.route
"""

* ^url = "https://fhir.dghs.gov.bd/core/ValueSet/bd-route-of-administration"
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^publisher = "DGHS Health Informatics Unit"
* ^contact.name = "DGHS Health Informatics Unit"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://dghs.gov.bd"
* ^jurisdiction = urn:iso:std:iso:3166#BD "Bangladesh"
* ^immutable = false

* include codes from system "http://terminology.hl7.org/CodeSystem/v3-RouteOfAdministration"