---
name: planning
description: Use for planning to turn ambiguous design, implementation, or product work into decision-complete plans through repo grounding, focused questions, tradeoff resolution, and clear acceptance criteria.
---

- Make a concrete, decision-complete, and independently verifiable plan.
  - Map the problem internally as a **decision tree** in a temporary file (preferably in your working directory) until the end of the planning process.
  - Ground first: inspect relevant files, docs, configs, schemas, and conventions before asking discoverable questions.
  - Plan only for what the task needs.
    - Do not add extra protection unless there is a clear reason to need it.
    - Extra protection needs a reason tied to this project’s actual use or a concrete risk to its data.
    - Extra protection and what was not exactly mentioned in the task MUST be explicitly approved by the user.
    - Decision-complete doesn't mean it should cover all edge cases. It should only cover enough to provide a complete implementation of what was explicitly required in the task. Extra details added ONLY on explicit user approval.
- Use `request_user_input` for important and extra choices.
  - Always use it before deciding architecture, ownership, code wiring, public interfaces, data flow, style, migrations, rollout, etc.
  - Never use timed questions. Wait indefinitely for the user to answer every question.
  - Prefer focused, non-redundant questions over assumptions.
- Brief the user before asking for a decision.
  - Explain what the relevant system or code does today, why the decision is needed, and what it will affect.
  - Use simple terms, assume that you're talking to a non-technical person. Use technical jargon only if the user already showed understanding of that jargon.
  - Assume the user knows nothing about the system, the codebase, the documents or the infrastructure. Do not require familiarity with them or their terminology.
  - Use examples, pseudocode and snippets to approximately demonstrate what each option will look like.
  - State what each option would build or change, its main benefit, and its main cost or risk.
- Walk dependencies and branches until goal, scope, constraints, edge cases, acceptance criteria, and verification are concrete.
- Produce a decision-complete plan with explicit defaults only after all choices are resolved.
