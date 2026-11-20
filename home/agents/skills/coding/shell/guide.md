# Shell

Guidelines for Shell scripting

## Rules

- **R1:** Prefer using named options over positional arguments (specially in functions) and parse them if the shell doesn't natively support it
  - **R1.1:** In special cases such as "$@", single-argument functions or functions with a few positional arguments that can be easily understood based on their position (e.g. say, a calculator command that accepts 2 + 2) this is not required
