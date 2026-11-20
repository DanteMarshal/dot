# Just

Guidelines for writing `just`scripts (our preferred task runner).

## Rules

- **R1:** Use `just --list` for the default command
- **R2:** Prefer `#!/usr/bin/env bash`and `#!/usr/bin/env python3` for longer-than-one-line recipes
- **R3:** Use native Just interpolation (`{{ ... }}`) to pass recipe parameters into scripts rather than positional arguments such as `$1` or `$@`.
  - **R3.1:** Quote interpolated values appropriately for the target language.

## Architecture

- **A1:** Use imports to separate distinct responsibilities or ownerships, when doing so improves organization.
- **A2:** In a monorepo, use separate `justfile`s for each sub-project so they can be run independently of each-other.

## Examples

See [the illustrative example](./example/justfile) for recipe organization and help handling. Its recipe names and import paths are illustrative; adapt them to the project. The example is not intended to run as bundled.
