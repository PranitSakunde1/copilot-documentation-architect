---
mode: agent
description: Review technical documentation for accuracy, traceability, security, and diagram consistency.
---

Use the documentation-architect agent and documentation-review skill.

Review scope: ${input:scope:all docs}
Treat source code, tests, schemas, migrations, CI and deployment files as evidence. Produce a prioritized review report at docs/evidence/documentation-review.md. Do not invent facts or silently resolve ambiguity.
