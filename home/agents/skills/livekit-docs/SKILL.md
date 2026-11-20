---
name: livekit-docs
description: "Use the latest LiveKit documentation and its MCP server when answering LiveKit development, API, configuration, or pricing questions."
---

# LiveKit Documentation

LiveKit changes quickly. For LiveKit-related work, consult the current documentation rather than relying on memory or older examples.

Use the installed LiveKit MCP server (`mcp__livekit_docs__*`) when available; it is backed by `https://docs.livekit.io/mcp`. Prefer its tools in this order:

1. `mcp__livekit_docs__get_docs_overview` to discover the relevant documentation structure.
2. `mcp__livekit_docs__get_pages` to read the complete, relevant documentation pages.
3. `mcp__livekit_docs__docs_search` when the page location is not known.
4. `mcp__livekit_docs__code_search` only when documentation search does not answer the question or source examples are specifically needed.

Use `mcp__livekit_docs__get_changelog` for version or recency questions and `mcp__livekit_docs__get_pricing_info` for current pricing. Prefer documentation pages over raw code because they provide more context. If the installed MCP server is unavailable, say so briefly and use the current official LiveKit documentation available through the normal browsing tools.
