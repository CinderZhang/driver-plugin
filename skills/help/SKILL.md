---
name: help
description: DRIVER overview, available skills, and philosophy explanation
---

# DRIVER™ Help

## What is DRIVER™?

DRIVER™ is a metacognitive framework for building finance and quantitative analysis tools with AI assistance. It organizes development into a bracketed flow: **D · [R-I-V-E] · R**, enforcing "slow edges" (deliberate human thinking) and a "fast middle" (machine-assisted build cycles).

---

## The Philosophy: Cognition Mate (认知伙伴)

**Core principle:** 互帮互助，因缘合和，互相成就

Rather than treating the AI as an autonomous agent or a simple code generator, DRIVER™ establishes a **thinking partnership** where cognitive burden is strategically shifted:

* **Human Edges (D and R):** 80% human / 20% AI. The human leads critical planning, problem bounding, gap assessment, and final conceptual comprehension. The AI acts as a boundary regulator (collar harness) asking challenging questions.
* **Machine Middle ([R-I-V-E]):** 80% AI / 20% human. The AI does the heavy lifting of code generation and drafting; the human steers, reviews code, and runs tests.

---

## The Bracketed Stages: D · [R-I-V-E] · R

```
          HUMAN EDGE: 80% Human / 20% AI (Slow & Deliberate)
         ┌──────────────────────────────────────────────────────────────┐
         │ D - DEFINE & DISCOVER                                        │
         │   /define   -> Define the external problem space             │
         │   /discover -> Map internal knowledge gaps & assumptions     │
         └────────────────────────────┬─────────────────────────────────┘
                                      │
                                      ▼
         ┌──────────────────────────────────────────────────────────────┐
         │ [R-I-V-E] - MACHINE MIDDLE (80% AI / 20% Human - Fast)       │
         │   [R]epresent -> Plan buildable roadmap & specs              │
         │   [I]mplement -> Build and run (Show Don't Tell)             │
         │   [V]alidate  -> Cross-check data, answers & edges           │
         │   [E]volve    -> Package production-ready deliverable        │
         └────────────────────────────┬─────────────────────────────────┘
                                      │
                                      ▼
         ┌──────────────────────────────────────────────────────────────┐
         │ R - REFLECT                                                  │
         │   /reflect  -> Self-rating & Spoken/Video Explanation        │
         │             -> Live Oral Defense fallback                    │
         └──────────────────────────────────────────────────────────────┘
          HUMAN EDGE: 80% Human / 20% AI (Refining Understanding)
```

---

## Project Structure

DRIVER uses a flat, easy-to-navigate file structure. All project files live in a single folder (default: `my-project/`, customizable via `.driver.json`):

**Python (Streamlit) — Recommended for quant/finance:**

```
repo-root/
├── .driver.json                  # Project config
├── [project-name]/               # DRIVER docs and specs
│   ├── README.md                 # You are here
│   ├── research.md               # Created by /research (分头研究)
│   ├── product-overview.md       # Created by /define and /discover (your PRD)
│   ├── roadmap.md                # Created by /represent-roadmap
│   ├── spec-[section].md         # Created by /represent-section
│   ├── data-model.md             # Created by /represent-datamodel
│   ├── validation.md             # Created by /validate
│   └── reflect.md                # Created by /reflect
├── app.py                        # Main Streamlit entry point
├── pages/                        # Section pages (auto-discovered by Streamlit)
├── calculations/                 # Core logic (pure Python, testable)
└── data/                         # Data loading and samples
```

**React + TypeScript — For web app UIs:**

```
.driver.json                      # Project config (folder name, project type)
my-project/
├── README.md                     # Project overview and structure
├── research.md                   # Research findings (分头研究)
├── product-overview.md           # Product definition & gaps
├── roadmap.md                    # 3-5 buildable sections
├── data-model.md                 # Core entities and relationships
├── validation.md                 # Cross-check results (all sections)
├── reflect.md                    # Learnings and retrospective
├── spec-[section-name].md        # Section specifications
├── design/                       # Web apps only
│   ├── tokens.json               # Colors and typography
│   └── shell.md                  # Navigation shell spec
└── build/                        # Implementation artifacts
    └── [section-id]/
        ├── data.json             # Sample data
        └── types.ts              # TypeScript interfaces
```

---

## Key Concepts

### Bounding the Problem vs. Mapping Gaps (D)
* **Define (External):** Clarifying requirements and success criteria before letting AI write code. Prevents the **Timing Problem** (AI filling the analytical void too fast with plausible but generic answers).
* **Discover (Internal):** Auditing what you already know vs. what you need to learn. Enforces metacognition before starting research.

### The Reflection Mechanisms (R)
To counter the **Artifact-Authenticity Collapse** (where working code does not prove human capability), the Reflection stage uses three cognitive mechanisms:
1. **Compression:** Boiling down a complex codebase into a 2-5 minute overview.
2. **Audience Pressure:** Presenting to another human (or video recorder) forces the brain to internalize concepts.
3. **Linearization:** Translating non-linear code into a linear verbal narrative.
* **Live Oral Defense:** A fallback mechanism that poses randomized, foundational domain questions to test real-time reasoning.

### The Annotation Cycle
After AI writes a plan or spec, don't just say "looks good." Review it in your editor:
1. AI writes the plan/spec to a markdown file.
2. You open it and add inline notes (corrections, domain knowledge, rejected approaches).
3. Send it back: "Update based on my annotations — don't implement yet."
4. AI revises the document.
5. Repeat steps 1-4 until the plan is right (typically 1-6 rounds).

---

## Available Skills

| Skill | Stage | Purpose |
|-------|-------|---------|
| `/finance-driver:init` | Setup | Initialize project structure |
| `/finance-driver:status` | Any | Check progress, get suggestions in D · [R-I-V-E] · R |
| `/finance-driver:help` | Any | This help page |
| `/finance-driver:research` | Any | Lightweight 分头研究 — resolve knowledge gaps |
| `/finance-driver:define` | D: Define | Bounding the problem space and success criteria |
| `/finance-driver:discover` | D: Discover | Mapping knowledge inventory, assumptions, and gaps |
| `/finance-driver:represent-roadmap` | [R]epresent | Break the unique part into buildable sections |
| `/finance-driver:represent-datamodel` | [R]epresent | Define core entities and database schemas |
| `/finance-driver:represent-tokens` | [R]epresent | Colors/typography (web apps) |
| `/finance-driver:represent-shell` | [R]epresent | Navigation shell (web apps) |
| `/finance-driver:represent-section` | [R]epresent | Spec a section |
| `/finance-driver:implement-data` | [I]mplement | Generate sample data (web apps) |
| `/finance-driver:implement-screen` | [I]mplement | Build and run code (Show Don't Tell) |
| `/finance-driver:validate` | [V]alidate | Cross-check: known answers, reasonableness, edges, AI risks |
| `/finance-driver:evolve` | [E]volve | Four beats (process, artifact, patterns, new doors) + package the export |
| `/finance-driver:reflect` | R: Reflect | Metacognitive self-rating, video briefing, and Live Oral Defense |

---

## Recommended Stack for Finance/Quant

```
UI:           Streamlit (or Dash/Panel)
Backend:      FastAPI + Pydantic
Calculations: NumPy, Pandas, SciPy
Finance:      numpy-financial, QuantLib
Data Sources: financialdatasets.ai, yfinance, FRED
Storage:      SQLite, Parquet files
Testing:      pytest + Hypothesis
```

---

## Iron Laws (Never Break These)

| Stage | Iron Law |
|-------|----------|
| **DEFINE** | DEFINE THE PROBLEM SPACE BEFORE ASKING FOR SOLUTIONS |
| **DISCOVER** | MAP YOUR GAPS AND ASSUMPTIONS BEFORE RESEARCHING |
| **REPRESENT** | PLAN THE UNIQUE PART — DON'T REINVENT LIBRARIES |
| **IMPLEMENT** | SHOW DON'T TELL — BUILD AND RUN IT |
| **VALIDATE** | TRUST BUT VERIFY, ESPECIALLY WITH AI — known answers, reasonableness, edges, AI risks |
| **EVOLVE** | EVERY CYCLE IMPROVES THE NEXT — workflow, artifact, patterns, new doors |
| **REFLECT** | IF YOU CAN'T EXPLAIN IT ON CAMERA, YOU DON'T UNDERSTAND IT |

