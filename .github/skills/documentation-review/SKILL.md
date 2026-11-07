---
name: documentation-review
description: Audit technical documentation against repository source, tests, schemas, deployment configuration, and Mermaid diagrams.
---

# Documentation Review

1. Read `docs/README.md` and enumerate Markdown documents.
2. Identify factual claims about code, APIs, data, security, deployment, and operations.
3. Verify claims against source files. Graphify is a navigation aid, not final proof.
4. Check source paths and line references; flag stale or missing references.
5. Check Mermaid diagrams against actual participants, calls, stores, and boundaries.
6. Check relative Markdown links and image references.
7. Search for secrets, tokens, private keys, passwords, connection strings, customer identifiers, and sensitive production values. Inspect possible matches carefully.
8. Identify contradictory statements across documents.
9. Classify findings: Critical (security/data-loss/API falsehood), High (architecture/workflow/operations error), Medium (missing evidence/stale link/incomplete diagram), Low (wording/formatting/duplication).
10. Do not silently rewrite uncertain facts. Mark `[NEEDS VERIFICATION]` and explain required evidence.
11. Produce `docs/evidence/documentation-review.md` with findings, source references, severity, and disposition.
