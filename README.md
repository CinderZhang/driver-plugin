# DRIVER Plugin for Claude Code

A methodology for AI-augmented finance and quantitative tool development.

> **Cognition Mate (认知伙伴)** — 互帮互助，因缘合和，互相成就
> *Mutual help. Interdependent arising. Accomplishing together.*

---

## ⚠️ Renamed: `driver` → `finance-driver`

**If you installed before this change**, the plugin name has been updated from `driver` to `finance-driver` and the marketplace from `driver-plugin` to `driver`. All skill prefixes changed from `/driver:` to `/finance-driver:`.

**To update:**

```bash
# 1. Remove the old plugin and marketplace
/plugin uninstall driver@driver-plugin
/plugin marketplace remove driver-plugin

# 2. Add the renamed marketplace and install
/plugin marketplace add https://github.com/CinderZhang/driver-plugin
/plugin install finance-driver@driver
```

Restart Claude Code after updating.

**Why the rename?** The `driver` marketplace is now an umbrella for domain-specific DRIVER plugins. `finance-driver` is the first — future plugins like `accounting-driver`, `marketing-driver`, etc. will live under the same marketplace.

---

## ⚠️ Disclaimer

**DRIVER is a development methodology, not financial software.**

- This plugin provides a **workflow framework** for building tools — it does not execute trades, manage portfolios, or provide financial advice
- Any financial tools you build using DRIVER require **your own validation and testing**
- The authors assume **no liability** for financial decisions made using tools developed with this methodology
- This is **not investment advice** — consult qualified financial professionals for investment decisions
- Sample code and examples are for **educational purposes only**

**By using this plugin, you acknowledge that:**
1. You are responsible for validating any financial calculations in tools you build
2. You understand the risks of financial software development
3. You will not hold the authors liable for any financial losses

---

## What is DRIVER?

DRIVER guides you through six stages from concept to completion:

| Stage | Purpose | Iron Law |
|-------|---------|----------|
| **D**efine | Research what exists | No building without 分头研究 first |
| **R**epresent | Plan part by part | Don't reinvent what exists |
| **I**mplement | Build and run | Show don't tell |
| **V**alidate | Verify it works | Evidence before claims |
| **E**volve | Package deliverable | Self-contained export |
| **R**eflect | Capture learnings | Document what didn't work |

## The Philosophy

**AI is not a tool you command — it's a thinking partner.**

- **You bring**: vision, domain expertise, judgment
- **AI brings**: patterns, research ability, heavy lifting on code
- **Neither creates alone** — meaning emerges from interaction

---

## Installation

### From GitHub (Recommended)

```bash
# Step 1: In Claude Code
/plugin marketplace add https://github.com/CinderZhang/driver-plugin
```

```bash
# Step 2: In Claude Code
/plugin install finance-driver@driver
```

Restart Claude Code after installing.

---

## Quick Start

```bash
# Start Claude Code in your project directory
claude

# Initialize a DRIVER project
/finance-driver:init

# Check available commands
/finance-driver:help

# Begin with research and definition
/finance-driver:define
```

---

## Available Skills

### Utility
| Skill | Purpose |
|-------|---------|
| `/finance-driver:init` | Initialize a new DRIVER project |
| `/finance-driver:status` | Show progress, suggest next step |
| `/finance-driver:help` | Full reference with Chinese term explanations |

### DEFINE Stage
| Skill | Purpose |
|-------|---------|
| `/finance-driver:define` | Research and define product vision (开题调研) |
| `/finance-driver:research` | Lightweight 分头研究 — find libraries, approaches, references anytime |

### REPRESENT Stage
| Skill | Purpose |
|-------|---------|
| `/finance-driver:represent-roadmap` | Break into 3-5 buildable sections |
| `/finance-driver:represent-datamodel` | Define core entities |
| `/finance-driver:represent-tokens` | Choose colors and typography |
| `/finance-driver:represent-shell` | Design navigation shell |
| `/finance-driver:represent-section` | Spec a section |

### IMPLEMENT Stage
| Skill | Purpose |
|-------|---------|
| `/finance-driver:implement-data` | Create sample data |
| `/finance-driver:implement-screen` | Build and run code |

### VALIDATE Stage
| Skill | Purpose |
|-------|---------|
| `/finance-driver:validate` | Cross-check: known answers, reasonableness, edges, AI risks |

### EVOLVE Stage
| Skill | Purpose |
|-------|---------|
| `/finance-driver:evolve` | Generate final export package |

### REFLECT Stage
| Skill | Purpose |
|-------|---------|
| `/finance-driver:reflect` | Capture learnings and tech stack lessons |

---

## For Quant/Finance Work

DRIVER recommends **Python + Streamlit** over TypeScript/React for analytical tools:

```
UI:           Streamlit (or Dash/Panel)
Backend:      FastAPI + Pydantic
Calculations: NumPy, Pandas, SciPy
Finance:      numpy-financial, QuantLib
Data:         financialdatasets.ai, Bloomberg, Refinitiv (recommended)
              yfinance, FRED (free alternatives - use at own risk)
```

**Why Python?**
- NumPy handles edge cases (safe division, vectorized ops)
- Pydantic validates inputs at boundaries
- No npm complexity, no TypeScript type juggling
- Better finance libraries

---

## Example Projects

| Project Type | Key Libraries | Data Source | Reference |
|--------------|---------------|-------------|-----------|
| DCF Valuation | numpy-financial | financialdatasets.ai | Damodaran |
| Portfolio Optimization | PyPortfolioOpt, cvxpy | Professional data feed | Markowitz |
| Factor Research | alphalens, statsmodels | WRDS, CRSP | Open Source Asset Pricing |
| Risk Analytics | scipy.stats, VaR/CVaR | Professional data feed | RiskMetrics |
| Data Pipeline | pandas, great_expectations | Multiple sources | ETL patterns |

> **Data Sources:** For reliable results, use professional data providers (financialdatasets.ai, Bloomberg, Refinitiv, FactSet). Free sources like yfinance may have gaps, delays, or inaccuracies.

---

## Key Chinese Terms

| Term | Pinyin | Meaning |
|------|--------|---------|
| 认知伙伴 | rèn zhī huǒ bàn | Cognition Mate — thinking partner |
| 互帮互助 | hù bāng hù zhù | Mutual help |
| 因缘合和 | yīn yuán hé hé | Interdependent arising |
| 互相成就 | hù xiāng chéng jiù | Accomplishing together |
| 开题调研 | kāi tí diào yán | Open the topic + research (DEFINE) |
| 分头研究 | fēn tóu yán jiū | Parallel research |

---

## License

MIT License — See [LICENSE](LICENSE) file.

---

## Contributing

Issues and pull requests welcome. Please read the philosophy section first — contributions should align with the Cognition Mate approach.

---

## Author

Cinder Zhang (cinderzhang@gmail.com)

---

*DRIVER was developed through the practice it teaches — human vision and AI collaboration, accomplishing together.*
