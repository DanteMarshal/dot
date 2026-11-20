---
name: brainstorm
description: Brainstorm with the user about a plan, decision, or idea. Use when the user wants to stress-test their thinking, plan a big chunk of work or needs help deciding what to do.
---

Help the user reach shared understanding and solve the required design decisions.

### Workflow

First, Map the session
  - Select a `brainstorm.md` file in which will map the problem, the decisions, the steps and the relevant details. This is your Session file.
    - Preferably, choose a file in the local directory tree
    - If the local directory tree is (or is inside) a git repo, prefer a suitable git-ignored location if available
    - If no suitable location is found for your session file, ask the user where to put it.
  - If a previous session file already exists and its content is relevant to what the user is asking, ask the user and continue from there if agreed. Jump to the relevant step recorded in that file.

Then, follow this iterative algorithm:

1. Discover the issues
  - Conduct interviews with the user, observe available evidence, search the web, and review existing data to explore the problem space broadly.
  - This is a diverging phase, you should explore as many possibilities as you can to discover every conceivable issue.
2. Focus on a problem
  - Using the session file, filter out noise and converge on a specific, high-priority user challenge that is still unresolved.
  - Interact with the user to make sure priorities are understood correctly, so the convergence happens based on valid criteria.
3. Explore potential solutions
  - This is again a diverging phase
  - Brainstorm and explore a wide range of potential solutions, internally (without the need for the user to respond)
  - Compare the solutions' pros and cons, record a summary of your comparison in your session file, then select the top solutions for presentation.
4. Present the best solutions
  - The final converging phase, and where the user interaction returns.
  - Present your top solutions to the user in simple terms, tell them about the trade-offs and allow them to make an informed decision.
  - Stay in this step until a decision is made about the current selected problem, then submit that decision in your session file.
  - At the end of this step, update your session file with the consequences of this decision.
5. Branch-off or Iterate
  - The previous steps may or may not have introduced further decisions that need to be made.
    - If new decisions are introduced, go back to step 1 to diverge on them again and continue from there.
    - If no new decisions are introduced, revisit your session file to check if there's any unresolved decisions or unsolved problems.
  - If there's any unsolved / unresolved problems, go back to step 3 to select the next problem to focus on, then continue from there.
  - If no problem or decision remains, the brainstorm session is over. Provide the user with a report markdown file of the decisions made, with a single-sentence summary of the reasoning behind them.

### Rules and Suggestions

- Assume the user knows nothing about the relevant background, domain, system, source material, or terminology.
  - Before asking for a decision, provide the minimum context needed to understand what is being decided, why it matters, and what each option changes.
  - Use the smallest illustrative form that conveys the relevant meaning, such as pseudocode, sample data, a sketch, or input/output.
    - For technical topics, default to tiny pseudocode with simple names (invented names if not already present in the codebase). Omit arguments, types, setup, plumbing, and edge cases unless one of those details is the actual decision.
- Brainstorming is a decision phase: do not perform mutating actions (other than your session file) unless the user separately asks or permits you to proceed.
