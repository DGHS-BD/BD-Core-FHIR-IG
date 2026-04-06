ValueSet: BDDGDADrugsVS
Id: dgda-registered-drugs
Title: "DGDA Registered Drugs Value Set"
Description: """
Value set containing all registered drug products from the Drug Registration
Authority (DGDA) of Bangladesh. This value set includes 39,196 finished
pharmaceutical drug product concepts maintained in the national OCL terminology
server at https://tr.ocl.dghs.gov.bd.

This value set is the normative binding for `BDMedication.code` and represents
the only permitted drug coding vocabulary for medication resources in the
Bangladesh national health information exchange.

Validation is performed via `$validate-code` and `$lookup` against the national
OCL terminology server. `$expand` is not supported for this value set due to its
size.

**Source collection:** dgda-registered-drugs-valueset (MoHFW organisation, OCL)
**OCL collection canonical:** https://dgda.gov.bd/fhir/ValueSet/registered-drugs
**OCL FHIR endpoint:** https://tr.ocl.dghs.gov.bd/orgs/MoHFW/collections/dgda-registered-drugs-valueset/
"""

* ^url = "https://dgda.gov.bd/fhir/ValueSet/registered-drugs"
* ^version = "v1.0.0"
* ^status = #active
* ^experimental = false
* ^publisher = "Directorate General of Drug Administration (DGDA), Government of Bangladesh"
* ^contact.name = "DGHS Health Informatics Unit"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://dghs.gov.bd"
* ^jurisdiction = urn:iso:std:iso:3166#BD "Bangladesh"
* ^immutable = false

* include codes from system "https://dgda.gov.bd/drug-registry"