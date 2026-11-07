# Repository documentation rules

- Prefer source code, tests, schemas, migrations, CI, and deployment configuration over prose descriptions.
- Use Graphify outputs as an index and relationship map, not as the sole source of truth.
- Do not fabricate behavior, API contracts, data constraints, security controls, cloud resources, or operational commands.
- Cite implementation claims as `path/to/file.ext:Lx-Ly` when line numbers are available; otherwise cite the path and mark the line range unavailable.
- Label claims as `OBSERVED`, `INFERRED`, or `UNKNOWN` when ambiguity matters.
- Mark unsupported claims `[NEEDS VERIFICATION]`.
- Keep generated docs in `docs/`; do not edit application code during documentation-only tasks.
- Use Mermaid for architecture, sequence, data-flow, state, and deployment diagrams.
- Keep diagrams consistent with adjacent prose and source evidence.
- Never include secrets, tokens, private keys, customer data, or sensitive production values.
- Preserve existing documentation conventions and do not overwrite user-authored content without reviewing it.
