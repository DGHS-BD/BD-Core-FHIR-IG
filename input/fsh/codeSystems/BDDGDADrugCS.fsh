CodeSystem: BDDGDADrugCS
Id: dgda-drug-registry
Title: "DGDA Drug Registry Code System"
Description: """
Code system built on the drug registry of the Directorate General of Drug
Administration (DGDA) of Bangladesh. The registration data is owned by DGDA;
the concepts are curated, mapped to ICD-11 and maintained by DGHS in the
national OCL terminology server at https://tr.ocl.dghs.gov.bd and are not
enumerated within this Implementation Guide.

This code system contains two concept classes:
- **Drug**: Finished pharmaceutical drug products (identified by DAR number and trade name)
- **Ingredient**: Raw material / active pharmaceutical ingredients

Concept IDs follow the format: {DAR-number}--{trade-name-slug}
Example: 353-0026-039--marvelous-fe

**Canonical URL note:** since version v2.0.0 the canonical URL is in the DGHS
namespace. The former identifier https://dgda.gov.bd/drug-registry (v1.0.0) was
a logical identifier only, did not resolve to a web endpoint and is not published
by DGDA; it is kept as a legacy alias in the NamingSystem dgda-drug-registry-bd.
"""

* ^url = "https://fhir.dghs.gov.bd/core/CodeSystem/dgda-drug-registry"
* ^version = "v2.0.0"
* ^status = #active
* ^experimental = false
* ^publisher = "Directorate General of Health Services (DGHS), MoHFW, Bangladesh"
* ^copyright = "Drug registration data: Directorate General of Drug Administration (DGDA), Government of Bangladesh. Curated and mapped to ICD-11 by DGHS."
* ^contact.name = "DGHS Health Informatics Unit"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://dghs.gov.bd"
* ^jurisdiction = urn:iso:std:iso:3166#BD "Bangladesh"
* ^content = #not-present
* ^count = 39196
* ^caseSensitive = true
* ^valueSet = "https://fhir.dghs.gov.bd/core/ValueSet/dgda-registered-drugs"