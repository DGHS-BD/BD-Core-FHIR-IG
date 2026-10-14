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

**Large terminology checks time out.**
Validating `CodeSystem.jurisdiction` against the HL7 jurisdiction value set
and some very large value sets can exceed 60 s and are reported as errors.
These are environmental; do not "fix" content for them.

**Links to canonicals of terminology that is only on TR are reported as
"cannot be resolved".**
If the canonical is under the IG's own base URL the link checker expects an
IG page. Bind to an IG-defined value set (or use a canonical outside the IG
base) instead of suppressing.

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
