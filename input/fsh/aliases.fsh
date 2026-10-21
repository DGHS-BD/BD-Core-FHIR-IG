// Identifier namespaces for facility and practitioner identity.
// These strings are exact-match keys that end up in vendor data: never change or repurpose them.
// Each is documented as a NamingSystem in input/fsh/namingSystems/.
//
// HRIS identifiers use the ministry-neutral HRIS host. BMDC and BNMC do not publish identifier
// URIs, so the IG defines theirs in the DGHS namespace (outside /core/, so a change to the IG's
// URL cannot affect them). The facility staff ID is likewise defined by the IG: it identifies staff who
// hold no licence or registration number, and is unique only within the facility that assigns it.

Alias: $BD-FACILITY-CODE = https://hris.mohfw.gov.bd/identifier/facility-code
Alias: $BD-PROVIDER-ID   = https://hris.mohfw.gov.bd/identifier/provider-id
Alias: $BD-POST-ID       = https://hris.mohfw.gov.bd/identifier/post-id
Alias: $BMDC-REG         = https://fhir.dghs.gov.bd/identifier/bmdc-registration
Alias: $BNMC-REG         = https://fhir.dghs.gov.bd/identifier/bnmc-registration
Alias: $BD-FACILITY-STAFF-ID = https://fhir.dghs.gov.bd/identifier/facility-staff-id
