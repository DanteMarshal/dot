# General

General coding guide, applies to all languages and markups.

## Rules

- **R1:** The most important principle, Use clean architecture and keep ownerships, responsibilities and dependencies obvious and clear.
  - **R1.1:** Each concept, policy, and mutable state must have a clear owning boundary. The owner defines its meaning and controls its valid changes.
    - **R1.1.1:** Other components collaborate through that boundary rather than duplicating its rules or modifying its internals.
  - **R1.2:** Keep source-code dependencies acyclic and directed toward the policies and contracts being supported. Components must collaborate through explicit contracts without depending on each other’s private state, construction details, or implementation-specific sequencing. Introducing interfaces or lazy lookup does not, by itself, resolve architectural coupling.
    - **R1.2.1:** This rule must be applied carefully so it's not overused. For example, if a component or module owns another privately and requires internal communication with it, direct access to the inner component's public (internal) interface is allowed and doesn't need a separate application-level contract for this interaction.
  - **R1.3:** File structure and names must communicate ownership and responsibility; module boundaries, imports, and public interfaces must make dependency direction clear.
- **R2:** KISS is the second most important principle: make the code easy to understand, reason about, and change.
  - **R2.1:** Simplicity means clarity of ownership, responsibilities, and dependencies (not necessarily less lines, functions, types, files, or hierarchy levels).
  - **R2.2:** Before and After adding anything, look for unnecessary behavior, duplication, or indirection that can be removed or simplified.
  - **R2.3:** Clear organization of existing ownerships or responsibilities is sufficient justification for structure (It does not require an additional feature or a future use case).
  - **R2.4:** Add features and protections only when justified by concrete requirements.
  - **R2.5:** Prefer readable, straightforward implementations obeying correct ownerships and layering, over clever shortcuts.
- **R3:** Keep code, file structure, and identifiers accurate and representative of their responsibilities.
  - **R3.1:** When changing a component’s responsibility or scope, update affected identifiers, names, and boundaries to describe their resulting meaning.
  - **R3.2:** Treat these updates as part of the implementation.
  - **R3.3:** Do not use comments or documentation to excuse misleading names.
  - **R3.4:** Do not assume backward compatibility is required. Use the task’s requirements and established contracts to determine whether it is.
  - **R3.5:** When compatibility is required, prefer accurate internal names with compatibility handled at the external boundary.
  - **R3.6:** If preserving compatibility requires retaining misleading names, explain the concrete constraint and agree on the approach with the user before proceeding.
- **R4:** Never silently discard errors or warnings. Handle them, propagate them, or report them explicitly. Log failures at the boundary responsible for reporting them; propagation alone does not require logging.
  - **R4.1:** In case of unhandled exceptions or general error handlers, if the structure is unknown, it's better to just log the entire error object.
  - **R4.2:** Preserve useful diagnostic detail. Do not introduce PII redaction or other privacy protections that sacrifice debuggability and observibility, unless explicitly required. When required, apply it while preserving the remaining diagnostic context.
- **R5:** Use strict checking and the applicable project configuration. For new configurations, start from this skill's references, including their intentional exceptions.
- **R6:** Keep multi-line texts out of code
  - **R6.1:** Never inject multi-line strings within the code so the code stays readable.
  - **R6.2:** Always load, include or embed text from nearby or configuration files, rather than within the code you're writing.
  - **R6.3:** If that's really not an option, then at the very least hard-code them into a constant before use.
  - **R6.4:** This rule includes scripts written in other languages which are embedded in a second language as a string.
  - **R6.5:** Multi-language syntaxes (such as .tsx, .jsx, .php or multi-language support using rust macros) are not affected by this rule because they're natively supported.
- **R7:** Keep documentation as close to code as possible
  - **R7.1:** Use descriptive names and make sure they're not stale, so the code remains self-explanatory.
  - **R7.2:** For extra explanations that can't be conveyed by the code itself, use comments. Prefer the supported doc-style comments in the language of choice, fall back to normal comments only if the language doesn't support them.
  - **R7.3:** In general, prefer to keep as much as possible AWAY from free-form docs (such as .md file in `docs/*` folders); those should be reserved for very short and very high-level documentation that cannot possibly be self-explained by the code at all.

## Architecture

- **A1:** Use hierarchical composition with clear construction boundaries and acyclic dependencies
  - **A1.1:** Build larger components from smaller, cohesive ones. Encapsulate related behavior and state in types or modules that represent meaningful concepts, with clear boundaries between their responsibilities.
  - **A1.2:** Give components only their required collaborators.
    - **A1.2.1:** Keep dependency-container lookup within composition and construction code
    - **A1.2.2:** Do not pass containers or application-wide service collections into business behavior.
      - **A1.2.2.1:** Factories may retain a container for deferred construction, but container lookup must remain confined to that construction behavior. Consumers receive the factory, not the container.
  - **A1.3:** Reflect the relationships in the module and file hierarchy. Use nesting to express meaningful containment; each level should make the organization easier to understand.
  - **A1.4:** Compose at each meaningful boundary. A component assembles its internal parts; Do not make higher-level composition depend on private implementation details.
    - **A1.4.1:** Prefer a separate top-level composition module that assembles the application and injects its dependencies. The top-level composition connects its components through their public construction interfaces, and may select them conditionally if needed.
  - **A1.5:** Avoid circular dependencies at all costs, even lazy runtime-loaded ones. Use dependency inversion with relevant abstractions instead.
  - **A1.6:** Make the dependency graph clear. If possible, document the dependency directions of the system in a top-level `dependency-graph.md` file using a mermaid chart.
- **A2:** If the code has entry-point(s) (e.g. application instead of library), keep them visible:
  - **A2.1:** Prefer the name `main` (or `Main`) for the entry-point function(s), if the runtime allows.
  - **A2.2:** The entry point should ideally belong to the top-level composition module.
- **A3:** Use the 'Single Responsibility Principle' to break the hierarchy down.
  - **A3.1:** Group behavior and state that serve one cohesive purpose and change for the same underlying reason.
  - **A3.2:** Separate independent policies or concerns. Behavior governed by different rules or external contracts should be separated when combining it would make changes to one require unrelated changes to another.
    - **A3.2.1:** Keep a rule and the state transitions needed to enforce it together.
    - **A3.2.2:** Large implementations may be divided into cohesive internal or private parts for readability, without fragmenting their public responsibility or ownership.
  - **A3.3:** Combine data and behavior, as long as it all belongs to one concept and one responsibility (i.e. data model constructors or calculated properties on the model definition)
- **A4:** Ideally, an `import` / `using` / `use` / etc. statement shouldn't cause any runtime code to run or any runtime state to change.
  - **A4.1:** Avoid top-level / module-level instances unless they're read-only constants.
  - **A4.2:** Avoid running code (i.e. calling functions / executing statements) on module-level. Executing code belongs to function and method bodies.
    - **A4.2.1:** If the runtime or the framework absolutely requires module-level instances or execution, minimize it as much as possible.
    - **A4.2.2:** This rule is in place to keep imports free of application startup, external I/O, background work, and mutable service initialization. Decorators and read-only constant initialization are allowed where the runtime or the language uses an interpretter (e.g. python `@dataclasses.*`)

## Tooling

- **T1:** Prefer `just` as task-runner, unless the tech-stack natively supports one.
- **T2:** Prefer `dprint` for formatting, and use [the included `dprint.jsonc` config file](./dprint.jsonc) for new projects (relevant plugins only), or as reference for updating the project config.

## Validation

- **V1:** Write tests to protect actual meaningful behavior, not to demonstrate that code was changed.
  - **V1.1:** Before adding a test, identify the concrete failure it would catch and why that failure matters.
  - **V1.2:** Prioritize business rules, state transitions, failure handling, and integration contracts.
  - **V1.3:** Prefer a small set of focused scenarios over exhaustive combinations without distinct failure risks.
  - **V1.4:** Do not add redundant coverage merely to increase test counts or coverage percentages.
- **V2:** Assert observable outcomes and required contracts, not incidental implementation details.
  - **V2.1:** Do not freeze prose, formatting, private structure, or internal sequences unless those details are explicit requirements.
  - **V2.2:** Use mocks for boundaries the test should not exercise; do not mock away the behavior the test is intended to verify.
- **V3:** Keep tests aligned with current requirements.
  - **V3.1:** When behavior intentionally changes, update or remove tests for the old behavior. Do not retain obsolete production code solely to satisfy obsolete tests.
  - **V3.2:** When a test fails, determine whether it exposes a regression or an outdated expectation before changing either the test or production code.
  - **V3.3:** Within the task's scope, remove tests that are obsolete, redundant, or only restate implementation details. Preserve coverage of still-required behavior.
- **V4:** Verify changes proportionately.
  - **V4.1:** Run relevant existing tests before adding new ones; extend existing coverage when it already addresses the requirement.
  - **V4.2:** Add regression coverage for bug fixes when practical, targeting the underlying failure rather than the particular implementation used to fix it.
  - **V4.3:** Report what was verified and any meaningful gaps. Do not present linting, type checking, or mocked tests as proof of behavior they do not exercise.
- **V5:** Keep tests within the project and source hierarchy of the components they validate, following the toolchain's test-discovery conventions.
  - **V5.1:** Do not introduce an independently configured test project or a parallel test directory tree unless required by the toolchain or framework.
  - **V5.2:** Use adjacent test files or internal test modules (preferably a separate file) for component-specific tests.
  - **V5.3:** Place integration tests near the higher-level components whose collaboration they verify, again preferably as separate files but adjacent to the target component.
