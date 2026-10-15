# Known quirks

Problems that have already cost time. Each entry says what you see, why, and
what to do.

## CI

**Deploy job fails with `List Artifacts ... 404` when re-run.**
A re-run of a single job cannot see the artifact of the first attempt, and
build and deploy on different runner labels cannot share artifacts at all.
Fix: re-tag to start a new run; keep both jobs on one runner label.

**`apt-get install` fails with 404 on the CI image.**
The job image is an end-of-life Debian release whose package repositories are
gone. The workflow installs the static Docker CLI instead. Do not reintroduce
`apt` for Docker.

**Previous-version comparison finds nothing (every artifact "Added").**
The previous package was passed to the publisher container with a bind mount
using a path that does not exist on the Docker host (the job itself runs in a
container). It is now copied with `docker cp`. If a comparison is empty, check
the build log for "Unable to resolve package id".

**Deploy fails with "can't connect without a private SSH key or password".**
The deployment secrets arrived empty (this happened after the Git server was
migrated: the stored values could not be decrypted). Re-enter the secrets in
Gitea and test them in a throw-away workflow that prints only their lengths.

**A packaged feed with duplicate namespace declarations.**
The RSS package feed must be well-formed XML; crawlers reject it otherwise.
Validate with `xmllint --noout`.

## Publisher and QA

**"Unable to compare with previous version ... Refusing to fetch from
non-public address" and "Publication Request: Error fetching package-list".**
Publisher 2.3 and later has SSRF protection on by default and refuses to fetch
from any host that resolves to a private address. Inside the CI network the IG's
own domain resolves to a private address, so the publisher cannot read the
published `package-list.json`: the previous-version comparison page is not
produced and the publication check wrongly believes the IG was never published.
The build otherwise passes, so it is easy to miss; look at the "Quality Checks"
table at the top of `qa.html`. The build step passes
`-ssrf-protection-enabled false` to the publisher. Only do that where the IG
content and its dependencies are trusted, as they are in this pipeline.

**Large terminology checks time out.**
Validating `CodeSystem.jurisdiction` against the HL7 jurisdiction value set
and some very large value sets can exceed 60 s and are reported as errors.
These are environmental; do not "fix" content for them.

**Links to canonicals of terminology that is only on TR are reported as
"cannot be resolved".**
If the canonical is under the IG's own base URL the link checker expects an
IG page. Bind to an IG-defined value set (or use a canonical outside the IG
base) instead of suppressing.

**`history.html` shows one "cannot be resolved" error per published version
(and for `package-list.json`), and the QA header says `broken links = N`.**
The version links are under the IG's own canonical, so the offline link
checker expects those pages in the build output; the other versions live in
their own folders on the IG server and are not in the build. The links work on
the published site (check them with `curl -I`). These errors cannot be hidden
with `ignoreWarnings.txt` (only warnings and hints can be suppressed), and
keeping `package-list.json` in the build container does not change it. Guides
that do not show this build the version table in the browser from
`package-list.json`, so the static HTML contains no version links. Treat it as
cosmetic; `err = 0` and the build passes.

**QA says `err = 0` but `ERROR:` lines are still listed.**
Newer publisher versions count unresolved links separately (`broken links`)
from errors. Read both numbers.

**A page fails with "more than one top level heading" (WCAG).**
The publisher renders every page title as the page's `<h2>`. A markdown page
under `input/pagecontent/` must not start with its own `##` heading; start at
`###`.

**"URL Mismatch" / "canonical URL does not match" for a resource whose canonical
is outside the IG's base (for example WHO's ICD-11 system URI).**
List the canonical in full as an IG `special-url` parameter in
`input/bd.fhir.core.xml`. One entry per canonical; patterns are not supported.

**Comparison pages (`comparison-vX/`) have no CSS and broken icons, and some
links point at `file:///tmp/...`.**
Publisher behaviour; cosmetic.

**The IG's comparison reports a changed `version` as a breaking change on
every resource.**
Expected on every release; the "0 changes" column is the one to read.

## Terminology server

**Editing a canonical has no effect.**
Only released versions are served. See [02](02-terminology-server.md).

**`CodeSystem/$validate-code` with `system=` returns `false` for valid codes.**
Use `url=`. `$lookup` is the reverse.

**Concept totals in narratives drift.**
Re-read counts from the server.

## Sandbox

**Valid drug or lab codes are suddenly rejected after a terminology change.**
The sandbox validator sends exact canonical strings to TR. If a canonical
changed on TR, or the IG now binds to a different canonical, its hard-coded
sets must be updated and the validator rebuilt. See
[03](03-downstream-updates.md).

**The sandbox's CapabilityStatement does not mention the IG.**
That is normal: the definitions are loaded into the validation chain, not
stored as server resources, so searching for `StructureDefinition` returns
nothing. Validate a resource with `$validate` to see which IG version is
loaded (the message names the profile and version).
