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
| **D**efine | Discover + define vision | No building without 分头研究 first |
| **R**epresent | Plan part by part | Don't reinvent what exists |
| **I**mplement | Build and run | Show don't tell |
| **V**alidate | Cross-check your instruments | Known answers, reasonableness, edges, AI risks |
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
| `/finance-driver:research` | Lightweight 分头研究 — find libraries, approaches, references anytime |

### DEFINE Stage
| Skill | Purpose |
|-------|---------|
| `/finance-driver:define` | Research and define product vision (开题调研) |

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
Data:         See "Recommended Data Sources" below
```

**Why Python?**
- NumPy handles edge cases (safe division, vectorized ops)
- Pydantic validates inputs at boundaries
- No npm complexity, no TypeScript type juggling
- Better finance libraries

---

## Recommended Data Sources

DRIVER builds tools with AI — your data source should work **with** LLMs, not against them.

### LLM-Native (MCP + AI-first design)

| Provider | MCP Server | Best For | Pricing |
|----------|-----------|----------|---------|
| [financialdatasets.ai](https://www.financialdatasets.ai/) | [Official](https://docs.financialdatasets.ai/mcp-server) | Fundamentals, SEC filings, prices | $0.01/req or $200/mo |
| [Alpha Vantage](https://mcp.alphavantage.co/) | Official | Multi-asset, technicals, news | Free tier + paid |
| [EODHD](https://eodhd.com/financial-apis/mcp-server-for-financial-data-by-eodhd) | Official | Global exchange coverage | Free tier + paid |

### MCP Available (not AI-first)

| Provider | MCP Server | Best For | Pricing |
|----------|-----------|----------|---------|
| [Polygon.io](https://github.com/polygon-io/mcp_polygon) | Experimental | Real-time tick data, options | Higher tier |
| [S&P Global / Kensho](https://support.claude.com/en/articles/12220135-using-s-p-global-data-for-financial-analysis) | Claude integration | Institutional-grade fundamentals | Enterprise |

### Traditional REST (no MCP)

| Provider | Best For | Pricing |
|----------|----------|---------|
| [Financial Modeling Prep](https://financialmodelingprep.com/) | All-in-one fundamentals + pricing | Free tier + paid |
| Bloomberg, Refinitiv, FactSet | Professional/institutional workflows | Enterprise |
| yfinance, FRED | Prototyping only — verify accuracy | Free |

### Why financialdatasets.ai is the default recommendation

- **Built for LLMs** — clean JSON, `llms.txt` endpoint, AI agent examples
- **MCP-native** — official server at `mcp.financialdatasets.ai/mcp`, works with Claude out of the box
- **Direct sourcing** — data from SEC/EDGAR, no middlemen or aggregators
- **Developer accessible** — pay-per-request from $0.01, no enterprise gatekeeping
- **Ecosystem** — open-source [agent examples](https://github.com/virattt/ai-financial-agent) and [datasets](https://github.com/virattt/financial-datasets) from the same team

> **When to look elsewhere:** Real-time tick data → Polygon.io. Institutional-grade → S&P Global/Kensho. Global exchanges → EODHD. Prototyping only → yfinance (but verify everything).

---

## Example Projects

| Project Type | Key Libraries | Data Source | Reference |
|--------------|---------------|-------------|-----------|
| DCF Valuation | numpy-financial | financialdatasets.ai | Damodaran |
| Portfolio Optimization | PyPortfolioOpt, cvxpy | financialdatasets.ai or Polygon.io | Markowitz |
| Factor Research | alphalens, statsmodels | WRDS, CRSP | Open Source Asset Pricing |
| Risk Analytics | scipy.stats, VaR/CVaR | financialdatasets.ai or Polygon.io | RiskMetrics |
| Data Pipeline | pandas, great_expectations | Multiple sources | ETL patterns |

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

Cinder Zhang (zhangcinder@gmail.com)

---

*DRIVER was developed through the practice it teaches — human vision and AI collaboration, accomplishing together.*
