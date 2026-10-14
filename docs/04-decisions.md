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
