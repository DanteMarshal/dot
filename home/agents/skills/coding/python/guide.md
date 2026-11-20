# Python

Guidelines for coding in python; be it for scripts, libraries or applications.

## Rules

- **R1:** When defining `@dataclass` models, prefer `def from_*(cls: type[Self], ...)` `@classmethod` methods (such as `from_dict` or `from_json`) as each model's constructors.
- **R2:** For factory methods, prefer `@classmethod` over separate root-level functions.
- **R3:** As an exception to [general R6](../general/guide.md#rules), Python docstrings may remain inline and span multiple lines. They serve as documentation, even though Python represents them as string literals; follow general R7 for their content and placement.

## Architecture

- **A1:** In general, prefer `import full.module.path` statements over `from full.module.path import item` to make each symbol’s origin visible at the use site.
- **A2:** Exceptions to the above rule are:
    - **A2.1:** Compiler directives like `from __future__ import annotations;` and similar. They can keep their required `from ... import ...` syntax.
    - **A2.2:** `__init__.py` files are also an exception, in order to reduce the long number of import lines. Use the `from .module import Item` pattern in `__init__.py` files to re-export the relevant items, so a parent module can re-export relevant items from child modules and make imports easier.
    - **A2.3:** Importing items from child modules. Use `from .child import Item` for local child-module imports.

## Tooling

- **T1:** Always use strict types and annotations, and run type-checking and linting against your code.
    - **T1.1:** Use [the included `pyproject.toml`](./pyproject.toml) as a configuration reference.
- **T2:** Prefer the Astral toolkit (`uv`, `ty` and `ruff`) wherever easily possible.
    - **T2.1:** Use `uv` for package and environment management
    - **T2.2:** Use `ty` as LSP and for type-checking
    - **T2.3:** Use `ruff check` for linting
    - **T2.4:** Use `ruff` (through `dprint`) for formatting
