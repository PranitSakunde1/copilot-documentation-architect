---
name: mermaid-diagrams
description: Create and maintain accurate Mermaid diagrams from verified repository evidence.
---

# Mermaid Diagram Authoring

- Use standard Mermaid syntax supported by GitHub Markdown.
- Prefer simple diagrams over dense, unreadable diagrams.
- Keep node IDs stable and descriptive.
- Use `flowchart LR` for component and system context diagrams.
- Use `sequenceDiagram` for runtime calls and events.
- Use `erDiagram` only when relationships and cardinality are supported by schema evidence.
- Use `stateDiagram-v2` for verified state transitions.
- Do not add components, actors, stores, or interactions that are not evidenced.
- Add a caption or adjacent paragraph explaining scope and limitations.
- Keep reusable diagrams in `docs/diagrams/`; otherwise embed them in the relevant document.
- Validate fenced code blocks and inspect rendering in GitHub before merge.
