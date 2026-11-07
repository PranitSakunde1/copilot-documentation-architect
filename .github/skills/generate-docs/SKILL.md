---
name: generate-docs
description: Generate or update a complete repository documentation set using Graphify discovery, source verification, Markdown, and Mermaid.
---

# Generate Documentation

1. Read repository instructions and existing docs.
2. Check Graphify availability and graph freshness.
3. Build the graph if missing using `/graphify .`; refresh changed repositories using `/graphify . --update`.
4. Read `graphify-out/GRAPH_REPORT.md`. Query the graph for entry points, important components, dependencies, data stores, and critical workflows.
5. Verify important findings against source code, tests, schema/migration files, configuration, CI, and deployment manifests.
6. Create or update only relevant files under `docs/`.
7. Add Mermaid diagrams where useful: flowcharts for architecture, sequence diagrams for runtime, ER diagrams for verified data relationships, and state diagrams for verified lifecycle transitions.
8. Add source references and mark inferred/unknown details.
9. Run `scripts/validate-docs.ps1` on Windows. If unavailable, perform equivalent manual checks.
10. Summarize changes, evidence quality, validation results, and unresolved gaps.

## Minimum scope for a full documentation pass

Project overview and context; architecture and component map; runtime workflows; API/event inventory if present; data model if present; configuration and integrations; security and privacy; testing strategy; build/deployment/infrastructure; operations; ADR index and known gaps.

## Rules

- Markdown and Mermaid only.
- Never invent. Use `[NEEDS VERIFICATION]`.
- Do not dump the entire graph JSON into documentation.
- Avoid duplicate docs; update canonical files.
- Do not expose secrets or sensitive repository data.
