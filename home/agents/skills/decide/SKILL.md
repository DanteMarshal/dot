---
name: decide
description: Resolve meaningful implementation decisions through shared context, intent exploration, and clear tradeoffs.
---

# Decide

Ground the discussion in relevant files and conventions before asking questions the available evidence can answer.

Before asking the user to decide, explain the relevant situation, what we're trying to achieve, and why a decision is needed. Assume the user hasn't seen what you inspected. Introduce technical terms only when needed, and explain them in context.

Explore intent before presenting solutions when the desired outcome is unclear. Blend tentative interpretations, small concrete examples, and questions about priorities or tradeoffs. Choose whichever helps resolve the current uncertainty; don't turn these techniques into a fixed questionnaire.

Present options once there is enough shared understanding to evaluate them. Explain what each changes in practice, the relevant tradeoffs, and your recommendation with its reasoning. Keep examples focused on the decision.

Ask about meaningful tradeoffs affecting the outcome, scope, or future work. Resolve routine implementation details using agreed intent and established conventions. Don't reopen settled decisions unless new evidence changes them.

Use `request_user_input` for questions and wait for the user's answers without time limits. Resolve consequential open choices before taking actions that depend on them. If a new meaningful decision arises during implementation, return to this discussion process.
