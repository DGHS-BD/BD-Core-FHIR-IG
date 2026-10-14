# Maintainer documentation

This folder is **not part of the published Implementation Guide**. The IG
publisher only reads `input/`; these files are for whoever maintains the IG and
the systems around it.

## What this project is made of

| Part | What it is | Where |
|---|---|---|
| IG source | FSH profiles, value sets, examples, narratives | this repository (`input/`) |
| CI/CD | Builds the IG on a tag and deploys it | `.gitea/workflows/ci-cd.yaml` |
| Published IG | The IG and its packages and feed | https://fhir.dghs.gov.bd/core |
| Terminology server (TR) | National OCL instance holding ICD-11, LOINC, EDQM and DGDA terminology | https://tr.ocl.dghs.gov.bd (UI), `https://tr.ocl.dghs.gov.bd/api/fhir` (FHIR), `https://api.tr.ocl.dghs.gov.bd` (OCL API) |
| FHIR sandbox | HAPI server that validates against the IG and TR | https://git.dghs.gov.bd/riaz.somc/hapi-test-server |
| AI assistant knowledge | Markdown documents the assistant answers from | https://git.dghs.gov.bd/riaz.somc/fhir-assistant-knowledge |
| AI assistant document store | RAGFlow dataset the knowledge documents are uploaded to | http://172.16.18.171:8082/dataset/dataset/be6afc4646a011f1869da98e4f1484c1 |
| HL7 registry entry | Public listing of published editions | `fhir-ig-list.json` in the `FHIR/ig-registry` GitHub repository |
| Production HAPI server | **Does not exist yet** - see the reminder in [03](03-downstream-updates.md) | - |

## How a change flows

```
IG source change ──► PR build (no deploy) ──► tag ──► published IG
                                                   │
        ┌──────────────────────────────────────────┤
        ▼                      ▼                    ▼
  terminology server     FHIR sandbox        AI assistant
  (only if terminology   (new IG package,    (knowledge documents
   or canonicals change)  validator rebuild   re-checked and
                          if canonicals       re-uploaded)
                          changed)
```

An IG release is **not finished** until the downstream systems agree with it.
Several of them hard-code things the IG defines (canonical URLs, counts,
binding wording), so a change that is correct in the IG can quietly break or
mislead a downstream system.

## Contents

1. [Release runbook](01-release-runbook.md) - how to release the IG and verify it
2. [Terminology server](02-terminology-server.md) - how to change and release terminology on TR
3. [Downstream updates](03-downstream-updates.md) - sandbox, AI assistant, production HAPI
4. [Decisions](04-decisions.md) - design decisions and the reasons behind them
5. [Known quirks](05-known-quirks.md) - problems that have already cost time
