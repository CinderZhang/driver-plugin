# DRIVER — AI Working Competency Framework

Build finance and quantitative tools with AI, systematically.

DRIVER is a Claude Code plugin that guides you through six stages from concept to working software. It's not a chatbot wrapper. It's a methodology — the same one taught at Purdue University as part of the first AI working competency requirement in American higher education.

> **Cognition Mate (认知伙伴)** — 互帮互助，因缘合和，互相成就
> *Mutual help. Interdependent arising. Accomplishing together.*

---

## 20-Minute Quick Start

Install the plugin, then build a working DCF valuation calculator — learning every DRIVER stage along the way.

### 1. Install

```bash
claude
```

Then inside Claude Code:

```
/install-plugin https://github.com/CinderZhang/driver-plugin
```

### 2. Run the Tutorial

```
/finance-driver:tutorial
```

This walks you through building a real Streamlit app from scratch. You'll define requirements, plan the structure, write code, validate calculations, and iterate — in about 20 minutes. By the end you'll understand DRIVER and have something running.

### 3. Start Your Own Project

```
/finance-driver:init
/finance-driver:define
```

---

## What is DRIVER?

Six stages. Each exists because skipping it is how projects fail.

| Stage | What You Do | The Rule |
|-------|-------------|----------|
| **D**efine | Research what exists, then define what you're building | No building without 分头研究 (parallel research) first |
| **R**epresent | Plan the structure before writing code | Step out of the blur into clarity |
| **I**mplement | Build it and run it | Show don't tell — no explaining, just build |
| **V**alidate | Cross-check everything | Known answers, reasonableness, edges, AI blind spots |
| **E**volve | Improve one thing at a time | Context compounds — capture what works |
| **R**eflect | Document what you learned | What didn't work matters more than what did |

### The Philosophy

AI is not a tool you command. It's a thinking partner.

- **You bring:** vision, domain expertise, judgment
- **AI brings:** patterns, research ability, heavy lifting on code
- **Neither creates alone** — meaning emerges from interaction

---

## All Skills

### Getting Started

| Skill | Purpose |
|-------|---------|
| `/finance-driver:tutorial` | **New? Start here.** Build a DCF calculator in 20 minutes |
| `/finance-driver:init` | Initialize a new DRIVER project |
| `/finance-driver:status` | See where you are, get suggestions for next step |
| `/finance-driver:help` | Full reference — all skills, philosophy, Chinese terms |
| `/finance-driver:research` | Quick research anytime — find libraries, approaches, papers |

### The Six Stages

| Skill | Stage | Purpose |
|-------|-------|---------|
| `/finance-driver:define` | Define | Research and define your product vision |
| `/finance-driver:represent-roadmap` | Represent | Break into 3-5 buildable sections |
| `/finance-driver:represent-datamodel` | Represent | Define core entities and relationships |
| `/finance-driver:represent-tokens` | Represent | Choose colors and typography (Streamlit or React) |
| `/finance-driver:represent-shell` | Represent | Design navigation structure (Streamlit or React) |
| `/finance-driver:represent-section` | Represent | Spec a single section in detail |
| `/finance-driver:implement-data` | Implement | Generate data models (Pydantic or TypeScript) and sample data |
| `/finance-driver:implement-screen` | Implement | Build and run code — see it working immediately |
| `/finance-driver:validate` | Validate | Four-check verification: known answers, reasonableness, edges, AI blind spots |
| `/finance-driver:evolve` | Evolve | Package your deliverable for export |
| `/finance-driver:reflect` | Reflect | Capture learnings and tech stack retrospective |

---

## Tech Stack

DRIVER recommends **Python + Streamlit** for finance and quant work:

```
UI:           Streamlit
Models:       Pydantic
Calculations: NumPy, Pandas, SciPy
Finance:      numpy-financial, QuantLib
```

Why Python over React? NumPy handles edge cases. Pydantic validates at boundaries. No npm complexity. Better finance libraries. A 500-line Python script beats a 50-file TypeScript project for analytical tools.

React is supported as an alternative path for web applications.

---

## Data Sources

Your data source should work **with** LLMs, not against them.

### LLM-Native (recommended)

| Provider | Best For | Pricing |
|----------|----------|---------|
| [financialdatasets.ai](https://www.financialdatasets.ai/) | Fundamentals, SEC filings, prices | $0.01/req or $200/mo |
| [Alpha Vantage](https://mcp.alphavantage.co/) | Multi-asset, technicals, news | Free tier + paid |
| [EODHD](https://eodhd.com/financial-apis/mcp-server-for-financial-data-by-eodhd) | Global exchange coverage | Free tier + paid |

### Others

| Provider | Best For | Notes |
|----------|----------|-------|
| [Polygon.io](https://github.com/polygon-io/mcp_polygon) | Real-time tick data, options | MCP available |
| [S&P Global / Kensho](https://support.claude.com/en/articles/12220135-using-s-p-global-data-for-financial-analysis) | Institutional-grade | Enterprise |
| [Financial Modeling Prep](https://financialmodelingprep.com/) | All-in-one fundamentals | Free tier + paid |
| yfinance, FRED | Prototyping only | Verify accuracy |

---

## Example Projects

| Project | Libraries | Data Source |
|---------|-----------|-------------|
| DCF Valuation | numpy-financial | financialdatasets.ai |
| Portfolio Optimization | PyPortfolioOpt, cvxpy | financialdatasets.ai or Polygon.io |
| Factor Research | alphalens, statsmodels | WRDS, CRSP |
| Risk Analytics | scipy.stats, VaR/CVaR | financialdatasets.ai |
| Data Pipeline | pandas, great_expectations | Multiple sources |

---

## Chinese Terms

DRIVER's philosophy draws from Chinese intellectual traditions:

| Term | Meaning |
|------|---------|
| 认知伙伴 (rèn zhī huǒ bàn) | Cognition Mate — thinking partner |
| 互帮互助 (hù bāng hù zhù) | Mutual help |
| 因缘合和 (yīn yuán hé hé) | Interdependent arising |
| 互相成就 (hù xiāng chéng jiù) | Accomplishing together |
| 开题调研 (kāi tí diào yán) | Open the topic + research (DEFINE) |
| 分头研究 (fēn tóu yán jiū) | Parallel research |

---

## Author

**Cinder Zhang** — Professor at Purdue University, Co-Founder of Driver AI

DRIVER is developed and taught at Purdue University. Cinder's DRIVER-based course is one of three AI working competency courses selected by Purdue's Daniels School of Business — the first university in America to require AI working competency for all graduates.

---

## License

MIT — See [LICENSE](LICENSE).

---

## Contributing

Issues and pull requests welcome. Read the philosophy section first — contributions should align with the Cognition Mate approach.

---

## Disclaimer

**DRIVER is a development methodology, not financial software.** This plugin provides a workflow framework for building tools — it does not execute trades, manage portfolios, or provide financial advice. Any financial tools you build require your own validation and testing. This is not investment advice.

---

*DRIVER was developed through the practice it teaches — human vision and AI collaboration, accomplishing together.*
