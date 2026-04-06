CodeSystem: BDDGDADrugCS
Id: dgda-drug-registry
Title: "DGDA Drug Registry Code System"
Description: """
Code system representing the Drug Registration Authority (DGDA) of Bangladesh's
official drug registry. Concepts are maintained in the national OCL terminology
server at https://tr.ocl.dghs.gov.bd and are not enumerated within this
Implementation Guide.

This code system contains two concept classes:
- **Drug**: Finished pharmaceutical drug products (identified by DAR number and trade name)
- **Ingredient**: Raw material / active pharmaceutical ingredients

Concept IDs follow the format: `{DAR-number}--{trade-name-slug}`
Example: `353-0026-039--marvelous-fe`

**Canonical URL note:** `https://dgda.gov.bd/drug-registry` is a logical identifier
only and does not resolve to a web endpoint.
"""

* ^url = "https://dgda.gov.bd/drug-registry"
* ^version = "v1.0.0"
* ^status = #active
* ^experimental = false
* ^publisher = "Directorate General of Drug Administration (DGDA), Government of Bangladesh"
* ^contact.name = "DGHS Health Informatics Unit"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://dghs.gov.bd"
* ^jurisdiction = urn:iso:std:iso:3166#BD "Bangladesh"
* ^content = #not-present
* ^count = 39196
* ^caseSensitive = true
* ^valueSet = "https://dgda.gov.bd/fhir/ValueSet/registered-drugs"