---
mode: agent
description: Generate complete evidence-backed documentation for this repository using Graphify.
---

Use the documentation-architect agent and generate the full documentation set.

Scope: ${input:scope:all}
Subsystem (optional): ${input:subsystem:entire repository}

Follow the generate-docs skill. Build or refresh Graphify first, investigate the graph, verify findings in source, write Markdown and Mermaid under docs/, run validation, and report all evidence gaps. Do not modify application code.
