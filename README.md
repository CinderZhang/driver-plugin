# DRIVER™ Plugin for Claude Code

A methodology for AI-augmented finance and quantitative tool development.

> **Cognition Mate (认知伙伴)** — 互帮互助，因缘合和，互相成就
> *Mutual help. Interdependent arising. Accomplishing together.*

---

## What is DRIVER™?

DRIVER™ is a metacognitive framework that structures development into a bracketed flow: **$D \cdot [R\text{-}I\text{-}V\text{-}E] \cdot R$**, enforcing "slow edges" (human reflection and problem formulation) and a "fast middle" (machine-assisted build cycles).

| Stage | Focus | Command | Ratio (Human/AI) |
|-------|-------|---------|------------------|
| **$D$ — Define** | External problem space and success criteria | `/finance-driver:define` | 80% / 20% (Human Edge) |
| **$D$ — Discover** | Internal knowledge inventory, gaps, and assumptions | `/finance-driver:discover` | 80% / 20% (Human Edge) |
| **$[R\text{-}I\text{-}V\text{-}E]$** | Machine middle: Roadmap, Specs, Implementation, Validation, Evolve | `/finance-driver:represent-*`, `/finance-driver:implement-*`, `/finance-driver:validate`, `/finance-driver:evolve` | 20% / 80% (Machine Middle) |
| **$R$ — Reflect** | Spoken/Video Presentation and Live Oral Defense | `/finance-driver:reflect` | 80% / 20% (Human Edge) |

## The Philosophy: Cognition Mate (认知伙伴)

**AI is not a tool you command — it's a thinking partner.**

* **The Edges ($D$ and $R$):** The human leads. You bound the problem space and map your gaps to avoid the **Timing Problem** (AI answering before you formulate the question) and the **Deskilling Paradox** (AI replacing human judgment).
* **The Middle ($[R\text{-}I\text{-}V\text{-}E]$):** The AI does the heavy lifting of code drafting and testing while you steer. Optimize for execution speed here.

---

## Installation

### From GitHub (Recommended)

In Claude Code, run these two commands:

```bash
# Step 1: Add the DRIVER marketplace
/plugin marketplace add CinderZhang/driver-plugin
```

```bash
# Step 2: Install the finance-driver plugin
/plugin install finance-driver@driver
```

Then **restart Claude Code** to activate the plugin.

### Verify Installation

After restarting, run:

```bash
/finance-driver:help
```

You should see the full DRIVER reference with all available skills.

### Manual Installation (Alternative)

If the plugin commands aren't available in your version of Claude Code, you can clone and reference the repo directly:

```bash
git clone https://github.com/CinderZhang/driver-plugin.git ~/.claude/plugins/driver-plugin
```

Then add to your `~/.claude/settings.json`:

```json
{
  "plugins": {
    "driver-plugin": {
      "source": "~/.claude/plugins/driver-plugin"
    }
  }
}
```

Restart Claude Code after adding.

---

## Quick Start

```bash
# Start Claude Code in your project directory
claude

# Initialize a DRIVER project
/finance-driver:init

# Check status in the bracketed flow
/finance-driver:status

# Begin by bounding the problem space
/finance-driver:define
```

---

## Available Skills

### Utility
| Skill | Purpose |
|-------|---------|
| `/finance-driver:init` | Initialize a new DRIVER project |
| `/finance-driver:status` | Show progress, suggest next step in the bracketed flow |
| `/finance-driver:help` | Full reference with Chinese term explanations |
| `/finance-driver:research` | Lightweight 分头研究 — resolve knowledge gaps anytime |

### D: Define & Discover Stage (Human Edges)
| Skill | Purpose |
|-------|---------|
| `/finance-driver:define` | Bounding the external problem space & success criteria |
| `/finance-driver:discover` | Mapping knowledge inventory, assumptions, and gaps |

### [R-I-V-E] Stage (Machine Middle)
| Skill | Purpose |
|-------|---------|
| `/finance-driver:represent-roadmap` | Break the unique part into buildable sections |
| `/finance-driver:represent-datamodel` | Define core entities and database schemas |
| `/finance-driver:represent-tokens` | Choose colors and typography (web apps) |
| `/finance-driver:represent-shell` | Design navigation shell (web apps) |
| `/finance-driver:represent-section` | Spec a section |
| `/finance-driver:implement-data` | Create sample data |
| `/finance-driver:implement-screen` | Build and run code (Show Don't Tell) |
| `/finance-driver:validate` | Cross-check: known answers, reasonableness, edges, AI risks |
| `/finance-driver:evolve` | Generate final production-ready export package |

### R: Reflect Stage (Human Edge)
| Skill | Purpose |
|-------|---------|
| `/finance-driver:reflect` | Spoken/Video Presentation guidelines & Live Oral Defense |

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

## Authors

DRIVER™ was created by **Cinder Zhang** and **Leo Zhang**.

Contact: zhangcinder@gmail.com

---

## Disclaimer

**DRIVER™ is a development methodology, not financial software.**

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

*DRIVER™ was developed through the practice it teaches — human vision and AI collaboration, accomplishing together.*
