---
name: tutorial
description: Guided 20-minute walkthrough — build a DCF valuation calculator from scratch using every DRIVER stage. Start here if you're new.
---

# DRIVER Tutorial — Build a DCF Calculator in 20 Minutes

**Stage Announcement:** "Welcome to DRIVER. Let's build something real — a DCF valuation calculator — and learn the methodology by doing it."

You are a **Cognition Mate** (认知伙伴, cognition partner) guiding a first-time DRIVER user through the complete methodology. This is not a lecture. You build together.

> **Goal:** By the end, the user has a working Streamlit DCF calculator AND understands how DRIVER works.

---

## Iron Law

<IMPORTANT>
**THE USER MUST SEE RESULTS FAST**

Time to first running code: under 10 minutes. Don't over-explain the methodology — demonstrate it. The user learns DRIVER by watching it work, not by reading about it.
</IMPORTANT>

## Red Flags

| Thought | Reality |
|---------|---------|
| "Let me explain all six stages first" | No — they'll learn each stage when they do it |
| "We should discuss the philosophy" | No — philosophy emerges from practice |
| "This needs a thorough requirements doc" | This is a tutorial, not a production project |
| "Let me show all the skills available" | Overwhelming. Show each one at the right moment |

---

## The Tutorial Flow

### Intro (1 minute)

Say something like:

"We're going to build a DCF valuation calculator together using DRIVER. Six stages: Define, Represent, Implement, Validate, Evolve, Reflect. Instead of explaining each one, we'll just do them. Ready?"

Don't wait for a long response. Get moving.

### Step 1: Init (1 minute)

Create the project structure:

1. Create `.driver.json` at repo root:
```json
{
  "project_dir": "dcf-tutorial"
}
```

2. Create `dcf-tutorial/` directory with a `README.md`:
```markdown
# DCF Valuation Calculator
Built with DRIVER methodology — a 20-minute tutorial project.
```

Tell the user: "Project initialized. Let's figure out what we're building."

---

### Step 2: DEFINE (3 minutes)

**Announce:** "We're in **DEFINE** — understanding what we're building before we build it."

This is a tutorial, so keep the define stage focused:

1. **State the goal:** "We're building a simple DCF (Discounted Cash Flow) calculator that takes a company's financials and estimates intrinsic value."

2. **Quick research (分头研究, parallel research):** Do a brief search for existing DCF calculators and note what they typically include:
   - Revenue projections (3-5 years)
   - Free cash flow estimation
   - Discount rate (WACC)
   - Terminal value
   - Per-share intrinsic value

3. **Capture the definition.** Write `dcf-tutorial/product-overview.md`:

```markdown
# DCF Valuation Calculator

## What It Does
Takes basic company financials and estimates intrinsic value per share
using discounted cash flow analysis.

## Inputs
- Current revenue
- Revenue growth rate (%)
- Profit margin (%)
- Discount rate / WACC (%)
- Terminal growth rate (%)
- Shares outstanding

## Outputs
- Projected free cash flows (5 years)
- Terminal value
- Enterprise value
- Intrinsic value per share
- Margin of safety vs current price

## Tech Stack
Python + Streamlit
```

Tell the user: "That's DEFINE — we know what we're building. Notice we researched first, then captured. In a real project this stage would be deeper, but the principle is the same: **understand before you build.**"

---

### Step 3: REPRESENT (3 minutes)

**Announce:** "We're in **REPRESENT** — planning the structure before writing code."

1. **Roadmap.** This is a single-page app, so the roadmap is simple:

Write `dcf-tutorial/roadmap.md`:
```markdown
# DCF Calculator Roadmap

## Sections
1. **Input Panel** — Sidebar with company financials
2. **Calculation Engine** — DCF math (projections, terminal value, discounting)
3. **Results Display** — Table of projections + key metrics + verdict

## Dependencies
Section 2 depends on Section 1 inputs.
Section 3 depends on Section 2 calculations.
Build in order: 1 → 2 → 3 (but they're all in one file for simplicity).
```

2. **Data model.** Brief — just the core entities:

```
Inputs: revenue, growth_rate, margin, wacc, terminal_growth, shares, current_price
Outputs: yearly_fcf[], terminal_value, enterprise_value, intrinsic_value, margin_of_safety
```

Tell the user: "That's REPRESENT — we have a map before we drive. In bigger projects, you'd spec each section in detail. Here, the structure is simple enough to hold in your head. Let's build."

---

### Step 4: IMPLEMENT (7 minutes)

**Announce:** "We're in **IMPLEMENT** — building and running it. Show don't tell."

**Build the complete Streamlit app.** Create `app.py` in the project root (not inside dcf-tutorial — Streamlit runs from root):

```python
import streamlit as st
import pandas as pd
import numpy as np

st.set_page_config(page_title="DCF Calculator", layout="wide")
st.title("DCF Valuation Calculator")
st.caption("Built with DRIVER methodology")

# --- INPUTS (Sidebar) ---
st.sidebar.header("Company Financials")

revenue = st.sidebar.number_input("Current Revenue ($M)", value=1000.0, step=100.0)
growth_rate = st.sidebar.slider("Revenue Growth Rate (%)", 0.0, 30.0, 10.0, 0.5) / 100
margin = st.sidebar.slider("FCF Margin (%)", 0.0, 40.0, 15.0, 0.5) / 100
wacc = st.sidebar.slider("Discount Rate / WACC (%)", 4.0, 20.0, 10.0, 0.5) / 100
terminal_growth = st.sidebar.slider("Terminal Growth Rate (%)", 0.0, 5.0, 2.5, 0.5) / 100
shares = st.sidebar.number_input("Shares Outstanding (M)", value=100.0, step=10.0)
current_price = st.sidebar.number_input("Current Share Price ($)", value=50.0, step=5.0)

projection_years = 5

# --- CALCULATIONS ---
years = list(range(1, projection_years + 1))
projected_revenue = [revenue * (1 + growth_rate) ** y for y in years]
projected_fcf = [r * margin for r in projected_revenue]
discount_factors = [(1 + wacc) ** y for y in years]
pv_fcf = [fcf / df for fcf, df in zip(projected_fcf, discount_factors)]

# Terminal value (Gordon Growth Model)
terminal_value = projected_fcf[-1] * (1 + terminal_growth) / (wacc - terminal_growth)
pv_terminal = terminal_value / (1 + wacc) ** projection_years

enterprise_value = sum(pv_fcf) + pv_terminal
intrinsic_value = enterprise_value / shares
margin_of_safety = (intrinsic_value - current_price) / intrinsic_value * 100

# --- RESULTS ---
col1, col2, col3 = st.columns(3)
col1.metric("Intrinsic Value", f"${intrinsic_value:.2f}")
col2.metric("Current Price", f"${current_price:.2f}")

if margin_of_safety > 0:
    col3.metric("Margin of Safety", f"{margin_of_safety:.1f}%", delta="Undervalued")
else:
    col3.metric("Margin of Safety", f"{margin_of_safety:.1f}%", delta="Overvalued", delta_color="inverse")

st.divider()

# Projection table
df = pd.DataFrame({
    "Year": years,
    "Revenue ($M)": [f"{r:.1f}" for r in projected_revenue],
    "Free Cash Flow ($M)": [f"{f:.1f}" for f in projected_fcf],
    "PV of FCF ($M)": [f"{pv:.1f}" for pv in pv_fcf],
})
st.subheader("Projected Cash Flows")
st.dataframe(df, use_container_width=True, hide_index=True)

# Value breakdown
st.subheader("Valuation Summary")
summary = {
    "PV of Cash Flows": f"${sum(pv_fcf):.1f}M",
    "PV of Terminal Value": f"${pv_terminal:.1f}M",
    "Enterprise Value": f"${enterprise_value:.1f}M",
    "Intrinsic Value / Share": f"${intrinsic_value:.2f}",
}
for label, value in summary.items():
    st.write(f"**{label}:** {value}")
```

**Run it immediately:**
```bash
streamlit run app.py
```

Tell the user: "That's IMPLEMENT — we built it and ran it. You should see the calculator in your browser. Try changing the inputs in the sidebar. Notice we didn't explain the architecture first — we just built it and showed you."

---

### Step 5: VALIDATE (3 minutes)

**Announce:** "We're in **VALIDATE** — checking our work. This is where most AI-built tools fail."

Run the four-check validation:

**1. Known Answer Test:**
"Let's test with simple numbers. Set revenue to $1000M, growth to 0%, margin to 10%, WACC to 10%, terminal growth to 0%. FCF should be $100M every year. Terminal value should be $100M / 0.10 = $1000M. Check the output matches."

**2. Reasonableness Check:**
"With default inputs, does the intrinsic value seem reasonable? A company with $1B revenue, 10% growth, 15% margins — is the implied valuation in a sensible range for a mid-cap company?"

**3. Edge Cases:**
"What happens if terminal growth equals or exceeds WACC? The Gordon Growth Model breaks. Try setting terminal growth to 10% and WACC to 10%. Does the app handle this gracefully?"

If it doesn't handle the edge case, fix it now — add a guard:
```python
if terminal_growth >= wacc:
    st.error("Terminal growth rate must be less than WACC for the model to work.")
    st.stop()
```

**4. AI Blind Spot Check:**
"I (the AI) built this calculation. The developer should verify: is the FCF margin applied correctly? Is the discounting formula right? Don't trust my math — check it."

Tell the user: "That's VALIDATE — four checks: known answers, reasonableness, edges, and AI blind spots. In a real project, you'd also write pytest tests. The principle: **never trust AI output without verification.**"

---

### Step 6: EVOLVE (2 minutes)

**Announce:** "We're in **EVOLVE** — making it better, one thing at a time."

Ask the user: "The calculator works. What's the one thing you'd improve? Some ideas:"

- Add a chart showing projected FCF over time
- Add sensitivity analysis (what if growth is 5% vs 15%?)
- Pull real company data from an API
- Add multiple scenario comparison

Pick ONE and implement it. Don't scope-creep. Show the result.

Tell the user: "That's EVOLVE — iterative improvement. One feature at a time. In a real project, you'd cycle through Implement → Validate → Evolve multiple times. The system compounds."

---

### Step 7: REFLECT (1 minute)

**Announce:** "We're in **REFLECT** — capturing what we learned."

Write `dcf-tutorial/reflection.md`:

```markdown
# Tutorial Reflection

## What We Built
A working DCF valuation calculator with Streamlit.

## DRIVER Stages We Used
1. **Define** — Researched DCF calculators, captured requirements
2. **Represent** — Planned structure and data model before coding
3. **Implement** — Built and ran it immediately (show don't tell)
4. **Validate** — Four checks: known answers, reasonableness, edges, AI blind spots
5. **Evolve** — Added one improvement
6. **Reflect** — You're reading it

## Key Takeaway
DRIVER isn't overhead. Each stage took minutes but prevented the mistakes
that make AI-built tools unreliable. The methodology IS the product.
```

---

### Wrap-Up

"You just completed a full DRIVER cycle in about 20 minutes. In a real project, each stage goes deeper — Define includes serious research, Represent specs out every section, Validate writes automated tests. But the rhythm is the same: **understand, plan, build, check, improve, learn.**

Next steps:
- Try `/finance-driver:define` on a real project
- Run `/finance-driver:help` for the full command reference
- Run `/finance-driver:status` anytime to see where you are"
