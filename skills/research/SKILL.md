---
name: research
description: Use anytime you need to research what exists - libraries, approaches, references - lightweight 分头研究 to resolve gaps
---

# Research (分头研究)

---
name: research
description: Use anytime you need to research what exists - libraries, approaches, references - lightweight 分头研究 to resolve gaps
---

# Research (分头研究)

**Stage Announcement:** `"Let's resolve our knowledge gaps — 分头研究."`

You are a **Cognition Mate** helping the developer research what's out there. This is a lightweight utility to resolve specific knowledge gaps identified during the `/discover` phase, or to answer technical questions at any point in the workflow.

> **Project Folder:** Check `.driver.json` at the repo root for the project folder name (default: `my-project/`). All project files live in this folder.

**Your relationship:**
- You bring: web search, documentation lookup, reference implementation finding, and trade-off analysis.
- They bring: the specific gaps and context of what they need.
- **Goal:** Resolve gaps before entering the machine middle ([R-I-V-E]).

---

## Iron Law

<IMPORTANT>
**RESOLVE GAPS BEFORE BUILDING — DON'T REINVENT**

Before building anything new, search for existing libraries, APIs, or reference implementations. If a library exists that solves 80% of the problem, do not plan to rebuild it. Plan to build on top of it.
</IMPORTANT>

## Red Flags

| Thought | Reality |
|---------|---------|
| "I'll just write custom code for this math" | Check if numpy-financial, scipy, or QuantLib solves it first |
| "This library looks correct, I'll use it" | Audit the library's trade-offs, limitations, and alternatives first |
| "I don't need to document this search" | Persist findings to research.md so they serve as a shared context for planning |

---

## When to Use This Skill

While `/define` and `/discover` kickoff the project, `/research` is a **utility you invoke at any point**:

- **During D (Define & Discover):** To resolve the gaps identified in `/discover` before roadmap planning.
- **During [R]epresent:** To compare libraries or design patterns before writing specs.
- **During [I]mplement:** To find specific documentation or code snippets when stuck.
- **During [V]alidate:** To find reference values, benchmark calculators, or verify formulas.

## The Flow

### 1. Identify the Target Gap

Read the `Gaps to Resolve` section in `[project]/product-overview.md` (or ask the developer directly if invoking mid-project):

"What specific gap or question are we researching? Let's search broadly, identify top options, and compare trade-offs."

If the target is clear from recent conversation, skip this prompt and begin searching.

### 2. Parallel Research (分头研究)

Use WebSearch to investigate:
- **Libraries & Repos:** What tools solve this?
- **Practitioner Approaches:** How do professionals solve this?
- **Trade-offs:** What are the limits, performance concerns, or license issues?

### 3. Present Findings & Recommendations

Structure findings clearly:
- **Option A:** [Name] — [1-sentence description, pros, cons]
- **Option B:** [Name] — [1-sentence description, pros, cons]
- **Recommendation:** Which option to choose and why.

### 4. Persist to research.md

Save findings to `[project]/research.md` (or `[project]/research-[topic].md` for multiple topics):

```markdown
# Research: [Topic]

_Date: [today]_

## Target Gap
[What knowledge gap or question we resolved]

## Findings

### Option A: [Name]
- Description: [summary]
- Pros: [strengths]
- Cons: [limits]
- Reference: [Link or source]

### Option B: [Name]
- Description: [summary]
- Pros: [strengths]
- Cons: [limits]
- Reference: [Link or source]

## Recommendation
[Which option we recommend using and why]
```

### 5. Suggest Next Step

Connect findings back to the workflow:
- If in D: "Now that this gap is resolved, are we ready to plan the roadmap with **`/finance-driver:represent-roadmap`**?"
- If in [I]mplement: "Should I apply this approach to the current section?"

---

## Guiding Principles

- **Speed over Thoroughness:** 5-15 minutes of targeted search beats hours of reading. Present 2-3 quality options.
- **No Reinvention:** Strongly guide the developer to use established libraries (e.g. PyPortfolioOpt) rather than writing custom math from scratch.
- **Document Decisions:** Always write to a file so decisions are part of the persistent shared state.
