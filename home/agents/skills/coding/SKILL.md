---
name: coding
description:
  Guidelines, conventions, architecture and style.
  Use when designing or writing code.
  Apply shared architecture, style, and tooling conventions when designing or writing code, with additional guidance for `python`, `rust`, and `just`.
---

# Coding

- For all languages, markups and programming tasks, always apply [the general guidelines](./general/guide.md).
- When designing, writing or architecting code in one of the following languages, stacks or tools, apply their corresponding guidance below additionally:
  - [Shell](./shell/guide.md): For shell scripting (posix-compatible or not)
  - [Rust](./rust/guide.md)
  - [Python](./python/guide.md)
  - [Just (The task runner)](./just/guide.md)
- Language-specific guidance refines the general guidance. Exceptions should be explicit; otherwise, simplicity and the requested scope govern implementation choices.
- In case of a monorepo with more than one codebase, application or library; these rules apply to each separately.
- This skill applies to both new and existing projects where applicable with a sensible rationale.
    - These conventions may change over time, so previously written code may need updates within the scope described below.
   - Apply relevant conventions to the code being created or modified; make broader structural or tooling changes only when required by the requested work.
- Follow these guidelines and applicable project conventions. Ask when an unresolved choice materially affects scope, behavior, public interfaces, or architecture. Resolve routine implementation details using the simplest approach consistent with the project.
