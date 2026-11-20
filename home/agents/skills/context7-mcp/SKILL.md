---
name: context7-mcp
description: Use Context7 when you need information about libraries, frameworks, API references, or need code examples.
---

## How to Fetch Documentation

### Step 1: Resolve the Library ID

Call `resolve-library-id` with:

- `libraryName`: The library name extracted from the user's prompt
- `query`: The user's full question (improves relevance ranking)

### Step 2: Select the Best Match

From the resolution results, choose based on:

- Exact or closest name match to what the user asked for
- Higher benchmark scores indicate better documentation quality
- If the user mentioned a version (e.g., "React 19"), prefer version-specific IDs

### Step 3: Fetch the Documentation

Call `query-docs` with:

- `libraryId`: The selected Context7 library ID from Step 2 (e.g., `/vercel/next.js`)
- `query`: The user's specific question

### Step 4: Use the Documentation

Incorporate the fetched documentation into your response:

- Answer the user's question using current, accurate information
- Include relevant code examples from the docs
- Cite the library version when relevant

## Guidelines

- **Be specific**: Pass the user's full question as the query for better results
- **Prefer official sources**: When multiple matches exist, prefer official/primary packages over community forks
- **Version awareness**: When users mention versions ("Next.js 15", "React 19"), use version-specific library IDs if available from the resolution step
