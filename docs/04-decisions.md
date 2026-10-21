# Decisions and the reasons behind them

Keep this list current. A decision recorded with its reason can be revisited
properly; a decision that is only remembered gets repeated by accident.

## Terminology

**Large national terminologies live on TR; the IG holds stubs.**
ICD-11, LOINC lists, EDQM and DGDA are maintained in the national OCL server.
The IG declares the value sets and code systems it binds to without
enumerating codes. Reason: the lists are large and change independently of the
IG, and enumerating them makes the IG build slow and risks publisher time-outs.
`$expand` is not available on TR, so the IG cannot rely on expansion anyway.

**Do not enumerate large code lists in the IG.**
The IG build already takes about an hour. Validating thousands of enumerated
codes against an external terminology server risks time-outs that fail the
build.

**Canonicals the IG defines belong to the DGHS namespace.**
A canonical URL identifies exactly one definition and should be in a domain
whose owner publishes it. URIs in another body's domain are used only when that
body itself defines them as the identifier of its codes (for example WHO for
ICD-11 MMS). Data owned by another body (for example DGDA registration data) is
credited in `publisher`/`copyright` and in a NamingSystem, not by borrowing its
domain.

**One canonical, one definition.**
If the IG and TR both define a value set under the same canonical, the two
definitions must be the same thing. Do not publish an excerpt or a broader
definition under a canonical that TR serves with different content.

**Legacy identifiers are kept as aliases, never silently dropped.**
When a canonical moves, record the old URI in a NamingSystem so data coded with
it can still be recognised.

## Bindings

**LOINC for laboratory codes is mandatory, expressed as `extensible` binding
plus an invariant.**
`required` would make any test outside the curated list impossible to report,
pushing laboratories to mis-map to the nearest code. The invariant
(`bd-loinc-code`) still makes a LOINC coding mandatory on `Observation.code`.
Membership in the curated national list is enforced at runtime by TR
(`$validate-code`). National guides of comparable maturity use `extensible` or
`preferred` for laboratory codes.

**The IG's LOINC value sets are broad filter definitions.**
They describe the kind of code (laboratory class, order/observation, panel or
answer) with LOINC filters. The curated list is the value set on TR. This keeps
the IG build cheap while TR remains the authority.

**Coded results (answers) are not forced to LOINC.**
Results may legitimately use other systems (for example organisms), so the
LOINC invariant applies to the test code only.

## Facility and practitioner identity

**Profiles check the shape of identifiers; the exchange checks existence.**
No profile can say whether a facility or practitioner exists, and standard
validators do not follow external references. Existence checks run at
submission time in the interoperability layer and are described for vendors on
the Validation page. Rule details that would help someone probe the registries
live with the mediator, not in this repository.

**`BDOrganization` stays loose; `BDFacility` carries the facility code.**
Organizations also describe payers, referral destinations abroad and programme
bodies, which have no facility code. The HRIS facility code is the only
facility identifier slice: it is unique and stable, and DHIS2, OpenMRS and
OpenSRP use the same code.

**Identifier namespaces: HRIS on the HRIS host, councils in the DGHS namespace.**
HRIS identifiers use `hris.mohfw.gov.bd` (the ministry-neutral name for the
same application as `hrm.dghs.gov.bd`). BMDC and BNMC do not publish identifier
URIs, so the IG defines theirs under `https://fhir.dghs.gov.bd/identifier/`,
outside `/core/` so a change to the IG's URL cannot affect them. The strings
are exact-match keys in vendor data: fix them and never repurpose a path.
Earlier example URIs are kept as legacy aliases in the NamingSystems.

**`BDPractitioner` uses open slicing with no "one of" invariant.**
Slices exist for the HRIS provider ID, the BMDC registration and the BNMC
registration. Open slicing lets other councils send identifiers without a
profile change, so an invariant requiring a named identifier would contradict
it. Which practitioners must be verified is a rule of the exchange, by role.

**`name.text` is required on `BDPractitioner`.**
In Bangladesh the official full name is used as a single string, not split into
family and given names. The registry comparison needs a name to compare.

**Staff without a licence number are identified by a facility staff ID.**
Laboratory technologists and similar staff hold no number in any national
register, so there is nothing to tell two of them apart or to avoid storing the
same person twice. The facility staff ID is unique only within the facility that
assigns it and is never verified against a registry; the person is accepted on
the facility's attestation.

**National ID is not collected in bundles.**
An NID together with a registration number cannot be verified as a pair, so it
proves nothing, and it would move national ID numbers through every vendor's
bundles and logs. Revisit if an NID verification service appears.

**Prescribers must reference a practitioner.**
`MedicationRequest.requester` allows a `BDPractitioner` or `BDPractitionerRole`
but not an organization; otherwise a prescription with an organization as
requester would carry no practitioner to verify.

**The sending facility is accountable.**
Sending a practitioner is the facility's declaration that the person works
there. Affiliation is recorded, not validated, because HRIS keeps no history and
attachments and additional charge do not fit a one-post model.

## Process

**`package-list.json` is managed by CI.**
It works together with the workflow's versioning. Leave both copies as they are.

**Releases are made by tag; pull requests build without deploying.**
This gives a safe way to see a build's QA report before anything is published.

**Examples must be validated against the live terminology.**
Check every code used in an example on TR (or the relevant server) before
committing it. An example whose ingredient, display or code disagrees with TR
teaches implementers the wrong thing.

**Numbers in narratives are read from the server, not remembered.**
Concept counts and class breakdowns have drifted before. Re-check them when a
terminology version changes.

**Narratives avoid hard-coding the IG version.**
The version is shown by the IG itself and by the version history.
