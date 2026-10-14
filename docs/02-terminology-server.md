# Terminology server (TR / OCL)

The national terminology server runs OpenConceptLab (OCL). The IG does **not**
contain the large code lists; it contains stub definitions and relies on TR for
runtime validation.

| What | URL |
|---|---|
| Web UI | https://tr.ocl.dghs.gov.bd |
| FHIR R4 base | `https://tr.ocl.dghs.gov.bd/api/fhir` |
| OCL API (used for versions and releases) | `https://api.tr.ocl.dghs.gov.bd` |

## How objects are modelled

| FHIR | OCL object | Notes |
|---|---|---|
| CodeSystem | **Source** | e.g. `MoHFW/<source-id>` |
| ValueSet | **Collection** | references concepts of a source |

Each has a mutable **`HEAD`** and immutable released **versions**.

> **The FHIR API serves released versions only.** Editing `HEAD` (for example a
> canonical URL) has no visible effect on the FHIR API until a new version is
> created and marked released.

## Changing a canonical URL or content

Order matters:

1. Edit the canonical on the **source** `HEAD`.
2. Edit the canonical on the **collection** `HEAD`.
3. Create and release a new **source** version. Wait until processing finishes
   (large sources take many minutes).
4. Create and release a new **collection** version (it snapshots the source's
   concepts).
5. Verify through the FHIR API (below).
6. Update every consumer that hard-codes the canonical
   ([03](03-downstream-updates.md)) in the same change window.

Use new version ids; do not delete a released version. If an old canonical is
still being served after the new version is released, un-release the old
version (`released: false`) instead of deleting it.

### Commands

The token is read from an environment variable; never put it in a file.

```bash
export OCL_TOKEN='<api token>'

# edit a canonical on HEAD
curl -s -X PATCH "https://api.tr.ocl.dghs.gov.bd/orgs/<org>/sources/<source>/" \
  -H "Authorization: Token $OCL_TOKEN" -H "Content-Type: application/json" \
  -d '{"canonical_url":"<new canonical>"}'

# create and release a version
curl -s -X POST "https://api.tr.ocl.dghs.gov.bd/orgs/<org>/sources/<source>/versions/" \
  -H "Authorization: Token $OCL_TOKEN" -H "Content-Type: application/json" \
  -d '{"id":"<version id>","description":"<why>","released":true}'
```

The same two calls work for `collections/<collection>/`. Version id style
differs between objects (some use a `v` prefix); check the existing ids first.

## Verifying

```bash
# is the canonical served, and at which version?
curl -s "https://tr.ocl.dghs.gov.bd/api/fhir/CodeSystem?url=<canonical>"
curl -s "https://tr.ocl.dghs.gov.bd/api/fhir/ValueSet?url=<canonical>"

# a source version finished processing?
curl -s -H 'Accept: application/json' \
  "https://api.tr.ocl.dghs.gov.bd/orgs/<org>/sources/<source>/<version>/?includeSummary=true"
```

A collection version is complete when its reference count equals the number of
concepts and `expansions` is 1. The `is_processing` flag on a collection can
stay `true` after the data is complete; judge by the reference and expansion
counts and by a successful `$validate-code`.

### Operation parameters differ per operation

| Operation | Pass the code system as |
|---|---|
| `CodeSystem/$validate-code` | `url=` (using `system=` returns `false` even for valid codes) |
| `CodeSystem/$lookup` | `system=` |
| `ValueSet/$validate-code` | `url=<value set>` and `system=<code system>` |

`$expand` is not supported by this OCL instance. Do not design anything that
depends on it.

## Counting what the server really holds

Do not trust numbers copied into narratives. Read them from the server:

```bash
# concepts by class: page through /concepts/?limit=1000&page=N and count concept_class
curl -s -H 'Accept: application/json' \
  "https://api.tr.ocl.dghs.gov.bd/orgs/<org>/sources/<source>/?includeSummary=true"
```

A collection can hold more *references* than distinct *concepts*; quote the
concept count.
