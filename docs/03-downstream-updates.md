# Downstream updates

An IG release is not complete until these systems agree with it. Each section
says what to check; do them after the IG is published and the terminology
server is in its final state ([02](02-terminology-server.md)).

---

## 1. FHIR sandbox (HAPI)

Repository: https://git.dghs.gov.bd/riaz.somc/hapi-test-server
(its `README.md` has the full build and deploy procedure).

What the sandbox does: it loads the IG package, validates every submitted
resource against the profiles, and delegates terminology validation to TR
(and ICD-11 cluster validation to the cluster validator).

### Always

1. Replace `packages/package.tgz` with the published IG package.
2. Restart the server (the package is read at start-up).
3. Run `verify.sh` against the server.
4. Validate at least one example per area you changed (`$validate` does not
   store anything).

### When any canonical URL, binding or terminology changes - also rebuild

The validator **hard-codes** the URLs it sends to TR in
`src/main/java/gov/dghs/fhir/bd/validator/BdExpandOverrideTerminologySupport.java`:

- `OCL_SERVED_VALUESETS` - value set canonicals delegated to TR;
- `OCL_SERVED_SYSTEMS` - code system URIs fetched from / validated on TR.

Matching is by exact string. Consequences:

- A canonical that is **not** in these sets is not sent to TR; the server then
  falls back to local evaluation, which for large or filter-based sets does not
  work.
- A canonical that **is** in the set but no longer exists on TR is sent to TR
  and every code is rejected.

So whenever a canonical changes in the IG *or* on TR, update both sets, rebuild
the validator JAR, rebuild the image and restart. If the IG binds to a value set
whose canonical differs from the curated list held on TR, the validator needs
an explicit mapping from the IG canonical to the TR canonical; the exact-match
gate does not do this on its own.

The order in which the IG release, the TR change and the sandbox update happen
must be planned: a TR change made ahead of the sandbox update breaks the
sandbox for the time in between.

### Check after the update

- A resource with a known-good code from each terminology (ICD-11, LOINC,
  EDQM, DGDA) is accepted.
- A resource with an unknown code is rejected with a terminology message.
- The server log shows the IG package loaded at the expected version.

---

## 2. AI assistant knowledge

Knowledge documents (markdown): https://git.dghs.gov.bd/riaz.somc/fhir-assistant-knowledge

Document store (RAGFlow dataset), where the documents are uploaded:
http://172.16.18.171:8082/dataset/dataset/be6afc4646a011f1869da98e4f1484c1

Each document carries an `ig_version` in its front matter.

### After an IG release

1. Search the documents for **facts that the release changed**. Typical
   things that go stale: canonical URLs, concept counts, binding strengths
   (`required` / `extensible` / `preferred`), profile and element lists,
   descriptions of what is "planned" or "not yet available", example codes.
   Example search:
   ```bash
   grep -rnE "<changed URL or number or term>" DOC-*.md
   ```
2. Correct the affected documents and update `ig_version`.
3. Upload the changed documents to the RAGFlow dataset (replace the old
   files, do not add duplicates) and let the dataset re-parse them.
4. Ask the assistant a question for each changed fact and check the answer.

The assistant is LLM-based and its answers must stay consistent with the
published IG. A document that still states an old canonical or count will be
repeated to implementers.

---

## 3. Production HAPI server - REMINDER

> **There is no production HAPI FHIR server yet.** When one is created, it
> must be added to this release flow, otherwise it will drift from the IG.

When it exists, add here: where it runs, how the IG package is loaded, whether
it uses the same validator JAR and the same hard-coded sets as the sandbox, and
its verification steps. Treat it as a required step of every release, and
apply the section-1 warnings about canonicals before any change that touches
them.
