# Facility, Practitioner and Sender Validation

This page is for vendors. It describes what the national exchange checks when you submit a bundle, and what you get back.

The profiles in this IG define the **shape** of identifiers. Whether a facility or practitioner **exists** is checked against the national registries at submission time, because no profile can express that.

### 1. Declare the sending facility

Every submission bundle conforms to [BDSubmissionBundle](StructureDefinition-bd-submission-bundle.html). The sending facility is identified by its HRIS facility code in `meta.tag`:

```json
"meta": { "tag": [ { "system": "https://hris.mohfw.gov.bd/identifier/facility-code", "code": "10000033" } ] }
```

- If your authenticated client is authorised for **one** facility, the tag may be omitted: the exchange uses that facility.
- If it is authorised for **more than one** facility, the tag is required (BD-FAC-001).
- The declared facility must be one your client is authorised for. The facility head authorises a vendor to submit on the facility's behalf; the exchange enforces it.

### 2. The facility is accountable

Submitting a bundle is the sending facility's declaration that the practitioners in it work there. The facility administrator manages the facility's HRIS records and is accountable for the information submitted. Each submission is recorded with the authenticated client, facility, time and a bundle hash.

### 3. Facility rules

| Rule | Result |
|---|---|
| Sending or referenced facility code not found in HRIS | Rejected (BD-FAC-002) |
| Sending facility inactive | Rejected (BD-FAC-003) |
| Referenced facility (not the sender) inactive | Accepted; reported with BD-FAC-004 |

A referenced facility that is inactive is accepted because bundles can describe care at facilities that have since closed.

The facility's HRIS ownership decides which practitioner rules apply:

| HRIS ownership | Rules |
|---|---|
| Fully Government-owned, Government-Autonomous, Government-Semi-autonomous | Government facility |
| Non-Government (any type) | Non-government facility |

Rules follow the ownership recorded in HRIS, never `meta.profile` or anything else in the bundle.

### 4. Practitioners

Practitioners use [BDPractitioner](StructureDefinition-bd-practitioner.html). Send the identifier you hold, using the namespaces defined there: the HRIS provider ID, the BMDC registration number or the BNMC registration number. Send the practitioner's official full name in `name.text`.

#### 4.1 Government facilities: provider information is required

Every bundle from a government facility must include at least one practitioner **identified by an HRIS provider ID** in a clinical role: as author, requester, performer, interpreter or encounter participant. That practitioner is verified in HRIS. A bundle without one is rejected (BD-PRV-001).

#### 4.2 Prescribers and orderers are always verified

| Role | Element |
|---|---|
| Prescriber | `MedicationRequest.requester` |
| Order requester | `ServiceRequest.requester` |

These elements must reference a Practitioner or a PractitionerRole (whose `practitioner` is verified). A reference to an Organization or any other resource type is rejected (BD-PRV-002).

| Sending facility | Verified in |
|---|---|
| Government | HRIS |
| Non-government | HRIS, then BMDC (physicians) |

#### 4.3 Authors and procedure performers are verified when they can be

`Composition.author` and `Procedure.performer` are verified in the same way **when the practitioner carries an HRIS provider ID or a BMDC registration number**. A practitioner in these roles with only other identifiers (for example a BNMC registration number) is accepted on the facility's attestation (BD-PRV-006).

#### 4.4 What verification checks

- **Licence.** Whenever a BMDC registration number is verified, the licence must have been valid on the date of the encounter (BD-PRV-004). At a government facility, a practitioner who is found in HRIS is accepted on that match if BMDC cannot be reached.
- **Name.** `name.text` is compared with the registry record after normalising case, titles and punctuation. Spelling and transliteration differences are tolerated; a name that clearly does not match is rejected (BD-PRV-003). A stricter comparison will be introduced with advance notice (see Enforcement).
- **Unverifiable.** A practitioner that cannot be verified, for any reason, is rejected with BD-PRV-002. The response does not say why. The reason may be a mistyped number or a registration that is not currently valid, and the exchange does not distinguish them.
- **Registry unavailable.** If a registry needed to verify a prescriber, orderer or author is unavailable, nothing is accepted: the response is 503 with `Retry-After` (BD-PRV-005).

#### 4.5 Everyone else

Any other practitioner (for example a nurse recording vitals) is accepted on the facility's attestation and reported with BD-PRV-006.

### 5. Responses

All issues are returned together, not one at a time.

| Code | Severity | HTTP | Meaning |
|---|---|---|---|
| BD-SND-001 | error | 403 | Sender not authorised for the sending facility. Returned alone; nothing else is checked. |
| BD-SND-002 | error | 429 | Too many failed verifications from this sender. Retry later. |
| BD-FAC-001 | error | 422 | Sending facility not declared in `meta.tag` where required |
| BD-FAC-002 | error | 422 | Facility not found in HRIS |
| BD-FAC-003 | error | 422 | Sending facility inactive |
| BD-FAC-004 | information | 200 | Referenced facility inactive |
| BD-PRV-001 | error | 422 | Government facility bundle has no practitioner identified by an HRIS provider ID in a clinical role |
| BD-PRV-002 | error | 422 | Practitioner could not be verified in the allowed registries |
| BD-PRV-003 | error | 422 | Practitioner name clearly does not match the registry |
| BD-PRV-004 | error | 422 | Licence expired on the encounter date |
| BD-PRV-005 | error | 503 | A registry needed for verification is unavailable. Nothing was accepted. Retry after `Retry-After`. |
| BD-PRV-006 | information | 200 | Practitioner accepted on facility attestation |
| BD-PRV-010 | information | 200 | Practitioner verified |

When both 422-class errors and a 503 occur in one submission, 422 is returned, because those errors need fixing before a retry can succeed. Each issue's `expression` is the FHIRPath of the offending element. The codes are defined in the [BD Bundle Validation Outcome Codes](CodeSystem-bd-validation-outcome.html).

Responses never contain HRIS or BMDC details such as posts, other facilities, registration status or registered names.

### 6. Known limitations

- Nurses, midwives and paramedics at non-government facilities cannot currently be verified against any registry. They are accepted on the facility's attestation, except when recorded as a prescriber or orderer, where the bundle is rejected with BD-PRV-002 until a verification source exists.
- A valid registration number shows that the number is registered. It does not prove the person submitting is its holder; the name comparison reduces, but does not remove, that risk.
- Practitioners from other facilities (for example a referring doctor) can appear in a bundle. They are verified only if they hold a role that requires it.

### 7. Enforcement

The exchange validates against a specific published release of this IG, not the continuous build, and a change to the profiles reaches the exchange on an announced date.

| Change | Date |
|---|---|
| Profile constraints in this release take effect at the exchange | To be announced |
| Stricter practitioner name comparison | To be announced |
| Throttling of repeated failed verifications (BD-SND-002) | To be announced; monitored first |
| Further tightening, including any registry for nurses and paramedics | To be announced, with advance notice |
