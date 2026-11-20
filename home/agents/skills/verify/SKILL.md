---
name: verify
description: Check an exact implementation revision in a fresh context against its task and acceptance criteria. Return a clear result, evidence, and ranked findings. Do not use for self-review, uncommitted changes, implementation, or fixes.
---

Verify a fixed implementation revision independently:

- Provide evidence; do not accept, integrate, fix, or change the work.
- Establish that verification is valid before assessing the revision.
  - You did not implement or direct the change, and are working from fresh context.
  - The task, acceptance criteria, and target revision are identifiable.
  - Check the request, repository instructions, task records, and Git state before asking the user. Do not guess.
  - If a prerequisite is missing, report **Unable to verify** and name it.
- Assess the submitted revision only.
  - Read its relevant diff and follow the affected behavior, contracts, and code paths.
  - Check every acceptance criterion and serious issue caused or exposed by the change, including security, data loss, regressions, and broken production paths.
  - Run repeatable checks appropriate to the task. Do not silently use a newer revision or modify source files.
- Classify every finding as **Blocker**, **Decision required**, or **Suggestion**.
  - A blocker fails acceptance criteria or creates a serious correctness, safety, or task-result problem.
  - A decision required matters, but the task owner must decide whether it blocks approval.
  - A suggestion is an in-scope improvement that is safe to defer; exclude unrelated cleanup and future work.
  - Give each finding separate **Importance** (`critical`, `high`, `medium`, `low`) and **Urgency** (`immediate`, `current-task`, `follow-up`, `opportunistic`) ratings, with a brief reason for each.
  - Sort findings by class, then importance, then urgency, with highest first.
- Report exactly one result.
  - **Approved:** all checks are complete, with no blockers or decisions required. Suggestions don't block approval.
  - **Rejected:** at least one blocker exists.
  - **Awaiting decision:** no blockers exist, but at least one decision is needed.
  - **Unable to verify:** missing details, evidence, access, or broken test tools prevent a reliable result.
- Start with the result, exact revision, and a one-sentence rationale. Then list findings, followed by repeatable commands and summarized results. For each finding, give evidence, effect, and the needed action or decision.
- Use a repository verification receipt or record when requested or required. Verification never authorizes updating trackers, committing, fixing code, or accepting the work.
