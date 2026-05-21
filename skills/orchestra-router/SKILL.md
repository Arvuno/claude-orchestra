---
name: orchestra-router
description: >
  Runtime router for the orchestra system. Use at the start of EVERY task to detect intent and
  activate the right orchestra(s) automatically, then announce which fired. Matches the request
  against the orchestra triggers defined in ~/.claude/rules/orchestra-system.md and stacks
  multiple orchestras for compound requests.
---

# Orchestra Router — Route Every Task

Match each incoming request to one or more orchestras, activate them, and announce the activation.

## Process

1. **Read intent.** What is the user actually trying to do?
2. **Match to orchestra(s)** using the trigger table below (and the full definitions in
   `~/.claude/rules/orchestra-system.md`). A request can activate **multiple** orchestras —
   stack them when complementary.
3. **Idea / business-planning signals** ("I have an idea", "thinking of building", "plan a
   business", "should I build", "is this a good idea") → fire the **NEXUS meta-conductor** instead
   of a single orchestra; it sequences orchestras across the lifecycle.
4. **Announce** every activation, every time:
   `🎼 <ORCHESTRA> active · Conductor: <agent> · Using: <tools>`
5. **Conductor leads.** The orchestra's conductor agent sequences its players — no free-for-all.

## Quick trigger table

| Intent signals | Orchestra |
|---|---|
| build, fix bug, refactor, implement, deploy, ship, code review | ① BUILD |
| design, UI, UX, mockup, layout, wireframe, brand | ② DESIGN |
| research, investigate, competitive analysis, what's the latest | ③ RESEARCH |
| marketing strategy, social media, campaign, GTM | ④ MARKETING |
| write copy, blog, newsletter, content, captions | ⑤ CONTENT |
| SEO, rank, schema, AI search, GEO, AEO | ⑥ SEO + GEO |
| leads, prospect, outreach, cold email, pipeline, pricing, RevOps | ⑦ LEAD GEN & SALES |
| product strategy, PRD, roadmap, feature prioritization | ⑧ PRODUCT |
| make video, reels, generate image, thumbnail | ⑨ VIDEO + MEDIA |
| analytics, metrics, funnel, cohort, dashboard, A/B results | ⑩ ANALYTICS |
| remember, knowledge graph, notes, map this codebase | ⑪ KNOWLEDGE & MEMORY |
| create report, deck, export PDF, slides | ⑫ DOCUMENTS |
| Google/Meta ads, paid media, PPC | ⑬ PAID ADS |
| automate, workflow, recurring task, schedule, pipeline | ⑭ AUTOMATION & OPS |
| AI pipeline, fine-tune, multi-agent, build MCP, RAG | ⑮ AI/ML |
| iOS, Android, Swift, React Native, app store | ⑯ MOBILE |
| plan, sprint, OKRs, roadmap, user stories | ⑰ PLANNING & PM |
| conversion, churn, retention, paywall, ASO, activation | ⑱ GROWTH & CONVERSION |
| invest, valuation, DCF, earnings, burn/runway, SaaS metrics | ⑲ FINANCE |
| as CEO/CFO, founder advice, board deck, M&A, should I hire/raise/pivot | ⑳ EXECUTIVE ADVISORY |
| idea / business planning ("I have an idea", "plan a business") | ✦ NEXUS (meta-conductor) |

> Adapt this table to the orchestras and triggers you define in your own
> `~/.claude/rules/orchestra-system.md`.

## Principles
- **Always announce** — visibility is the point.
- **Stack, don't force-fit** — a compound request gets multiple orchestras.
- **Reserve Bench never auto-fires** — only by explicit name.
