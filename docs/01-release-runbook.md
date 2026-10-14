# Release runbook

## Where the version lives

The single authoritative IG version is `<version value="...">` in
`input/bd.fhir.core.xml`. Every artifact inherits it.
`sushi-config.yaml` carries a version too, but the IG resource is hand-written
(`FSHOnly`), so that value is not used for the release.

## What triggers a build

| Event | Build | Deploy |
|---|---|---|
| Push of a tag `vX.Y.Z` | yes | yes (published as a release) |
| Pull request to `main` | yes | **no** |
| Push to `main` | no | no |

The workflow fails if the tag does not equal the version in
`input/bd.fhir.core.xml`. A full build takes in the order of an hour.

## Before releasing

1. Open a pull request to `main` to get a build that does not deploy.
2. Read the QA report of that build (`qa.html`) and compare it with the last
   release. Look at **categories** of messages, not only counts.
3. Make sure downstream changes that must land together are ready
   ([03](03-downstream-updates.md)), in particular anything that changes a
   canonical URL.
4. Bump `<version>` in `input/bd.fhir.core.xml` and commit to `main`.

## Releasing

```bash
git tag vX.Y.Z
git push origin vX.Y.Z
```

The pipeline then: extracts the version, validates it against the tag, updates
`package-list.json` and the history page, builds the IG with the HL7 IG
Publisher, updates the package feed, and deploys to the IG server.

### If a release has to be redone

Run the tag again on the corrected commit:

```bash
git tag -d vX.Y.Z
git push origin :refs/tags/vX.Y.Z
git tag vX.Y.Z
git push origin vX.Y.Z
```

Do **not** just re-run the failed deploy job from the Gitea UI: a re-run of a
single job cannot see the artifact of the original attempt (artifact download
fails with a 404). Always start a new run by re-tagging. Remember that this
replaces a published version in place; if consumers may have cached it,
release a new version number instead.

## Files that CI manages

- `package-list.json` (repository root and `input/`): the CI adds the release
  entry. Leave these files as they are; they work together with the workflow's
  versioning.
- `package-feed.xml` (repository root): the seed/fallback for the RSS package
  feed. The workflow prefers the live feed on the IG server as the base and
  only falls back to this file.

## After releasing: verify

```bash
# the published IG and its package
curl -sI https://fhir.dghs.gov.bd/core/<version>/package.tgz | head -1

# the package feed is valid XML and keeps its history
curl -s https://fhir.dghs.gov.bd/core/package-feed.xml | xmllint --noout -
curl -s https://fhir.dghs.gov.bd/core/package-feed.xml | grep -c "<item>"

# the version history lists the release
curl -s https://fhir.dghs.gov.bd/core/package-list.json | python3 -m json.tool | head -30
```

Also check:

- the QA report of the deployed build (`/core/<version>/qa.html`);
- the FHIR package registry for the package id once the crawler has run;
- the HL7 registry entry. Only milestone releases need a pull request to
  `FHIR/ig-registry` (edit the `editions` array of the `bd.fhir.core` entry; the
  repository's CI validates JSON structure only).

Then continue with [downstream updates](03-downstream-updates.md).

## Publisher version

The build downloads `publisher.jar` from a mirror that is updated **by hand**.
What is on the mirror at build time is what runs, so a replaced file changes
the next build. When upgrading the publisher, test it on a pull-request build
first, never on a release tag. Record which publisher version produced a
release (the QA page states it).

## CI runners

Both jobs run on the same runner label so that the artifact hand-off between
the build and deploy jobs works. Keep them on one label; a split caused the
artifact download to fail before.
