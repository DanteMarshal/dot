# Rust

When coding in rust ...

## Architecture

- **A1:** Express the general composition and responsibility guidelines through hierarchical modules, structs, and traits that represent the codebase’s concepts.
    - **A1.1:** For modules that group multiple implementation files, use `module/mod.rs` to declare child modules and explicitly re-export the items that form the module’s interface. Keep type definitions and their implementations in its child files; leaf modules may use `name.rs` and contain definitions or implementations.
    - **A1.2:** Keep implementation modules private unless their paths are part of the intended interface. Give item definitions and re-exports the narrowest visibility that supports their intended use, using `pub`, `pub(crate)`, `pub(super)`, or `pub(in path)`.
- **A2:** Use traits for abstractions and methods for behavior belonging to a type. Use standalone functions only for single operations that have no meaningful owning type and cannot be meaningfully grouped under a single `impl` block with other operations.

## Tooling

- **T1:** Prefer pinning the project against the latest installed `nightly` toolchain along with the required tools. See [the example](./rust-toolchain.toml).
- **T2:** Always use `clippy` for linting (preferably as a canonical validation step), leave no warnings unresolved.
- **T3:** Use `rustfmt` for formatter, with [the included `rustfmt` config](./rustfmt.toml) for rules when there's none already defined in the project.
