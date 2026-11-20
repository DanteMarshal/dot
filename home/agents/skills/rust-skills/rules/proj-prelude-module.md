# proj-prelude-module

> Create prelude module for common imports

## Why It Matters

A `prelude` module collects the most commonly used types and traits for glob import. Users write `use my_crate::prelude::*` instead of many individual imports. This follows the pattern established by `std::prelude`.

## Bad

```rust
// Users must import everything individually
use my_crate::{
  Client,
  Config,
  Error,
  Request,
  Response,
  traits::{Handler, Middleware},
  types::Method,
};
```

## Good

```rust
// src/lib.rs
pub mod prelude {
  pub use crate::{
    Client,
    Config,
    Error,
    Request,
    Response,
    traits::{Handler, Middleware},
    types::Method,
  };
}

// Users write:
use my_crate::prelude::*;
```

## What to Include

| Include                      | Don't Include                 |
| ---------------------------- | ----------------------------- |
| Core types users always need | Rarely-used types             |
| Common traits                | Implementation details        |
| Error types                  | Internal helpers              |
| Extension traits             | Feature-gated items (usually) |
| Type aliases                 | Everything                    |

## Example: Web Framework Prelude

```rust
pub mod prelude {
  // Core request/response
  // Error handling
  // Routing
  // HTTP types
  // Common traits
  pub use crate::{
    Body,
    Error,
    Request,
    Response,
    Router,
    http::{Method, StatusCode},
    traits::{FromRequest, IntoResponse},
  };
}
```

## Example: Database Library Prelude

```rust
pub mod prelude {
  // Connection and pool
  // Error type
  // Query building
  // Traits for custom types
  pub use crate::{
    Connection,
    Error,
    Pool,
    query::{Delete, Insert, Query, Select, Update},
    traits::{FromRow, ToSql},
  };
}
```

## Pattern: Tiered Preludes

```rust
// Minimal prelude
pub mod prelude {
  pub use crate::{Client, Config, Error};
}

// Full prelude for power users
pub mod full_prelude {
  pub use crate::{advanced::*, extensions::*, prelude::*};
}
```

## Pattern: Feature-Gated Prelude Items

```rust
pub mod prelude {
  #[cfg(feature = "async")]
  pub use crate::async_client::AsyncClient;
  #[cfg(feature = "serde")]
  pub use crate::serde::{Deserialize, Serialize};
  pub use crate::{Client, Error};
}
```

## Guidelines

1. **Be conservative** - Only include truly common items
2. **Avoid conflicts** - Don't include names that might clash (e.g., `Error`)
3. **Document it** - List what's included in module docs
4. **Stay stable** - Removing items is breaking change

## Documenting the Prelude

````rust
//! Common imports for convenient glob importing.
//!
//! # Usage
//!
//! ```
//! use my_crate::prelude::*;
//! ```
//!
//! # Contents
//!
//! This prelude re-exports:
//! - [`Client`] - The main API client
//! - [`Config`] - Client configuration
//! - [`Error`] - Error type
pub mod prelude {
  // ...
}
````

## See Also

- [proj-pub-use-reexport](./proj-pub-use-reexport.md) - Re-export patterns
- [api-extension-trait](./api-extension-trait.md) - Extension traits
- [doc-module-inner](./doc-module-inner.md) - Module documentation
