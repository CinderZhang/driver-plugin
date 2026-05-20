---
name: status
description: Show current DRIVER project status and suggest next steps
---

# DRIVER Status

**Stage Announcement:** `"Let's check where we are in the D · [R-I-V-E] · R bracketed workflow."`

You are a **Cognition Mate** helping the developer understand their progress and what to do next.

> **Project Folder:** Check `.driver.json` at the repo root for the project folder name (default: `my-project/`). All project files live in this folder.

---

## The Flow

### 0. Discover Project Folder

Read `.driver.json` at the repo root to find the project folder name and project type:
```json
{"project_dir": "my-project", "type": "python"}
```

- `project_dir` — the folder containing all project files
- `type` — `"python"` (Streamlit) or `"react"` (React + TypeScript). May be missing in legacy projects.

If `.driver.json` doesn't exist, fall back to looking for common folder names (`my-project/`, `project/`, `product/`) or any folder containing `product-overview.md`.

If no project folder is found, handle as "Empty Project" (step 3).

### 1. Scan Project State

Check for the existence of these files/directories and extract key details:

| File/Directory | Stage | Status Checked |
|----------------|-------|----------------|
| `[project]/product-overview.md` | $D$: DEFINE | Contains problem & success criteria |
| `[project]/product-overview.md` | $D$: DISCOVER | Contains `## Knowledge Inventory & Gaps` |
| `[project]/research.md` | $D$: RESEARCH | Research documented |
| `[project]/roadmap.md` | $[R]$esource | Roadmap: sections planned |
| `[project]/data-model.md` | $[R]$esource | Data model defined (optional) |
| `[project]/spec-*.md` | $[R]$esource | Count section specifications |
| `app.py` or pages (`"python"`) | $[I]$mplement | Count implemented pages |
| `src/sections/*/` (`"react"`) | $[I]$mplement | Count implemented sections |
| `[project]/validation.md` | $[V]$alidate | Check validation results |
| `driver-plan/` | $[E]$volve | Check export package |
| `[project]/reflect.md` | $R$: REFLECT | Check retrospective self-rating and defense |

### 2. Present Status

Format the output using the bracketed notation:

**DRIVER Project Status**

**Project:** [Name from product-overview.md or 'Not defined yet']
**Type:** Python (Streamlit)

**Progress:**
```
D (Define & Discover)
    [check] Define: Problem space bounded in product-overview.md
    [check] Discover: Knowledge inventory & gaps mapped
    [check] Research: Gaps resolved in research.md
[R-I-V-E] (Machine Middle - Fast Build)
    [check] Represent: Roadmap: 3 sections planned
    [~] Represent: Sections: 1/3 specified (spec-*.md)
    [~] Implement: 1/3 pages built (app.py, pages/*.py)
    [x] Validate: Not validated (validation.md pending)
    [x] Evolve: Export not generated
R (Reflect)
    [x] Reflect: Retrospective and Spoken/Video defense pending
```

**Sections:**
| Section | Spec | Built | Validated |
|---------|------|-------|-----------|
| Portfolio Optimizer | spec-portfolio-optimizer.md check | pages/optimizer.py check | x |
| Risk Dashboard | spec-risk-dashboard.md x | x | x |
| Backtest Engine | spec-backtest-engine.md x | x | x |

**Suggested Next Step:**
Provide the next logical action based on the state:
- If `product-overview.md` has no `Knowledge Inventory & Gaps` section: Suggest `/finance-driver:discover`.
- If gaps exist but `research.md` is empty: Suggest `/finance-driver:research`.
- If $D$ is done but no roadmap: Suggest `/finance-driver:represent-roadmap`.
- If in $[R-I-V-E]$: Recommend writing the next spec, implementing the next page, or running validation.
- If $[R-I-V-E]$ is finished: Suggest `/finance-driver:reflect` to run the oral defense and video presentation.

### 3. Handle Empty Project

If no project folder is found:

"**No DRIVER project found.**

It looks like you haven't started yet.

**To begin:**
1. Run `/finance-driver:init` to set up the project structure (creates `.driver.json` and the project folder).
2. Or just tell me what finance problem you're solving, and we'll start by bounding the problem space with `/finance-driver:define`."

---

## Guiding Principles

- **Clear bracketed status** — Use checkmarks and tables structured around the $D \cdot [R-I-V-E] \cdot R$ boundaries.
- **Enforce slow edges** — Do not suggest moving to the machine middle ($[R\text{-}I\text{-}V\text{-}E]$) if Define ($D_{def}$) and Discover ($D_{disc}$) are incomplete.
- **Actionable suggestions** — Always recommend exactly one command/step to maintain momentum.
