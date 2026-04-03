# Product One-Shot Blueprint v5.0

> **Purpose**: Hand this file + ANY product idea (SaaS, tool, API, extension, marketplace, CLI, mobile app, template) to a Claude Code session. Claude researches, validates viability, then builds the entire product end-to-end using the best skills and MCP tools at each step. Kills bad ideas early to save your tokens.
>
> **157 MCP tools** across 12 connected servers. **80+ skills** available. **Squad multi-agent architecture**. **Every phase mapped** to the right tool and specialist skill.

---

## Compact Execution Checklist (Claude: Use This As Your North Star)

> **READ THIS FIRST.** This is your 50-line roadmap. Read the FULL phase details
> only when you reach that phase. Do NOT try to hold the entire 2500-line plan in memory.

```
PRE    → Create .squad/ directory (team.md, routing.md, decisions.md, agent charters)
PH-0   → Ask ALL 28 questions. Wait for answers. Create CLAUDE.md. Go autonomous.
PH-1   → /brainstorming + WebSearch + Browserbase → IDEA-BRIEF.md
PH-2   → WebSearch + Browserbase extract → MARKET-RESEARCH.md
PH-3   → Competitor scraping + feature matrix → COMPETITOR-ANALYSIS.md
GATE   → ⚠️ VIABILITY GATE: Score 7 dimensions (1-10). GO (50+) / PIVOT (35-49) / KILL (<35)
         → AI-era longevity check. Product type classification. STOP if KILL.
         → THIS IS THE ONLY PHASE WHERE CLAUDE MUST WAIT FOR USER "GO" SIGNAL
PH-3.5 → Compliance check: India fit? → Country matrix → Payment strategy → COMPLIANCE-STRATEGY.md
PH-4   → /writing-plans + PRD + user stories → PRD.md
PH-5   → Pricing tiers + unit economics → BUSINESS-MODEL.md
PH-6   → Tech stack + DB schema + Supabase migrations → ARCHITECTURE.md
PH-7   → /brand-architect (autonomous) → brand-bible.md + brand-tokens.css + tailwind.config.brand.js
PH-8   → /enhance-prompt → Stitch screens → /stitch-loop → /design-md → DESIGN.md + SITE.md
PH-9   → Scaffold Next.js + install deps + wire integrations + git init
PH-10  → Squad fan-out: Frontend+Backend+Payments+Tester in parallel → core features built
PH-11  → Playwright E2E + Browserbase visual + Supabase advisors → all tests pass
PH-11.5→ Quality audit: ALL agents audit in parallel → fix everything
PH-12  → Vercel deploy + Cloudflare DNS + legal pages + launch assets
PH-13  → PostHog + SEO + content + Canva + ads skills → marketing live
PH-14  → BetterStack + Axiom + Upstash + /loop monitoring

DELIVERABLES (Claude must produce ALL of these):
[ ] IDEA-BRIEF.md           [ ] MARKET-RESEARCH.md      [ ] COMPETITOR-ANALYSIS.md
[ ] VIABILITY-REPORT.md (GO/PIVOT/KILL — must get user "GO" before continuing)
[ ] COMPLIANCE-STRATEGY.md  [ ] PRD.md                  [ ] BUSINESS-MODEL.md
[ ] ARCHITECTURE.md         [ ] brand-bible.md          [ ] brand-tokens.css
[ ] tailwind.config.brand.js [ ] design-tokens.json     [ ] DESIGN.md + SITE.md
[ ] CLAUDE.md (project rules)[ ] .squad/ directory       [ ] Working deployed app
[ ] README.md               [ ] Legal pages (per-country)[ ] Launch copy (PH, HN, Reddit)

WHEN STUCK: Check .squad/decisions.md for past decisions.
WHEN FAILED: Log error → try fallback (see "Error Recovery" section) → continue.
WHEN BLOCKED: Batch blockers → ask user ONCE → continue.
```

---

## How To Use This Document

```
1. Create a new project folder: mkdir ~/projects/my-saas && cd ~/projects/my-saas
2. Start Claude Code in it: claude --dangerously-skip-permissions
3. Paste this EXACT prompt:

   "Read ~/docs/SAAS-ONE-SHOT-PLAN.md and execute it for this idea: [YOUR IDEA].
    Start with Phase 0 — ask me ALL questions you need before building.
    After I answer, go fully autonomous until you hit a blocker that
    ONLY I can resolve (like API keys). Batch those blockers too."

4. Claude will ask you 15-25 questions covering every phase
5. You answer them all in one message
6. Claude goes fully autonomous — researches, designs, builds, tests, deploys
7. Claude pauses ONLY for things it literally cannot do (API keys, domain DNS, legal review)
```

### What Claude Will Ask You Upfront (Phase 0)

Claude MUST collect ALL of the following before starting autonomous work:

**IDEA & MARKET:**
1. What is your SaaS idea? (1-2 sentences)
2. Who is the target user? (job title, company size, pain frequency)
3. India-first or global-first? Or both simultaneously?
4. Which countries to target? (default: India → US → EU)
5. Any competitors you already know about?
6. Pricing intuition? (cheap, mid-range, premium)

**PRODUCT:**
7. Core feature — the ONE thing it must do? (not a feature list, THE feature)
8. Does it need AI features? (if yes, what kind)
9. Does it need real-time/collaboration features?
10. Does it need a mobile app or web-only?
11. Any integrations required? (Slack, email, calendar, etc.)

**BRAND (for /brand-architect skill — Phase 7):**
12. How should the brand FEEL? (e.g., "premium but approachable", "playful but credible")
13. If your brand was a person at a dinner party — who are they? How do they dress, talk?
14. Any brands/websites whose visual style you admire? Any you hate?
15. Color preferences? (warm/cool/neutral, dark/light mode preference)
16. Product name decided? Or should Claude suggest names?

**BUSINESS:**
17. Freemium or paid-only? Trial period?
18. Target pricing range? (e.g., ₹499/mo India, $29/mo US)
19. B2B or B2C or both?

**TECHNICAL (provide if you have them, skip if not yet):**
20. Do you have a Supabase project? → URL + keys
21. Do you have Razorpay keys? → Key ID + Secret
22. Do you have a Paddle account? → API key (for global)
23. Do you have Vercel connected? → yes/no
24. Do you have a domain name? → which one
25. Do you have Resend, PostHog, Sentry, Inngest keys?

**COMPLIANCE (answer what you know):**
26. Is your Pvt Ltd registered? GST? IEC? LUT filed?
27. Any industry-specific regulations? (fintech, health, education)
28. Languages needed at launch? (English only? Hindi+English?)

After collecting answers, Claude creates a CLAUDE.md in the project folder
with all decisions, then goes autonomous through all 14 phases.

---

## First-Run Setup Script

> Run this ONCE to install everything. After this, you're ready to one-shot any SaaS.

```bash
#!/bin/bash
# Save as ~/setup-saas-pipeline.sh and run: bash ~/setup-saas-pipeline.sh

echo "=== Installing Tier 1 MCP Servers ==="
claude mcp add playwright -- npx @playwright/mcp@latest
claude mcp add github-mcp-server -- npx github-mcp-server
claude mcp add cloudflare -- npx @anthropic-ai/mcp-remote https://mcp.cloudflare.com/sse

echo "=== Installing Skills (Official Vendor) ==="
npx skills add vercel-labs/next-skills --all -y -g
npx skills add vercel-labs/agent-skills --skill react-best-practices -y -g
npx skills add stripe/ai --skill stripe-best-practices -y -g
npx skills add better-auth/skills --all -y -g
npx skills add supabase/agent-skills --all -y -g
npx skills add addyosmani/web-quality-skills
npx skills add cloudflare/skills --skill web-perf -y -g
npx skills add cloudflare/skills --skill wrangler -y -g
npx skills add cloudflare/skills --skill workers-best-practices -y -g

echo "=== Installing Skills (Community — High Value) ==="
git clone https://github.com/huifer/claude-code-seo.git ~/.claude/skills/claude-seo-assistant 2>/dev/null
git clone https://github.com/snapsynapse/skill-a11y-audit.git ~/.claude/skills/skill-a11y-audit 2>/dev/null
git clone https://github.com/framix-team/skill-email-html-mjml.git ~/.claude/skills/skill-email-html-mjml 2>/dev/null
git clone https://github.com/OpenAEC-Foundation/Docker-Claude-Skill-Package.git ~/.claude/skills/docker 2>/dev/null
git clone https://github.com/Schoepplake/framer-motion-skill.git ~/.claude/skills/framer-motion 2>/dev/null
git clone https://github.com/wsimmonds/claude-nextjs-skills.git ~/.claude/skills/nextjs-skills 2>/dev/null

echo "=== Done! Create accounts and get API keys for: ==="
echo "  Supabase:  supabase.com"
echo "  Razorpay:  razorpay.com"
echo "  Paddle:    paddle.com"
echo "  Vercel:    vercel.com"
echo "  Resend:    resend.com"
echo "  PostHog:   posthog.com"
echo "  Sentry:    sentry.io"
echo "  Inngest:   inngest.com"
echo ""
echo "Then run:"
echo "  mkdir ~/projects/my-saas && cd ~/projects/my-saas"
echo "  claude --dangerously-skip-permissions"
echo '  Paste: "Read ~/docs/SAAS-ONE-SHOT-PLAN.md and execute it for this idea: [YOUR IDEA]"'
```

---

## MCP Setup (Run Before Starting)

### Already Connected (12 servers, 157 tools):
Stitch (12), Pencil.dev (15), Supabase (20), Vercel (18), Notion (14), Figma (15),
21st.dev Magic (4), Context7 (2), Browserbase/Stagehand (8), Canva (27),
Sequential Thinking (1), Zerodha Kite (24)

### Tier 1 — Install Before Starting:
```bash
# E2E Testing (29,700+ stars — most popular MCP server)
claude mcp add playwright -- npx @playwright/mcp@latest

# Payments — Stripe MCP (25 tools, use ONLY if you have Stripe/US entity)
# claude mcp add stripe --transport http https://mcp.stripe.com
# NOTE: For India-based companies, use Razorpay (no MCP yet) + Paddle MoR
# Razorpay integration is done via npm package, not MCP

# Version Control (28,000+ stars)
claude mcp add github-mcp-server -- npx github-mcp-server

# DNS/CDN/Workers (3,500+ stars — 2,500 API endpoints in ~1,000 tokens)
claude mcp add cloudflare -- npx @anthropic-ai/mcp-remote https://mcp.cloudflare.com/sse

# Transactional Email (official)
# See resend.com/mcp for setup instructions

# Error Monitoring (official — 19 tools + AI fix suggestions)
# See docs.sentry.io/ai/mcp/ for setup
```

### Tier 2 — Add When You Reach the Relevant Phase:
```bash
# Product Analytics + Feature Flags (Phase 11-13)
# See posthog.com/docs/model-context-protocol

# Serverless Redis — caching, rate limiting (Phase 14)
# See github.com/upstash/mcp-server

# Uptime Monitoring + Status Pages (Phase 14)
# See betterstack.com/docs/getting-started/integrations/mcp/

# Log Analysis + Tracing (Phase 14)
# See github.com/axiomhq/mcp

# Headless CMS for blog/docs (Phase 13)
# See sanity.io/docs/ai/mcp-server

# Auth SDK snippets (Phase 9 — if using Clerk)
# See clerk.com/changelog/2026-01-20-clerk-mcp-server
```

### Skills to Install (Run Before Starting):
```bash
# === TOP PRIORITY — Official vendor skills ===

# Next.js best practices (Vercel Labs official — boosted eval pass rates 32% → 76%)
npx skills add vercel-labs/next-skills --all -y -g
npx skills add vercel-labs/agent-skills --skill react-best-practices -y -g

# Stripe payment integration (Stripe official — even if using Razorpay,
# patterns apply to payment integration in general)
npx skills add stripe/ai --skill stripe-best-practices -y -g

# Better-Auth setup (official — 7 skills: create-auth, emailAndPassword,
# organization, twoFactor, providers, explain-error, best-practices)
npx skills add better-auth/skills --all -y -g

# Supabase PostgreSQL best practices (official)
npx skills add supabase/agent-skills --all -y -g

# Web quality: Lighthouse, Core Web Vitals, SEO, a11y (Addy Osmani)
npx skills add addyosmani/web-quality-skills

# Cloudflare Workers/KV/R2 (official)
npx skills add cloudflare/skills --skill web-perf -y -g
npx skills add cloudflare/skills --skill wrangler -y -g
npx skills add cloudflare/skills --skill workers-best-practices -y -g

# === HIGH VALUE — SaaS pipeline essentials ===

# SEO optimization (100-point scoring, 27+ commands, E-E-A-T)
git clone https://github.com/huifer/claude-code-seo.git ~/.claude/skills/claude-seo-assistant

# Accessibility auditing (WCAG 2.1 AA, axe-core, Lighthouse a11y)
git clone https://github.com/snapsynapse/skill-a11y-audit.git ~/.claude/skills/skill-a11y-audit

# Email templates (MJML — cross-client, Outlook-safe, WCAG AA)
git clone https://github.com/framix-team/skill-email-html-mjml.git ~/.claude/skills/skill-email-html-mjml

# Docker containerization (22 deterministic skills)
git clone https://github.com/OpenAEC-Foundation/Docker-Claude-Skill-Package.git ~/.claude/skills/docker

# GRC Compliance (GDPR, SOC2, HIPAA, PCI DSS — 94% eval score)
# Install: /plugin marketplace add Sushegaad/Claude-Skills-Governance-Risk-and-Compliance

# Framer Motion animations
git clone https://github.com/Schoepplake/framer-motion-skill.git ~/.claude/skills/framer-motion

# Next.js specific skills (App Router, routing, server/client components)
git clone https://github.com/wsimmonds/claude-nextjs-skills.git ~/.claude/skills/nextjs-skills

# === NICE TO HAVE ===

# i18n expert (framework-agnostic, locale parity validation)
# claude plugin install i18n-expert@daymade-skills

# Documentation pipeline (API specs, component docs, ADRs)
# /plugin add levnikolaevich/claude-code-skills --plugin documentation-pipeline

# Terraform (if using IaC)
# npx skills add https://github.com/hashicorp/terraform-ai-skills

# Real-time analytics (Tinybird)
# npx skills add https://github.com/tinybirdco/agent-skills
```

### Tier 3 — Optional MCP Servers:
```bash
# Serverless Postgres with branch-based migrations (if not using Supabase)
# See neon.tech MCP docs

# Docker MCP Toolkit (300+ containerized MCP servers)
# See docker.com/blog/add-mcp-servers-to-claude-code-with-mcp-toolkit

# AI UI Generation (community v0.dev MCP)
# See github.com/hellolucky/v0-mcp

# Reactive Backend (beta)
# npx convex@latest mcp start
```

---

## Pre-Phase: Squad Setup (Multi-Agent Architecture)

Before Phase 0, Claude sets up a **Squad-inspired multi-agent team** in the project.
Based on [bradygaster/squad](https://github.com/bradygaster/squad) patterns — adapted for Claude Code.

```
INSTRUCTIONS FOR CLAUDE:
1. Create .squad/ directory with this structure:

   .squad/
   ├── team.md              # Roster: who's on the team (10 agents)
   ├── routing.md           # Work routing rules (which agent handles what)
   ├── decisions.md         # Shared brain (all architectural decisions go here)
   ├── decisions/inbox/     # Drop-box for parallel agent writes
   ├── agents/
   │   ├── lead/
   │   │   └── charter.md   # Lead: architecture, PRD, routing (DISPATCHER ONLY)
   │   ├── designer/
   │   │   └── charter.md   # Designer: brand-architect, Stitch, UX research
   │   │                    # Skills: brand-architect, design-ui-designer,
   │   │                    # design-ux-architect, design-ux-researcher,
   │   │                    # design-brand-guardian, design-image-prompt-engineer,
   │   │                    # design-whimsy-injector, enhance-prompt, stitch-loop
   │   ├── frontend/
   │   │   └── charter.md   # Frontend: React, components, Stitch→React
   │   │                    # Skills: engineering-frontend-developer, frontend-design,
   │   │                    # react-components, shadcn-ui, engineering-rapid-prototyper
   │   ├── backend/
   │   │   └── charter.md   # Backend: Supabase, API, Drizzle, auth, Inngest
   │   │                    # Skills: engineering-backend-architect,
   │   │                    # engineering-database-optimizer, engineering-software-architect
   │   ├── payments/
   │   │   └── charter.md   # Payments: Razorpay, Paddle, billing, subscriptions
   │   ├── tester/
   │   │   └── charter.md   # Tester: Playwright E2E, visual tests, TDD
   │   │                    # Skills: test-driven-development, systematic-debugging,
   │   │                    # verification-before-completion, Playwright MCP
   │   ├── security/
   │   │   └── charter.md   # Security: threat model, vuln scan, secure code
   │   │                    # Skills: engineering-security-engineer, Supabase advisors
   │   ├── reviewer/
   │   │   └── charter.md   # Reviewer: code review, quality, simplify
   │   │                    # Skills: engineering-code-reviewer, simplify
   │   ├── devops/
   │   │   └── charter.md   # DevOps: CI/CD, deploy, monitoring, SRE
   │   │                    # Skills: engineering-devops-automator, engineering-sre
   │   ├── writer/
   │   │   └── charter.md   # Writer: docs, README, API docs, in-app copy
   │   │                    # Skills: engineering-technical-writer
   │   └── scribe/
   │       └── charter.md   # Scribe: logs decisions, maintains context (SILENT)
   └── log/                 # Session history

2. KEY PATTERNS FROM SQUAD:

   DECISIONS.MD = SHARED BRAIN:
   - Every architectural decision gets appended to .squad/decisions.md
   - All agents read this file before starting work
   - Format: "## [DECISION] {title}\n{rationale}\n{date}"
   - When user says "always/never/from now on" → capture as permanent directive

   CHARTER-BASED SPECIALIZATION:
   - Each agent has a charter defining: expertise, boundaries, style
   - Agents NEVER work outside their charter
   - Lead agent is DISPATCHER only — never writes code itself

   ROUTING:
   - Simple requests → Lead answers directly
   - Single-domain work → Route to one specialist
   - Multi-domain work → Fan out to multiple agents in parallel
   - Code review → DIFFERENT agent reviews (never self-review)

   PARALLEL EXECUTION:
   - Use /superpowers:dispatching-parallel-agents
   - Frontend + Backend + Payments can work simultaneously
   - Tester writes test cases FROM spec while others implement
   - Scribe logs everything in background

3. MAPPING SQUAD TO CLAUDE CODE:

   Squad Agent    → Claude Code Equivalent
   ─────────────────────────────────────────
   Lead           → Main Claude session (orchestrator)
   Frontend Dev   → Subagent with frontend-design skill
   Backend Dev    → Subagent with Supabase MCP access
   Payments Dev   → Subagent with Razorpay/Paddle integration
   Tester         → Subagent with Playwright MCP
   Designer       → Subagent with brand-architect + Stitch
   Scribe         → Automatic: append to .squad/decisions.md after each step

4. After setting up .squad/, proceed to Phase 0 questions.
```

**Why this matters**: Without Squad patterns, Claude works as a single brain switching contexts. WITH Squad patterns, each subagent has a focused charter, shared context via decisions.md, and routing rules that prevent duplication. Knowledge compounds across sessions — clone the repo and you get the team.

### Squad Agent ↔ Skill Mapping

Each Squad agent invokes SPECIFIC specialist skills. This is the complete mapping:

```
DESIGNER agent:
├── /brand-architect           → Full brand identity (Phase 7)
├── /design-ui-designer        → Pixel-perfect UI, component library
├── /design-ux-architect       → CSS systems, implementation guidance
├── /design-ux-researcher      → User behavior analysis, usability insights
├── /design-brand-guardian     → Brand consistency enforcement
├── /design-image-prompt-engineer → AI image generation prompts
├── /design-inclusive-visuals-specialist → Defeat AI biases in imagery
├── /design-visual-storyteller → Visual narratives, multimedia content
├── /design-whimsy-injector    → Personality, delight, playful elements
├── /design-md                 → Design system documentation
├── /enhance-prompt            → Stitch-optimized prompts
├── /stitch-loop               → Iterative screen generation
├── /framer-motion             → Animation patterns (NEW)
└── /remotion                  → Walkthrough videos

FRONTEND agent:
├── /engineering-frontend-developer → React, UI implementation, performance
├── /frontend-design           → Production-grade custom UI
├── /react-components          → Stitch → React conversion
├── /shadcn-ui                 → shadcn/ui integration
├── /engineering-rapid-prototyper → Fast MVP/prototype code
├── /next-best-practices       → Next.js App Router patterns (NEW - Vercel official)
├── /next-cache-components     → Caching/PPR strategies (NEW)
├── /react-best-practices      → React composition patterns (NEW)
├── /nextjs-skills             → Server/client components, routing (NEW)
└── /web-quality-skills        → Lighthouse, Core Web Vitals (NEW - Addy Osmani)

BACKEND agent:
├── /engineering-backend-architect → Scalable system design, APIs
├── /engineering-database-optimizer → Schema design, query optimization, indexing
├── /engineering-software-architect → System design, DDD, architectural patterns
├── /engineering-ai-engineer   → AI/ML features (if SaaS has AI)
├── /postgres-best-practices   → Supabase PostgreSQL patterns (NEW - official)
├── /better-auth skills        → Auth setup: create-auth, 2FA, orgs (NEW - official)
├── /claude-api                → Claude API integration (if needed)
└── /skill-email-html-mjml     → Email templates MJML (NEW)

PAYMENTS agent:
├── /stripe-best-practices     → Payment integration patterns (NEW - Stripe official)
│   (patterns apply to Razorpay/Paddle too — API design, webhooks, idempotency)
└── Payment adapter pattern from this plan

TESTER agent:
├── /superpowers:test-driven-development → Red-green-refactor
├── /superpowers:systematic-debugging → Root cause analysis
├── /superpowers:verification-before-completion → Evidence before claims
├── /skill-a11y-audit          → WCAG 2.1 AA auditing with axe-core (NEW)
├── /web-quality-skills        → Lighthouse scoring (NEW)
├── Playwright MCP + Browserbase MCP
└── /webapp-testing            → Anthropic official Playwright testing (NEW)

SECURITY agent:
├── /engineering-security-engineer → Threat modeling, vuln assessment, secure code
├── Supabase get_advisors(type="security")
├── /gdpr-compliance           → GDPR audit, DPIAs, DPAs, privacy notices (NEW - GRC)
├── /soc2-compliance           → SOC 2 gap assessments, evidence checklists (NEW - GRC)
└── npm audit + dependency scanning

REVIEWER agent:
├── /engineering-code-reviewer → Correctness, maintainability, security review
├── /superpowers:requesting-code-review → Self-review checklist
├── /simplify → Code reuse and efficiency
└── /strict-typescript-mode    → Type safety enforcement (NEW)

DEVOPS agent:
├── /engineering-devops-automator → CI/CD, infrastructure automation
├── /engineering-sre            → SLOs, error budgets, observability
├── /docker-skills              → Docker/Compose, multi-stage builds (NEW)
├── /cloudflare-wrangler        → Workers, KV, R2, D1 (NEW - official)
├── Vercel MCP + Cloudflare MCP + GitHub MCP
└── /terraform (optional)       → IaC if needed (NEW - HashiCorp official)

WRITER agent:
├── /engineering-technical-writer → API docs, README, tutorials
├── brand-architect voice guidelines for in-app copy
├── /claude-seo-assistant      → SEO: 100-point scoring, E-E-A-T (NEW)
└── /documentation-pipeline    → Full docs in one command (NEW)

SEO agent (NEW — add to Squad):
├── /claude-seo-assistant      → Technical SEO, structured data, meta tags
├── /web-quality-skills        → SEO scoring via Lighthouse
└── WebSearch for keyword research

i18n agent (NEW — add to Squad):
├── /i18n-expert               → Replace hardcoded strings, locale parity (NEW)
├── next-intl configuration
└── Translation file generation (Claude auto-generates, Crowdin for review)

LEAD agent (orchestrator):
├── /superpowers:brainstorming → Idea exploration
├── /superpowers:writing-plans → Task breakdown
├── /superpowers:executing-plans → Plan execution
├── /superpowers:subagent-driven-development → Agent dispatch
├── /superpowers:dispatching-parallel-agents → Parallel work
├── /superpowers:using-git-worktrees → Branch isolation
└── /superpowers:finishing-a-development-branch → Merge strategy
```

---

## Phase 0: Question Collection & Session Setup

**What happens**: Claude reads this plan, asks ALL questions upfront, then goes autonomous.

```
INSTRUCTIONS FOR CLAUDE:
1. Read this ENTIRE document first (all 2000+ lines)
2. Ask the user ALL questions listed in "What Claude Will Ask You Upfront" above
   - Present them as a numbered list in ONE message
   - Group by category (Idea, Product, Business, Technical, Compliance)
   - Mark which ones are optional vs required
   - If the user already provided some answers in their initial prompt, skip those
3. WAIT for the user to answer everything in one message
4. After receiving answers, DO NOT ask more questions. Instead:

   a. Create CLAUDE.md in the project root with ALL decisions:
      - Product definition, target market, pricing model
      - Tech stack choices, payment gateway decision
      - Compliance requirements per target country
      - Brand/design preferences
      - API keys and service connections

   b. Create TaskCreate checklist for all 14 phases

   c. Invoke /superpowers:brainstorming to refine the idea INTERNALLY
      (use the user's answers, don't ask more questions)

   d. Create a Notion project hub (if Notion MCP is connected)

5. Create CLAUDE.md in project root using this template:

   ```markdown
   # CLAUDE.md — Project Rules (Auto-generated by Phase 0)

   ## Product
   - Name: {from Q16/Q22}
   - One-liner: {from Q1}
   - Core feature: {from Q7}
   - Target user: {from Q2}
   - Markets: {from Q3-4} (India-first: yes/no)

   ## Stack
   - Framework: Next.js 15+ (App Router) + TypeScript + Tailwind v4
   - UI: shadcn/ui + Framer Motion
   - ORM: Drizzle ORM
   - Database: Supabase (Postgres + RLS)
   - Auth: Better-Auth (RBAC, orgs, 2FA)
   - Payments India: Razorpay
   - Payments Global: Paddle MoR (or Razorpay Intl)
   - Email: Resend + React Email
   - Background Jobs: Inngest
   - i18n: next-intl
   - Analytics: PostHog
   - Errors: Sentry
   - Hosting: Vercel
   - CDN: Cloudflare

   ## Rules (ABSOLUTE — Claude MUST follow)
   - MUST use Razorpay for Indian payments (NOT Stripe)
   - MUST store payment data in India (RBI requirement)
   - MUST implement RLS on ALL Supabase tables
   - MUST use brand-tokens.css for ALL colors/fonts (no hardcoded values)
   - MUST put all user-facing strings in next-intl translation files
   - MUST log all decisions to .squad/decisions.md
   - MUST run /verification-before-completion before claiming anything works
   - MUST NOT expose API keys in client-side code
   - MUST NOT use `any` type in TypeScript
   - MUST NOT skip tests for critical paths (auth, payments, core CRUD)
   - MUST NOT ask the user questions after Phase 0 (make decisions, log them)

   ## API Keys
   SUPABASE_URL={provided}
   SUPABASE_ANON_KEY={provided}
   RAZORPAY_KEY_ID={provided}
   ... (all keys from user's Phase 0 answers)

   ## Brand
   - Feel: {from Q12}
   - Personality: {from Q13}
   - Visual affinities: {from Q14}
   - Colors: {from Q15}

   ## Compliance
   - Entity: Indian Pvt Ltd (registered: yes/no)
   - GST: {status}
   - Target countries: {from Q3-4}
   - Regulations: DPDPA (India), {others based on target countries}
   ```

6. Then GO FULLY AUTONOMOUS through Phase 1 → Phase 14
   - Do NOT stop to ask questions between phases
   - Only pause if you literally cannot proceed without human action:
     * API key not provided and needed NOW
     * Domain DNS configuration (only human can do this)
     * Legal document review before publishing
     * Payment gateway dashboard action needed
   - When you hit a blocker, BATCH blockers together — don't stop for each one
   - Give a progress update at the end of each phase (1 line, not a summary)

6. AUTONOMY RULES:
   - Make decisions yourself based on user's answers. Don't ask "should I use X or Y?"
   - If something is ambiguous, pick the better default and note it in CLAUDE.md
   - Use the recommended tools/skills for each phase as specified in this plan
   - If a tool/MCP fails, use the fallback approach — don't stop to report it
   - Run parallel subagents wherever possible (Phase 10 especially)
   - Commit code regularly with descriptive messages
```

**Skills**: `superpowers:brainstorming`, `codebase-context-mapper`
**Tools**: `TaskCreate`, `mcp__sequential-thinking__sequentialthinking`, `Notion`

---

## Phase 1: Idea Discovery & Brainstorming

### Goal: Transform a vague idea into a crisp, validated concept

**Skill**: `superpowers:brainstorming`

```
INSTRUCTIONS FOR CLAUDE:
1. Invoke /superpowers:brainstorming skill
2. Explore the idea through structured brainstorming:
   - What specific pain point does this solve?
   - Who experiences this pain? (job title, company size, context)
   - How often does the pain occur?
   - What do people currently do about it? (workarounds, competitors)
   - Why would someone pay for this?
3. Use WebSearch to validate:
   - Search Reddit, X, Indie Hackers, Product Hunt for pain point validation
   - Search G2/Capterra for competitor reviews
4. Use Browserbase/Stagehand for deeper research:
   - Navigate to competitor sites and extract feature lists
   - Extract pricing information from competitor pages
   - Screenshot competitor UIs for reference
5. Output a structured "Idea Validation Brief"
```

**Tools**:
| Tool | Purpose |
|------|---------|
| `WebSearch` | Search communities for pain point validation |
| `Browserbase` (`stagehand_navigate`, `stagehand_extract`) | Scrape competitor sites, extract features/pricing |
| `Browserbase` (`browserbase_screenshot`) | Screenshot competitor UIs |
| `Notion` (`notion-create-pages`) | Create "Idea Validation Brief" page |
| `Sequential Thinking` | Structure complex market analysis |

**Deliverable**: `IDEA-BRIEF.md` — problem statement, target persona, existing solutions & gaps, confidence score

---

## Phase 2: Market & Problem Research

### Goal: Quantify the opportunity and deeply understand the user

```
INSTRUCTIONS FOR CLAUDE:
1. Use WebSearch extensively:
   - TAM/SAM/SOM estimation
   - Growth trends, pricing benchmarks
   - User demographics and behavior
2. Use Browserbase/Stagehand to:
   - Navigate to G2, Capterra, Trustpilot and extract competitor reviews
   - Extract pricing tables from competitor websites
3. Create user interview question templates
4. Build a competitive landscape map
```

**Tools**:
| Tool | Purpose |
|------|---------|
| `WebSearch` | Market size, trends, pricing benchmarks |
| `Browserbase` (`stagehand_extract`) | Extract review data, pricing tables |
| `Notion` (`notion-create-database`) | Competitor tracking database |
| `Notion` (`notion-create-pages`) | Market analysis docs, interview templates |

**Deliverable**: `MARKET-RESEARCH.md` — TAM/SAM/SOM, top competitors, interview template, trends

---

## Phase 3: Competitor Analysis

### Goal: Find the gap you can own

```
INSTRUCTIONS FOR CLAUDE:
1. For each competitor identified:
   - Use Browserbase to navigate their site, extract features, pricing, positioning
   - WebSearch their G2/Capterra reviews (filter 1-3 star for pain points)
   - Extract their changelog for feature trajectory
2. Build feature comparison matrix
3. Identify the #1 gap: what are users consistently complaining about?
4. Define positioning: cheaper, simpler, more powerful, or niche-specific
```

**Tools**:
| Tool | Purpose |
|------|---------|
| `WebSearch` | Review mining, feature research |
| `Browserbase` (`stagehand_navigate`, `stagehand_extract`, `browserbase_screenshot`) | Deep competitor analysis |
| `Notion` (`notion-create-database`) | Feature comparison matrix |
| `WebFetch` | Scrape landing pages |

**Deliverable**: `COMPETITOR-ANALYSIS.md` — feature matrix, pricing comparison, gap analysis, positioning statement

---

## VIABILITY GATE (GO / PIVOT / KILL) — Mandatory Checkpoint

> **THIS IS THE MOST IMPORTANT PHASE.** Everything before this costs ~10% of tokens.
> Everything after costs ~90%. DO NOT proceed without a clear GO signal.
> Claude MUST be BRUTALLY HONEST here — the user wants truth, not encouragement.

### Goal: Determine if this idea is worth spending 90% of tokens to build

```
INSTRUCTIONS FOR CLAUDE:
1. Use Sequential Thinking MCP for structured analysis
2. Based on Phase 1-3 research, score the idea on these 7 dimensions:

   ┌─────────────────────────────────────────────────────────────────┐
   │  VIABILITY SCORECARD (score each 1-10, be BRUTALLY honest)     │
   │                                                                 │
   │  1. MONEY POTENTIAL                                    [ /10]  │
   │     - Are people ALREADY paying for solutions? (not "would they")│
   │     - What's the realistic MRR in 12 months?                    │
   │     - Is the willingness-to-pay proven or assumed?              │
   │     - Can you charge enough to cover costs?                     │
   │                                                                 │
   │  2. AI-ERA LONGEVITY                                   [ /10]  │
   │     - Will AI make this obsolete in 6-18 months?               │
   │     - Is this a "wrapper" around an AI API? (fragile)          │
   │     - Does it have a data moat? Network effects? Switching cost?│
   │     - Would ChatGPT/Claude/Gemini adding a feature kill this?  │
   │     - Is the value in the WORKFLOW, not just the output?       │
   │                                                                 │
   │  3. COMPETITIVE DEFENSIBILITY                          [ /10]  │
   │     - How many competitors exist? Are they funded?              │
   │     - Can a solo dev compete or does it need a team?           │
   │     - Is there a unique angle that's hard to copy?             │
   │     - Time to clone by a competitor?                           │
   │                                                                 │
   │  4. MARKET TIMING                                      [ /10]  │
   │     - Is the market growing, stable, or shrinking?             │
   │     - Are you early (good), on time (ok), or late (bad)?      │
   │     - Any regulatory/technology tailwind?                      │
   │                                                                 │
   │  5. EXECUTION FEASIBILITY                              [ /10]  │
   │     - Can a solo founder + AI build this?                      │
   │     - Does it need special data, partnerships, or licenses?    │
   │     - Time to MVP: days (great), weeks (ok), months (risky)   │
   │     - Does it need critical mass / chicken-and-egg dynamics?   │
   │                                                                 │
   │  6. FOUNDER-MARKET FIT                                 [ /10]  │
   │     - Does the user have domain expertise here?                │
   │     - Would they use this product themselves?                  │
   │     - Can they reach the target audience?                      │
   │                                                                 │
   │  7. INDIA MARKET FIT                                   [ /10]  │
   │     - Does this product make sense for India?                  │
   │     - Can Indian users afford it? (PPP consideration)          │
   │     - India-specific pain point or global problem?             │
   │     - Can Indian users be early adopters / case studies?       │
   │                                                                 │
   │  TOTAL SCORE:                                          [ /70]  │
   └─────────────────────────────────────────────────────────────────┘

3. AI-ERA KILL SIGNALS (if ANY of these are true → score AI Longevity as 2/10):
   - Product is just a UI wrapper around a single AI API call
   - Core value is "AI does X for you" with no workflow/data layer
   - ChatGPT/Claude plugins could replace this in a weekend
   - No user data accumulates over time (no compounding value)
   - The "moat" is just "we were first" (that's not a moat)

4. AI-ERA SURVIVAL SIGNALS (these make a product DURABLE):
   - Integrates with user's existing tools/data (sticky)
   - Network effects (more users = more value for each user)
   - Proprietary data that improves over time
   - Workflow automation, not just AI output
   - Compliance/legal requirements create switching costs
   - Two-sided marketplace dynamics
   - Vertical-specific domain knowledge baked in

5. PRODUCT TYPE CLASSIFICATION:
   Determine what this actually is — it may NOT be a SaaS:

   TYPE               │ MONETIZATION          │ BUILD APPROACH
   ───────────────────┼───────────────────────┼─────────────────────
   Pure SaaS           │ Monthly subscription  │ Full pipeline (all phases)
   Tool/Utility        │ One-time or freemium  │ Skip marketing-heavy phases
   API Product         │ Usage-based pricing   │ Focus on backend + docs
   Marketplace         │ Transaction fee       │ Need supply + demand sides
   Browser Extension   │ Freemium / pro tier   │ Different tech stack
   Mobile App          │ Subscription / IAP    │ React Native or Flutter
   Info Product        │ One-time purchase     │ Content + landing page
   Open Source + Paid  │ Sponsorship / pro tier│ Community-first approach
   Chrome Extension    │ Freemium              │ Manifest V3, different deploy
   WordPress Plugin    │ Freemium / GPL        │ PHP, different ecosystem
   Shopify App         │ Usage-based           │ Shopify API, different review
   CLI Tool            │ Freemium / pro        │ Node/Go binary, no frontend
   Desktop App         │ License / subscription│ Electron/Tauri
   Template/Boilerplate│ One-time purchase     │ Code quality is the product
   Agency Service      │ Project-based         │ Process, not product

   → If NOT pure SaaS, Claude MUST adapt the remaining phases to fit the
     actual product type. Don't force a CLI tool through a "landing page +
     Stitch screens + onboarding flow" pipeline.

6. DECISION:

   SCORE 50-70: GO ✅
   → Proceed to Phase 3.5 and build. This has strong potential.

   SCORE 35-49: CONDITIONAL GO ⚠️
   → Identify the weakest dimension. Can it be fixed?
   → If yes: suggest a PIVOT that fixes the weak dimension and re-score
   → If no: recommend KILL

   SCORE 20-34: PIVOT 🔄
   → The core insight has value but the product form is wrong
   → Suggest 2-3 alternative product forms for the same insight
   → Re-score each alternative
   → If any scores 45+: proceed with that instead

   SCORE <20: KILL ❌
   → Be honest: "This idea is not worth building. Here's why."
   → Suggest what to research next instead
   → DO NOT proceed. Save the user's tokens.

7. PRESENT TO USER:
   Show the full scorecard + reasoning + decision.
   This is the ONE place Claude MUST stop and wait for user confirmation.
   The user must explicitly say "GO" before Claude proceeds.
   If user says "pivot" → brainstorm alternatives and re-score.
   If user says "kill" → end the session, save research as reference.
```

### AI-Era Product Longevity Framework

```
PRODUCTS THAT DIE IN THE AI ERA:
├── "GPT wrapper" — just a UI around OpenAI/Anthropic API
├── "AI writer" — no differentiation from ChatGPT
├── "AI image generator" — competing with Midjourney/DALL-E directly
├── "AI chatbot builder" — every platform has this built-in now
├── "AI summarizer" — browser extensions do this for free
└── Any product where the ENTIRE value is one AI API call

PRODUCTS THAT SURVIVE AND THRIVE:
├── Vertical SaaS with domain data (healthcare scheduling, legal billing)
├── Workflow tools (AI is a feature, not the product)
├── Data platforms (user data compounds, creating a moat)
├── Integration layers (connecting tools people already use)
├── Compliance tools (regulations create switching costs)
├── Two-sided marketplaces (network effects)
├── Developer tools with ecosystem lock-in
├── Products where AI makes existing workflows 10x better (not replaces them)
└── Products that combine AI + human judgment (AI assists, human decides)

THE GOLDEN TEST:
"If OpenAI/Anthropic/Google adds this exact feature to their product tomorrow,
 would my users still use my product?"
If YES → the value is in the workflow/data/integration, not the AI → DURABLE
If NO  → you're building on borrowed time → FRAGILE
```

### Product Type Adaptation

```
INSTRUCTIONS FOR CLAUDE:
If the Viability Gate determines this is NOT a pure SaaS, adapt the pipeline:

FOR TOOLS / UTILITIES:
- Skip: Phase 8 (heavy screen generation), Phase 13 (marketing-heavy)
- Focus: Core functionality, CLI/API, documentation, developer experience
- Monetize: Freemium with pro features, or one-time purchase

FOR API PRODUCTS:
- Skip: Phase 7 (heavy branding), Phase 8 (screen generation)
- Focus: API design, documentation, SDK generation, rate limiting, usage tracking
- Add: OpenAPI spec generation, interactive API docs (Swagger/Redoc)
- Monetize: Usage-based pricing tiers

FOR BROWSER EXTENSIONS:
- Skip: Phase 8 (Stitch screens), Phase 9 (Next.js scaffold)
- Replace: Manifest V3 + Chrome Web Store deployment
- Focus: Popup UI, content scripts, background workers
- Monetize: Freemium + pro tier via Razorpay/Paddle

FOR MARKETPLACES:
- Add: Supply-side onboarding, demand-side acquisition
- Focus: Transaction flow, trust/safety, reviews
- Risk: Chicken-and-egg problem — need both sides
- Monetize: Transaction fee (5-20%)

FOR MOBILE APPS:
- Replace Phase 9: React Native / Expo instead of Next.js
- Add: App Store / Play Store deployment, push notifications
- Focus: Offline capability, native feel
- Monetize: Subscription via App Store / Play Store billing

FOR CLI TOOLS:
- Skip: Phase 7-8 (design), Phase 12 (Vercel deploy)
- Replace: npm publish / Homebrew distribution
- Focus: DX, man pages, --help, error messages
- Monetize: Pro features, team licenses

FOR OPEN SOURCE + PAID:
- Add: GitHub community management, contributing guide, license choice
- Focus: Community-first, then monetize with hosted/pro version
- Monetize: Managed hosting, enterprise features, support

FOR TEMPLATES / BOILERPLATES:
- Skip: Phase 10-14 (no running app needed)
- Focus: Code quality, documentation, demo, marketplace listing
- Monetize: Gumroad/Lemon Squeezy one-time purchase

Claude MUST write to .squad/decisions.md:
"PRODUCT TYPE: [type]. Adapting pipeline phases [X, Y, Z]."
```

**Tools**:
| Tool | Purpose |
|------|---------|
| `Sequential Thinking` | Structured viability analysis |
| `WebSearch` | Verify market claims, check AI disruption trends |
| `Browserbase` | Verify competitor status, pricing, traction |

**Deliverable**: `VIABILITY-REPORT.md` containing:
- Full scorecard with reasoning per dimension
- AI-era longevity assessment
- Product type classification
- GO / PIVOT / KILL decision with rationale
- If PIVOT: 2-3 alternatives with re-scored viability
- If GO: which phases to adapt based on product type

---

## Phase 3.5: Compliance, Feasibility & Market Strategy (India-First)

### Goal: Determine WHERE to launch, WHAT compliance is needed, and HOW to structure for multi-country

> **CRITICAL**: This phase must happen BEFORE product definition. Compliance requirements
> shape features, pricing, and architecture. Skipping this leads to costly rework.

**Skills**: `superpowers:brainstorming`, `Sequential Thinking`

```
INSTRUCTIONS FOR CLAUDE:
1. Invoke /superpowers:brainstorming for market strategy
2. Use Sequential Thinking MCP for complex compliance analysis
3. Evaluate the idea against this decision tree:

   MARKET FIT DECISION TREE:
   ┌─────────────────────────────────────────────────────┐
   │  Does this product fit the Indian market?            │
   │  ├── YES → Build for India FIRST                    │
   │  │   └── Also fits international? → Plan expansion  │
   │  └── NO  → Pick top country with best market fit    │
   │       └── Can you launch there from India? → Check  │
   │            compliance requirements below             │
   └─────────────────────────────────────────────────────┘

4. For India market: Evaluate
   - Is UPI/domestic payment critical? (almost always yes)
   - Price sensitivity (PPP: India is 60-70% cheaper than US)
   - Hindi + English bilingual needs?
   - India-specific regulations for this product category

5. For global expansion: Pick top 3-5 countries by:
   - Market size for this product
   - Competition density
   - Ease of launch from India
   - Payment infrastructure availability
   - Language requirements

6. RECOMMENDED EXPANSION ORDER:
   Phase 1: India (home market, Razorpay, INR)
   Phase 2: US + Canada (Razorpay Intl or Paddle, English, USD)
   Phase 3: UK + EU majors (GDPR compliance, EUR/GBP)
   Phase 4: LATAM (Brazil, Mexico — PPP pricing, Portuguese/Spanish)
   Phase 5: Southeast Asia (heavy PPP, local payment methods)
   Phase 6: Middle East + Africa (RTL support, localization)

7. Use PostHog feature flags for gradual country rollout
```

### India Legal Entity Setup

```
INSTRUCTIONS FOR CLAUDE:
Advise the user on entity structure. Default recommendation:

RECOMMENDED: Private Limited Company (Pvt Ltd)
├── Register with MCA (Ministry of Corporate Affairs)
│   Cost: ~INR 7,000-15,000. Min 2 directors, 2 shareholders.
├── Get PAN & TAN for company
├── Register for GST (mandatory if revenue > ₹20L or selling interstate)
│   SaaS = SAC 998314 ("Online content"). Display GSTIN on invoices.
│   Domestic: 18% GST. Exports: 0% GST (with LUT).
├── Get Import-Export Code (IEC) from DGFT — needed for foreign payments
│   Free. Lifetime validity. Update annually on DGFT portal.
├── File LUT (Letter of Undertaking) — Form GST RFD-11
│   Makes SaaS exports 0% GST (zero-rated supply).
│   File BEFORE first export invoice. Renew before 31 March each year.
│   Requires: FIRC (Foreign Inward Remittance Certificate) from bank.
├── Register on Startup India (DPIIT) — startupindia.gov.in
│   Benefits: 80-IAC tax holiday (3 years), angel tax exemption,
│   self-certification for labor/env laws, fast-track patents.
├── Open current account (HDFC/ICICI/Razorpay X recommended)
├── Open EEFC account (Exchange Earners' Foreign Currency)
│   Retain forex earnings without conversion. Pay AWS/Stripe/SaaS
│   tools directly in USD without double conversion.
├── Register Point of Contact with CERT-In (cybersecurity reporting)
├── File SOFTEX form with STPI for software exports > ₹5 lakh
└── Register for Professional Tax (state-specific, if hiring)

WHY Pvt Ltd over LLP:
- VCs strongly prefer Pvt Ltd (LLP cannot issue shares)
- DPIIT Startup India benefits (tax holidays)
- FDI is automatic route (easier to receive foreign investment)
- Familiar structure for global clients and partners
- Can issue ESOPs to employees

FEMA COMPLIANCE (Foreign Exchange):
- Receiving payment for SaaS exports = automatic route (no RBI approval)
- Must realize forex within 9 months of export date
- Maintain FIRC for every international payment received
- SOFTEX form filing via STPI for software exports

HUMAN REQUIRED:
- [ ] Register Pvt Ltd company (use Razorpay Rize, Vakilsearch, or ClearTax)
- [ ] Get PAN & TAN for company
- [ ] Get GST registration
- [ ] Get IEC (Import Export Code) from DGFT — free, apply at dgft.gov.in
- [ ] File LUT (GST RFD-11) on GST portal — before first export invoice
- [ ] Register on startupindia.gov.in for DPIIT recognition
- [ ] Open current account (HDFC/ICICI/Razorpay X recommended)
- [ ] Open EEFC account at same bank (for holding forex)
- [ ] Register PoC with CERT-In
- [ ] Register with STPI (Software Technology Parks of India) — optional but helpful
- [ ] Engage a CA for GST filing + international tax advisory (INR 50K-2L setup)
```

### Compliance Requirements by Country

```
INSTRUCTIONS FOR CLAUDE:
Based on target markets chosen above, check compliance for each:

INDIA:
├── DPDPA 2023 (Digital Personal Data Protection Act)
│   ├── Consent: free, specific, informed, unconditional, clear affirmative action
│   ├── Must specify: what data, why, how to withdraw, how to complain
│   ├── Data Principal rights: access, correction, erasure, grievance, nominate
│   ├── Children (under 18): verifiable parental consent, NO tracking/behavioral
│   │   monitoring/targeted advertising (stricter than GDPR's age 16)
│   ├── Appoint DPO if "Significant Data Fiduciary" (criteria TBD in Rules)
│   ├── Data breach: notify Data Protection Board "without delay"
│   ├── Cross-border: allowed EXCEPT to countries on govt blacklist (negative list)
│   ├── NO data localization in base act (unlike earlier drafts)
│   ├── Penalties: up to ₹250 crore (~$30M)
│   └── WATCH: DPDP Rules still being finalized — monitor for publication
├── CERT-In Directions (April 2022) — CRITICAL
│   ├── Report ANY cybersecurity incident within 6 HOURS of noticing it
│   │   (unauthorized access, breaches, DDoS, phishing, malware, identity theft)
│   ├── Maintain logs of ALL ICT systems for 180 days (rolling), STORED IN INDIA
│   ├── Designate a Point of Contact (PoC) with CERT-In
│   ├── Synchronize ICT system clocks to NTP servers of NIC or IDRBT
│   └── KYC of customers if cloud/VPN/VPS/data center provider
├── IT Act 2000 + IT Rules 2021
│   ├── Section 43A: "reasonable security practices" (IS/ISO 27001)
│   ├── Section 79: Safe harbor for intermediaries (if user-generated content)
│   ├── Intermediary Guidelines: grievance officer (acknowledge 24h, resolve 15 days)
│   ├── If >50 lakh users: Chief Compliance Officer + Nodal Contact + Resident
│   │   Grievance Officer — ALL must be India residents
│   └── No dark patterns (CCPA guidelines Nov 2023)
├── RBI Guidelines (if handling payments from Indian customers)
│   ├── Payment data MUST be stored ONLY IN INDIA
│   ├── End-to-end transaction details must reside in India
│   ├── Card-on-file tokenization mandatory (no storing raw card numbers)
│   ├── e-mandate guidelines for recurring payments (Razorpay handles this)
│   └── Use Razorpay/Cashfree/Stripe India — they are RBI compliant
├── Consumer Protection (E-Commerce) Rules 2020
│   ├── Display: legal name, registered address, contact info, GSTIN
│   ├── Display total price including all taxes
│   ├── Clear refund/return/exchange policy
│   ├── Grievance Officer: name + contact on website
│   ├── Respond to complaints within 48 hours
│   └── No dark patterns / manipulative UI
└── GST
    ├── Domestic sales: 18% GST (SAC 998314)
    ├── Export sales: 0% GST (with LUT filed + FIRC maintained)
    ├── GSTIN must be displayed on all invoices
    └── Input tax credit available on business expenses

USA:
├── No federal data privacy law (yet)
├── State laws:
│   ├── CCPA/CPRA (California) — opt-out of sale, right to delete
│   ├── Virginia CDPA, Colorado CPA, Connecticut DPA, etc.
│   └── COPPA (children under 13)
├── Sales tax: varies by state, use Stripe Tax or Paddle
├── CAN-SPAM Act (email marketing)
├── ADA compliance (web accessibility)
└── SOC 2 (enterprise customers often require this)

EU (GDPR):
├── Lawful basis for processing (consent, legitimate interest, contract)
├── Privacy policy MUST disclose: controller identity, DPO, purposes, legal bases,
│   retention periods, all data subject rights, transfer safeguards, complaint right
├── Data Protection Impact Assessment (DPIA) for high-risk processing
├── DPO appointment (if large-scale processing of special categories)
├── Rights: access, rectification, erasure, restriction, portability, objection
├── Cookie consent: EXPLICIT OPT-IN (not opt-out). Granular. No pre-ticked boxes.
│   Must be as easy to reject as accept. Use CookieYes/Osano.
├── Data breach notification: 72 hours to supervisory authority
├── Cross-border transfer to India: India has NO EU adequacy decision
│   ├── Use Standard Contractual Clauses (SCCs) — 2021 version
│   ├── Conduct Transfer Impact Assessment
│   ├── Implement supplementary measures (encryption, pseudonymization)
│   └── Include SCCs in your DPA (Data Processing Agreement)
├── EU Representative REQUIRED (Art. 27) — use DataRep or Prighter service
├── Records of Processing Activities (ROPA) must be maintained
├── DPA (Data Processing Agreement) required for B2B customers
├── VAT: collect per customer's country (19-27%). Use OSS or Merchant of Record.
│   B2B with valid VAT number: reverse charge (0% from you).
│   Validate VAT numbers via VIES system.
└── 14-day right of withdrawal for digital services
    Can be waived if consumer explicitly consents to immediate performance
    and acknowledges loss of withdrawal right. BUILD THIS INTO CHECKOUT.

UK (post-Brexit):
├── UK GDPR (similar to EU GDPR)
├── ICO registration
├── UK representative required
└── VAT: 20% on digital services (use VAT MOSS or Paddle)

BRAZIL:
├── LGPD (Lei Geral de Proteção de Dados)
│   ├── Similar to GDPR
│   ├── DPO required
│   └── Cross-border transfer rules
├── Payment methods: PIX, Boleto, credit cards
└── NF-e (electronic invoice) may be required

SINGAPORE:
├── PDPA (Personal Data Protection Act)
├── No data localization requirement
├── Business-friendly, easy to launch from India
└── SGD payments via Stripe

UAE/MIDDLE EAST:
├── DIFC Data Protection Law / ADGM Data Protection Regulations
├── Content restrictions (varies by emirate)
├── Arabic language support expected
├── Local payment gateways may be needed
└── Consider RTL UI support

JAPAN:
├── APPI (Act on the Protection of Personal Information)
├── Strict data transfer rules to foreign countries
├── Japanese language is practically mandatory
├── JCB card support important
└── Konbini payment support valuable

SOUTHEAST ASIA:
├── Indonesia: PDP Law 2022, data localization in discussion
├── Philippines: Data Privacy Act 2012
├── Thailand: PDPA (similar to GDPR)
├── Vietnam: strict data localization requirements
└── Local payment methods critical (GrabPay, GCash, OVO, etc.)
```

### Payment Strategy (India-Based Company)

```
RECOMMENDED PAYMENT ARCHITECTURE:

For INDIA customers:
├── Gateway: Razorpay (primary)
│   ├── UPI (mandatory — 60%+ of digital payments in India)
│   ├── Credit/Debit cards
│   ├── Net banking
│   ├── Wallets (PhonePe, Paytm)
│   ├── EMI options
│   └── Recurring: Razorpay e-mandate (RBI compliant)
├── Pricing: INR with 18% GST
├── Invoicing: GST-compliant invoices (GSTIN, SAC code 998314)
└── Settlement: INR to Indian bank account

For GLOBAL customers (Option A — Easy):
├── Gateway: Paddle (Merchant of Record)
│   ├── Paddle is the legal seller — handles ALL tax globally
│   ├── You never worry about VAT, sales tax, GST
│   ├── Supports 200+ countries
│   ├── Paddle pays you — no tax filing per country
│   └── 5% + $0.50 per transaction
├── Currencies: handled by Paddle
└── Settlement: USD/EUR to your account

For GLOBAL customers (Option B — More control, lower fees):
├── Gateway: Razorpay International
│   ├── Supports 100+ currencies, international cards
│   ├── Settlement in INR to Indian bank account
│   ├── ~3% international transaction fee
│   ├── Same dashboard as domestic — unified management
│   └── You handle tax compliance yourself (or use Paddle for tax)
├── Currencies: multi-currency via Razorpay
└── Settlement: INR to Indian bank account

For GLOBAL customers (Option C — Cashfree alternative):
├── Gateway: Cashfree Global Payments
│   ├── Growing international payment support
│   ├── Competitive pricing, good API
│   ├── Strong payouts/disbursement API (if you pay vendors/creators)
│   └── Settlement in INR
└── Best if you need strong payout capabilities

DECISION GUIDE:
├── Early stage + want simplicity → Razorpay (all) + Paddle (global tax)
├── Scale + want control → Razorpay (domestic + international)
├── India-only for now → Razorpay only
└── Need strong payouts → Cashfree

IMPORTANT — WHY NOT STRIPE:
- Stripe India exists but has FRICTION for cross-border payments from India
- FEMA/RBI regulations complicate international payment collection via Stripe
- Razorpay is built ground-up for Indian regulatory compliance (RBI PA-PG license)
- Razorpay has better UPI, netbanking, wallet support
- For global tax handling: use Paddle/Lemon Squeezy (Merchant of Record)
  instead of Stripe Tax — they handle everything, no Stripe needed
- ONLY consider Stripe if you register a US entity (Stripe Atlas $500)
```

### Multi-Country Architecture (Technical)

```
INSTRUCTIONS FOR CLAUDE:
When building, implement this country configuration system:

1. COUNTRY CONFIG LAYER:
   // config/countries.ts
   export const countryConfig = {
     IN: {
       currency: 'INR',
       locale: 'en-IN',
       languages: ['en', 'hi'],
       paymentGateway: 'razorpay',
       taxRate: 0.18, // GST
       dateFormat: 'dd/MM/yyyy',
       paymentMethods: ['upi', 'card', 'netbanking', 'wallet'],
       legal: { entity: 'YourCompany India Pvt Ltd', gstin: 'REQUIRED' },
       pppDiscount: 0, // Home market, no PPP
     },
     US: {
       currency: 'USD',
       locale: 'en-US',
       languages: ['en'],
       paymentGateway: 'stripe', // or 'paddle'
       taxRate: null, // varies by state, use Stripe Tax
       dateFormat: 'MM/dd/yyyy',
       paymentMethods: ['card', 'ach'],
       legal: { entity: 'YourCompany Inc.' },
       pppDiscount: 0,
     },
     BR: {
       currency: 'BRL',
       locale: 'pt-BR',
       languages: ['pt', 'en'],
       paymentGateway: 'stripe',
       taxRate: null,
       dateFormat: 'dd/MM/yyyy',
       paymentMethods: ['card', 'pix', 'boleto'],
       legal: {},
       pppDiscount: 0.4,
     },
     // ... more countries
   };

2. PAYMENT ADAPTER PATTERN:
   // lib/payments/adapter.ts
   interface PaymentAdapter {
     createCheckout(params): Promise<CheckoutSession>;
     handleWebhook(payload): Promise<WebhookResult>;
     getSubscription(id): Promise<Subscription>;
   }
   // Implement: RazorpayAdapter, StripeAdapter, PaddleAdapter

3. MIDDLEWARE GEO-DETECTION:
   // middleware.ts — use Vercel geo headers (FREE)
   const country = request.headers.get('x-vercel-ip-country') || 'US';

4. i18n SETUP:
   // Use next-intl (best for App Router 2026)
   // Route structure: /[locale]/dashboard
   // Auto-detect via middleware, respect user preference

5. PPP PRICING:
   // Detect country → look up discount → apply to base USD price
   // Display in local currency using Intl.NumberFormat
   // Verify at checkout: compare IP country with billing country

6. LEGAL PAGES PER COUNTRY:
   // Store as MDX in content/legal/[country]/
   // Serve correct version based on user's country

7. FEATURE FLAGS PER COUNTRY:
   // Use PostHog with country as person property
   // Gradual rollout: India → US → EU → LATAM → SEA
```

### Purchasing Power Parity (PPP) Pricing

```
RECOMMENDED PPP DISCOUNT TABLE:

Tier 0 (Full price): US, UK, Switzerland, Norway, Australia      → 0%
Tier 1 (Slight):     Canada, Germany, France, Japan, S. Korea    → 0-10%
Tier 2 (Moderate):   Spain, Portugal, Poland, Chile, Malaysia    → 20-30%
Tier 3 (Significant):Brazil, Mexico, Turkey, Thailand, S. Africa → 40-50%
Tier 4 (Heavy):      India, Indonesia, Vietnam, Philippines      → 60-70%
Tier 5 (Maximum):    Pakistan, Bangladesh, Ethiopia, Myanmar     → 70-80%

IMPLEMENTATION:
- Detect country via Vercel geo headers (free)
- Apply discount to base USD price
- Display in local currency (Intl.NumberFormat)
- At checkout: verify IP country matches billing country (prevent VPN abuse)
- Accept some leakage — cost of doing business
```

**Tools**:
| Tool | Purpose |
|------|---------|
| `WebSearch` | Research compliance requirements per country |
| `Browserbase` (`stagehand_extract`) | Extract regulatory info from government sites |
| `Sequential Thinking` | Complex compliance decision trees |
| `Notion` (`notion-create-database`) | Compliance tracking matrix |
| `Notion` (`notion-create-pages`) | Legal requirements docs |

### Stripe Atlas vs Indian Pvt Ltd Decision

```
DECISION GUIDE:
├── Bootstrapped, <$100K ARR → Indian Pvt Ltd + Stripe India
├── Bootstrapped, $100K-$1M ARR → Indian Pvt Ltd + MoR for tax simplicity
├── Raising from Indian VCs → Indian Pvt Ltd
├── Raising from US VCs / YC → Stripe Atlas ($500) + Indian subsidiary ("flip")
├── Selling primarily to US enterprises → Consider US entity for trust
└── DEFAULT: Start with Indian Pvt Ltd. Add US entity only if needed later.
```

### Data Residency Architecture

```
HOSTING DECISION:

Frontend: Vercel (global CDN) — fine for all markets
Serverless: Set Vercel function region to bom1 (Mumbai) for Supabase latency

Database:
├── Primary: Supabase on AWS ap-south-1 (Mumbai)
│   Serves India + global (acceptable latency via Vercel edge caching)
├── If EU data residency needed (enterprise GDPR):
│   Deploy separate Supabase in AWS eu-central-1 (Frankfurt)
│   Route EU users via middleware
└── Add Supabase read replicas later if latency becomes measurable issue

Payment data: MUST be in India (RBI requirement)
├── Razorpay/Stripe India handle this automatically
└── Do NOT store payment metadata in US-hosted Supabase

CERT-In logs: MUST be stored in India for 180 days
├── Use AWS CloudWatch in ap-south-1
├── OR self-hosted logging in Mumbai region
└── Set up BetterStack/Axiom with India region if available
```

### Post-Launch Compliance Scaling Checklist

```
AS YOU GROW (check when reaching each milestone):

[ ] Revenue > ₹20L/year → GST registration (if not already done)
[ ] Serving EU customers → Appoint EU Representative (DataRep/Prighter)
[ ] Serving UK customers → Appoint UK Representative (separate from EU)
[ ] Revenue > $100K in any US state → Register for sales tax OR use MoR
[ ] Enterprise B2B sales → Consider SOC 2 Type II certification
[ ] >50 lakh Indian users → Appoint CCO + Nodal Contact + Grievance Officer
[ ] Health data (any country) → HIPAA (US), NHS DSPT (UK) compliance
[ ] Hiring abroad → PE risk assessment per DTAA with that country
[ ] Foreign subsidiary → Transfer pricing documentation mandatory
[ ] Annual: Renew LUT before March 31, update IEC on DGFT
[ ] Quarterly: File TDS returns (Form 26Q, 24Q)
[ ] Monthly: GST returns (GSTR-1, GSTR-3B)
```

**Deliverable**: `COMPLIANCE-STRATEGY.md` containing:
- Target markets ranked by priority (India-first + top 3-5 global)
- Legal entity setup checklist (Pvt Ltd + GST + IEC + LUT)
- Per-country compliance matrix
- Payment gateway decision (Razorpay + Stripe/Paddle)
- PPP pricing table with discount tiers
- Data residency architecture (what goes where)
- Language requirements per market
- Tax obligations per market
- Post-launch compliance scaling checklist

---

## Phase 4: Product Definition & Strategy

### Goal: Define exactly what you're building and for whom

**Skill**: `superpowers:writing-plans`

```
INSTRUCTIONS FOR CLAUDE:
1. Invoke /superpowers:writing-plans skill
2. Define the ICP (Ideal Customer Profile)
3. Write value proposition: "For [target user] who [need], [product] is a
   [category] that [key benefit]. Unlike [alternative], we [differentiator]."
4. Define MVP core feature set:
   - List ALL possible features
   - Ruthlessly cut to the ONE thing that solves the core problem
   - Classify: Must-have (MVP) / Should-have (v1.1) / Nice-to-have (v2+)
5. Create PRD (Product Requirements Document)
6. Define success metrics
```

**Tools**:
| Tool | Purpose |
|------|---------|
| `Notion` (`notion-create-pages`) | PRD document, ICP profile |
| `Notion` (`notion-create-database`) | Feature backlog with priority |
| `Sequential Thinking` | Complex product scoping decisions |
| `TaskCreate` | Break MVP features into tasks |

**Deliverable**: `PRD.md` — ICP, value prop, MVP scope, user stories, success metrics, out-of-scope list

---

## Phase 5: Business Model Design

### Goal: Know how you'll make money before writing code

```
INSTRUCTIONS FOR CLAUDE:
1. Based on competitor pricing (Phase 3) and ICP (Phase 4):
   - Recommend pricing model: subscription / usage-based / freemium / per-seat
   - Design 2-3 pricing tiers
   - Define free vs paid split (if freemium)
2. Calculate unit economics: CAC, LTV, LTV:CAC ratio, break-even
3. Design billing flow: monthly + annual (20% discount), trial period
```

**Tools**:
| Tool | Purpose |
|------|---------|
| `WebSearch` | Pricing benchmarks |
| `Notion` (`notion-create-pages`) | Business model document |

**Deliverable**: `BUSINESS-MODEL.md` — pricing table, free/paid split, unit economics, billing flow

---

## Phase 6: Tech Stack & Architecture

### Goal: Choose the right tools and design the system

**Skills**: `superpowers:writing-plans`, `codebase-context-mapper`

```
INSTRUCTIONS FOR CLAUDE:
1. Invoke /superpowers:writing-plans for the technical architecture
2. Use /codebase-context-mapper if building on existing code
3. Recommend tech stack based on product requirements:

   RECOMMENDED DEFAULT STACK (2026):
   ┌──────────────────────────────────────────────────────────┐
   │  Framework:     Next.js 15+ (App Router) + TypeScript    │
   │  Styling:       Tailwind CSS v4                          │
   │  UI:            shadcn/ui + Radix UI                     │
   │  Animations:    Framer Motion                            │
   │  ORM:           Drizzle ORM (7.4kb, pure TS inference)   │
   │  Database:      Supabase (Postgres + RLS + Realtime)     │
   │  Auth:          Better-Auth (RBAC, orgs, 2FA, passkeys)  │
   │                 Alt: Clerk (pre-built UI, faster setup)   │
   │  Payments:      Razorpay (India) + Paddle MoR (global)    │
   │  Email:         Resend + React Email templates            │
   │  Background:    Inngest (event-driven jobs, retries)     │
   │  Hosting:       Vercel                                    │
   │  CDN/DNS:       Cloudflare                               │
   │  Analytics:     PostHog                                   │
   │  Errors:        Sentry                                    │
   │  Storage:       Supabase Storage (or Cloudflare R2)      │
   │  Realtime:      Supabase Realtime (if needed)            │
   │  AI Features:   Vercel AI SDK v6 (if needed)             │
   │  Monorepo:      Turborepo (if multi-package)             │
   │  Blog/Docs:     MDX + Contentlayer (or Sanity CMS)       │
   │                                                          │
   │  MULTI-COUNTRY ADDITIONS:                                │
   │  i18n:          next-intl (best for App Router 2026)     │
   │  India Pay:     Razorpay (UPI, cards, netbanking)        │
   │  Global Pay:    Razorpay Intl or Paddle (Merchant of Record) │
   │  Geo-detect:    Vercel geo headers (free, built-in)      │
   │  PPP Pricing:   Custom table + Intl.NumberFormat         │
   │  Legal Pages:   Termly/iubenda (multi-jurisdiction)      │
   │  Translations:  Crowdin or Tolgee (AI-assisted)          │
   │  Feature Flags: PostHog (country-targeted rollouts)      │
   └──────────────────────────────────────────────────────────┘

   WHY THESE CHOICES:
   - Better-Auth over Clerk: open-source, no vendor lock-in, built-in
     RBAC + org management + team invitations. (Lucia Auth is DEPRECATED)
   - Drizzle over Prisma: 7.4kb bundle (vs Prisma's 200kb+), pure TS
     inference (no codegen), faster serverless cold starts
   - Inngest over raw cron: event-driven, built-in retries, step functions,
     observability. Essential for email queues, webhooks, scheduled tasks.
   - React Email: email templates as React components, pairs with Resend

4. Design database schema based on PRD features
5. Plan API routes and data flow
6. Define background job architecture (Inngest functions)

   HUMAN REQUIRED: At the end of this phase, Claude will list all API
   keys and accounts needed. You must create accounts and get keys.
```

**Tools**:
| Tool | Purpose |
|------|---------|
| `Supabase` (`apply_migration`) | Create database tables, RLS policies |
| `Supabase` (`execute_sql`) | Seed data, verify schema |
| `Supabase` (`list_tables`) | Verify database structure |
| `Supabase` (`search_docs`) | Look up Supabase features |
| `Context7` (`resolve-library-id`, `query-docs`) | Latest docs for any library |
| `Sequential Thinking` | Complex architecture decisions |

**Deliverable**: `ARCHITECTURE.md` — tech stack, DB schema (SQL), API route map, background job definitions, env var checklist

---

## Phase 7: Brand, Name & Design System

### Goal: Create a cohesive visual identity before any UI code

**Skills**: `brand-architect` (PRIMARY) -> `enhance-prompt` -> `frontend-design`

```
INSTRUCTIONS FOR CLAUDE:
1. NAMING (if not decided by user in Phase 0):
   - Generate 10+ name candidates
   - Check domain availability via Vercel MCP (check_domain_availability_and_price)
   - Score each: memorability, relevance, domain availability
   - Pick the best one (don't ask user — they said go autonomous)

2. BRAND IDENTITY — Invoke /brand-architect skill in AUTONOMOUS MODE:

   IMPORTANT: brand-architect normally asks 8-12 questions one-by-one with
   checkpoint gates between phases. In autonomous mode, SKIP the interviews
   and gates — use the user's Phase 0 answers instead:

   - Use Q12 (brand feel), Q13 (dinner party persona), Q14 (visual affinities),
     Q15 (color preferences) as input to brand-architect Phase 1
   - Auto-confirm all checkpoints (user already approved the direction in Phase 0)
   - Run through all 6 phases of brand-architect autonomously:
     Phase 1: Brand Brief (from Phase 0 answers)
     Phase 2: Brand Strategy (purpose, vision, mission, values, positioning)
     Phase 3: Visual Direction (pick best of 3 directions based on user prefs)
     Phase 4: Full Brand Bible (colors, typography, spacing, shadows, voice)
     Phase 5: Code Artifacts (brand-tokens.css, tailwind.config.brand.js, design-tokens.json)
     Phase 6: Pipeline Handoff (save files, hand off to design pipeline)

   OUTPUTS from brand-architect:
   - brand-bible.md — complete brand identity system
   - brand-tokens.css — CSS custom properties (light + dark mode)
   - tailwind.config.brand.js — Tailwind theme extension
   - design-tokens.json — W3C format design tokens

3. FEED BRAND INTO DESIGN TOOLS:

   OPTION A — Stitch (Recommended for screen generation):
   - Use brand-architect colors/fonts to configure:
     mcp__stitch__create_project → create design project
     mcp__stitch__create_design_system → apply brand colors, fonts, roundness
   - This ensures all generated screens match the brand bible

   OPTION B — Pencil.dev (Design in your repo):
   - pencil get_guidelines(topic="design-system")
   - pencil set_variables → apply brand tokens
   - pencil batch_design → create brand-consistent designs

   OPTION C — Figma (If existing designs):
   - mcp__claude_ai_Figma__create_design_system_rules

   OPTION D — Canva (For marketing materials):
   - mcp__claude_ai_Canva__generate-design → branded marketing materials

4. Invoke /enhance-prompt to create Stitch-optimized prompts using brand identity
5. Use 21st.dev Magic component_inspiration for UI component ideas
6. Use logo_search to find logo/icon assets matching brand direction
```

**Tools**:
| Tool | Purpose |
|------|---------|
| `Stitch` (`create_project`, `create_design_system`) | Design project & system |
| `Pencil` (`get_guidelines`, `get_style_guide`) | Design rules & inspiration |
| `Figma` (`create_design_system_rules`) | Figma design system |
| `Canva` (`list-brand-kits`, `generate-design`) | Brand kit & marketing design |
| `21st.dev Magic` (`component_inspiration`) | Component design ideas |
| `21st.dev Magic` (`logo_search`) | Logo/icon assets |
| `Vercel` (`check_domain_availability_and_price`) | Domain checking |
| `WebSearch` | Domain & trademark checking |

**Deliverable**: `DESIGN-SYSTEM.md` + Stitch/Pencil/Figma project with design tokens

---

## Phase 8: Design — Screen Generation

### Goal: Generate all UI screens before writing code

**Skills**: `enhance-prompt` -> `stitch-loop` -> `design-md`

```
INSTRUCTIONS FOR CLAUDE:
1. Invoke /enhance-prompt to create optimized prompts for each screen

2. Generate screens in Stitch (PRIMARY):
   For each MVP screen:
   a. mcp__stitch__generate_screen_from_text with detailed prompt
   b. mcp__stitch__generate_variants to explore alternatives
   c. mcp__stitch__apply_design_system for consistency
   d. mcp__stitch__edit_screens for refinements

   TYPICAL MVP SCREENS:
   - Landing page (hero, features, pricing, CTA)
   - Sign-up / Sign-in page
   - Onboarding flow (2-3 steps)
   - Dashboard (main app view)
   - Core feature screen(s)
   - Settings page
   - Billing/pricing page
   - 404 / error page

3. Use Browserbase for visual verification:
   - Navigate to live preview URL
   - Take screenshots for comparison
   - Extract elements to verify layout

4. Invoke /design-md to synthesize DESIGN.md from Stitch project
5. Invoke /stitch-loop for iterative refinement loop
   (baton-passing pattern: next-prompt.md + SITE.md + DESIGN.md)
```

**Tools**:
| Tool | Purpose |
|------|---------|
| `Stitch` (`generate_screen_from_text`) | Generate each screen |
| `Stitch` (`generate_variants`) | Create design alternatives |
| `Stitch` (`apply_design_system`) | Consistent styling |
| `Stitch` (`edit_screens`) | Refine and iterate |
| `Stitch` (`get_screen`) | Review generated screens |
| `Pencil` (`batch_design`) | Alternative: create .pen designs |
| `Pencil` (`get_screenshot`) | Review Pencil designs |
| `Browserbase` (`browserbase_screenshot`) | Visual verification |

**Deliverable**: All MVP screens in Stitch + DESIGN.md + SITE.md

---

## Phase 9: Build — Project Scaffolding

### Goal: Set up the project skeleton with all integrations wired

**Skills**: `superpowers:writing-plans` -> `superpowers:executing-plans` -> `shadcn-ui` -> `superpowers:using-git-worktrees`

```
INSTRUCTIONS FOR CLAUDE:
1. Invoke /superpowers:writing-plans for implementation plan
2. Invoke /superpowers:using-git-worktrees for isolated feature work
3. Scaffold the Next.js project:

   npx create-next-app@latest [project-name] \
     --typescript --tailwind --eslint --app --src-dir \
     --import-alias "@/*"

   # OR for monorepo:
   npx create-turbo@latest [project-name]

4. Install core dependencies:
   # UI (apply brand-architect outputs: tailwind.config.brand.js + brand-tokens.css)
   npx shadcn@latest init (invoke /shadcn-ui skill)
   # Copy tailwind.config.brand.js into tailwind.config.ts
   # Copy brand-tokens.css into globals.css
   npm i framer-motion

   # Database
   npm i drizzle-orm postgres
   npm i -D drizzle-kit

   # Auth (choose one)
   npm i better-auth          # Recommended: open-source, RBAC, orgs
   # OR: npm i @clerk/nextjs  # Alternative: pre-built UI

   # Payments
   npm i razorpay                # India + international payments
   # npm i stripe @stripe/stripe-js  # Only if using Stripe (US entity)
   # npm i @paddle/paddle-node-sdk   # Only if using Paddle MoR

   # Email
   npm i resend @react-email/components

   # Background Jobs
   npm i inngest

   # Analytics & Monitoring
   npm i posthog-js
   npm i @sentry/nextjs

   # AI Features (if needed)
   npm i ai @ai-sdk/anthropic  # Vercel AI SDK

   # Multi-country / i18n
   npm i next-intl              # i18n for App Router
   npm i razorpay               # India payments (if targeting India)
   # Stripe already installed above for global payments

5. Set up project structure:
   src/
   ├── app/
   │   ├── (auth)/              # Auth routes
   │   ├── (dashboard)/         # Protected app routes
   │   ├── (marketing)/         # Public pages
   │   ├── api/
   │   │   ├── webhooks/        # Stripe, auth webhooks
   │   │   ├── inngest/         # Inngest endpoint
   │   │   └── ...
   │   ├── layout.tsx
   │   └── page.tsx
   ├── components/
   │   ├── ui/                  # shadcn components
   │   ├── emails/              # React Email templates
   │   └── ...
   ├── db/
   │   ├── schema.ts            # Drizzle schema
   │   ├── migrations/          # Drizzle migrations
   │   └── index.ts             # Drizzle client
   ├── inngest/
   │   ├── client.ts            # Inngest client
   │   └── functions/           # Background job definitions
   ├── lib/
   │   ├── auth.ts              # Better-Auth config
   │   ├── razorpay.ts          # Razorpay helpers (primary)
   │   ├── payments/            # Payment adapter pattern
   │   │   ├── adapter.ts       # PaymentAdapter interface
   │   │   ├── razorpay.ts      # RazorpayAdapter (primary)
   │   │   ├── paddle.ts        # PaddleAdapter (global MoR)
   │   │   └── stripe.ts        # StripeAdapter (only if US entity)
   │   ├── email.ts             # Resend helpers
   │   └── utils.ts
   ├── config/
   │   ├── countries.ts         # Per-country config (currency, gateway, legal)
   │   └── ppp.ts               # PPP discount table
   ├── messages/                # i18n translation files (next-intl)
   │   ├── en.json
   │   ├── hi.json              # Hindi (if India market)
   │   └── ...
   ├── content/
   │   └── legal/               # Per-country legal pages (MDX)
   │       ├── IN/
   │       ├── US/
   │       └── EU/
   └── types/

6. Configure environment variables:

   HUMAN REQUIRED: Create .env.local with:
   # Database (Supabase)
   DATABASE_URL=
   NEXT_PUBLIC_SUPABASE_URL=
   NEXT_PUBLIC_SUPABASE_ANON_KEY=
   SUPABASE_SERVICE_ROLE_KEY=

   # Auth (Better-Auth)
   BETTER_AUTH_SECRET=           # Generate: openssl rand -base64 32
   BETTER_AUTH_URL=http://localhost:3000

   # Auth (Clerk — if using instead)
   # NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=
   # CLERK_SECRET_KEY=

   # Payments — Razorpay (primary)
   RAZORPAY_KEY_ID=
   RAZORPAY_KEY_SECRET=
   RAZORPAY_WEBHOOK_SECRET=

   # Payments — Paddle MoR (global, if using)
   # PADDLE_API_KEY=
   # PADDLE_WEBHOOK_SECRET=

   # Payments — Stripe (ONLY if you have US entity)
   # STRIPE_SECRET_KEY=
   # NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY=
   # STRIPE_WEBHOOK_SECRET=

   # Email
   RESEND_API_KEY=

   # Analytics
   NEXT_PUBLIC_POSTHOG_KEY=
   SENTRY_DSN=

   # Background Jobs
   INNGEST_EVENT_KEY=
   INNGEST_SIGNING_KEY=

   # (Razorpay and Paddle env vars are listed above in Payments section)

7. Set up database:
   - Use Supabase MCP (apply_migration) for each table
   - Set up RLS policies
   - Use Supabase MCP (generate_typescript_types) for type safety

8. Initialize git repo and use GitHub MCP for version control
```

**Tools**:
| Tool | Purpose |
|------|---------|
| `Bash` | Scaffold project, install deps |
| `Write` / `Edit` | Config files, layouts |
| `Supabase` (`apply_migration`, `execute_sql`) | Database setup |
| `Supabase` (`generate_typescript_types`) | Type generation |
| `Supabase` (`get_advisors`) | Security check |
| `GitHub MCP` | Repo management, initial commit |
| `Context7` | Look up latest API docs |
| `shadcn-ui` skill | Component library setup |

---

## Phase 10: Build — Core Features

### Goal: Implement the MVP features with production quality

**Skills**: `superpowers:executing-plans` -> `superpowers:subagent-driven-development` -> `superpowers:test-driven-development` -> `react-components` -> `frontend-design`

```
INSTRUCTIONS FOR CLAUDE:
1. Invoke /superpowers:executing-plans to follow the implementation plan
2. Invoke /superpowers:subagent-driven-development for parallel work:

   SQUAD ROUTING — Dispatch per .squad/routing.md:
   ┌─────────────────────────────────────────────────────────────┐
   │  LEAD (main session): Read .squad/decisions.md, route work  │
   │                                                              │
   │  FRONTEND agent (charter: .squad/agents/frontend/):         │
   │  → Core feature UI (convert Stitch designs to React)        │
   │  → Dashboard, settings, onboarding screens                  │
   │  → Uses: react-components, frontend-design, shadcn-ui       │
   │                                                              │
   │  BACKEND agent (charter: .squad/agents/backend/):           │
   │  → Auth flow (Better-Auth), Drizzle schema, server actions  │
   │  → API routes, Inngest background jobs                      │
   │  → Uses: Supabase MCP, Context7                             │
   │                                                              │
   │  PAYMENTS agent (charter: .squad/agents/payments/):         │
   │  → Razorpay Checkout, Paddle MoR, webhooks, billing portal  │
   │  → Payment adapter pattern, subscription management         │
   │                                                              │
   │  TESTER agent (charter: .squad/agents/tester/):             │
   │  → Writes test cases FROM spec (while others implement!)    │
   │  → Playwright E2E, Browserbase visual tests                 │
   │  → Uses: Playwright MCP, Browserbase MCP                    │
   │                                                              │
   │  SCRIBE (background): Logs every decision to decisions.md   │
   │                                                              │
   │  RULE: Tester reviews Frontend code. Frontend reviews       │
   │  Backend code. NEVER self-review.                           │
   └─────────────────────────────────────────────────────────────┘

3. Use /superpowers:using-git-worktrees for isolated feature branches
4. Use /superpowers:dispatching-parallel-agents for independent tasks

5. For each feature, follow TDD:
   - Invoke /superpowers:test-driven-development
   - Write test first -> implement -> verify

6. Convert designs to code:
   - Invoke /react-components to convert Stitch screens to React
   - Use 21st.dev Magic component_builder for individual components
   - Use 21st.dev Magic component_refiner to improve quality
   - Invoke /frontend-design for custom UI work
   - Invoke /shadcn-ui for component integration

7. Build order (dependencies matter):
   a. Auth (sign-up, sign-in, middleware, protected routes, social login)
   b. Database layer (Drizzle schema, queries, server actions)
   c. Dashboard layout (sidebar, nav, user menu, notification bell)
   d. Core feature screens (the main value of your product)
   e. Settings (profile, account, team management)
   f. Account deletion flow (DPDPA + GDPR requirement — right to erasure)
   g. Data export (GDPR right to portability — user downloads their data as JSON/CSV)
   h. Billing (pricing page, checkout, subscription management)
   i. Webhook handlers with idempotency (Razorpay/Paddle webhooks can fire 2x)
   j. Background jobs (email sequences, webhooks, scheduled tasks)
   k. Notification system (in-app notifications table + email via Inngest)
   l. Audit log (who did what, when — log to audit_logs table, needed for compliance)
   m. Landing page (marketing site)
   n. Onboarding flow
   o. Email templates (React Email for welcome, onboarding, billing)
   p. Favicon + OG images (use brand-architect colors, generate via Canva MCP)

8. Use Sequential Thinking MCP for complex implementation decisions
9. Use GitHub MCP for commit management and PR creation
10. Invoke /simplify skill after major features to review code quality
```

**Tools**:
| Tool | Purpose |
|------|---------|
| `Agent` (subagent-driven-development) | Parallel implementation |
| `Write` / `Edit` | Code files |
| `Bash` | Dev server, tests, type checking |
| `Stitch` (`get_screen`) | Retrieve designs for conversion |
| `react-components` skill | Convert Stitch -> React |
| `21st.dev Magic` (`component_builder`, `component_refiner`) | Build/refine components |
| `frontend-design` skill | Custom frontend work |
| `shadcn-ui` skill | shadcn component integration |
| `Context7` | Library API docs |
| `Supabase` (`execute_sql`, `deploy_edge_function`) | Backend operations |
| `GitHub MCP` | Commits, branches, PRs |
| `Sequential Thinking` | Complex decisions |
| `Browserbase` (`stagehand_act`, `stagehand_observe`) | Test UI during build |

---

## Phase 11: Build — Quality & Testing

### Goal: Ensure the app is production-ready

**Skills**: `superpowers:test-driven-development` -> `superpowers:systematic-debugging` -> `superpowers:verification-before-completion` -> `superpowers:requesting-code-review`

```
INSTRUCTIONS FOR CLAUDE:
1. Invoke /superpowers:verification-before-completion before claiming anything works

2. E2E Testing with Playwright MCP (PRIMARY):
   - Use Playwright MCP for accessibility-tree-based E2E testing
   - Playwright navigates, clicks, fills forms, asserts — no vision model needed
   - Test ALL critical paths:

   CRITICAL PATH TESTS:
   [ ] Auth: Sign up -> Sign in -> Access dashboard -> Sign out
   [ ] Payments: Select plan -> Checkout -> Webhook -> Subscription active
   [ ] Core: Create/Read/Update/Delete for main feature
   [ ] Billing: Upgrade -> Downgrade -> Cancel -> Resubscribe
   [ ] Onboarding: Complete flow -> Reach dashboard
   [ ] Email: Trigger event -> Verify email sent (via Resend MCP)

3. Visual Testing with Browserbase/Stagehand:
   - Use stagehand_observe to verify interactive elements on each page
   - Use stagehand_act to test user flows with natural language
   - Use browserbase_screenshot for visual regression snapshots
   - Use stagehand_extract to verify page content

4. When tests fail, invoke /superpowers:systematic-debugging:
   - Structured debugging BEFORE proposing fixes
   - Identify root cause, not just symptoms

5. Security checklist:
   - All Supabase tables have RLS policies
   - API routes validate auth
   - Razorpay/Paddle webhooks verify signatures
   - No secrets in client-side code
   - CSRF protection on forms
   - Use Supabase MCP (get_advisors type="security") to audit

6. Performance check:
   - Use Supabase MCP (get_advisors type="performance")
   - Check for missing indexes, slow queries

7. Set up monitoring:
   - Sentry: error boundaries, source maps
   - PostHog: track key events (sign_up, first_action, upgrade, churn)

8. Invoke /superpowers:requesting-code-review for self-review
9. Invoke /simplify to review code for reuse and efficiency
```

**Tools**:
| Tool | Purpose |
|------|---------|
| `Playwright MCP` | E2E testing via accessibility tree |
| `Browserbase` (`stagehand_act/observe/extract`, `screenshot`) | Visual + AI testing |
| `Bash` | Run tests, type checking, linting |
| `Supabase` (`get_advisors`) | Security + performance audit |
| `Supabase` (`get_logs`) | Check for errors |
| `Sequential Thinking` | Debug complex issues |
| `superpowers:code-reviewer` agent | Review implementation |

---

## Phase 11.5: World-Class Quality Audit (All Specialist Agents)

### Goal: Every specialist agent audits their domain before deploy

> This phase makes the difference between "AI built this" and "this is world-class."
> Run ALL audits in parallel via Squad routing.

```
INSTRUCTIONS FOR CLAUDE:
Run these audits SIMULTANEOUSLY via Squad parallel fan-out.
Each agent reads .squad/decisions.md + its charter, then audits:

DESIGNER agent audit (/design-brand-guardian + /design-ux-researcher):
├── Brand consistency: Do ALL screens follow brand-bible.md exactly?
│   Check: colors, fonts, spacing, shadows, border-radius across every page
├── UX research: /design-ux-researcher
│   ├── Is the onboarding flow intuitive? (3-click test)
│   ├── Is the primary action obvious on every screen?
│   ├── Are error states helpful and on-brand?
│   └── Is the information hierarchy correct?
├── Accessibility: /design-inclusive-visuals-specialist
│   ├── WCAG AA contrast on ALL text (check brand-tokens.css)
│   ├── Touch targets >= 44x44px on mobile
│   ├── Keyboard navigation works for entire app
│   ├── Screen reader labels on all interactive elements
│   └── No color-only information (colorblind safe)
├── Delight: /design-whimsy-injector
│   └── Add 3-5 moments of personality (loading states, empty states,
│       success animations, 404 page, micro-interactions)
└── Visual polish: /design-visual-storyteller
    └── Landing page tells a compelling visual story?

FRONTEND agent audit (/engineering-frontend-developer):
├── Performance:
│   ├── Run Lighthouse audit (via Bash) — target 90+ on all metrics
│   ├── Check Core Web Vitals: LCP < 2.5s, FID < 100ms, CLS < 0.1
│   ├── Check bundle size — no unnecessary imports
│   └── Images: next/image, proper sizing, WebP/AVIF
├── Responsiveness: All screens work on 375px, 768px, 1024px, 1440px
├── Dark mode: Fully working with brand-tokens.css dark mode vars
├── i18n: All user-facing strings in translation files (next-intl)
└── Cross-browser: Test in Chromium + Firefox via Playwright MCP

BACKEND agent audit (/engineering-database-optimizer + /engineering-backend-architect):
├── Database: /engineering-database-optimizer
│   ├── All queries use indexes (no sequential scans on large tables)
│   ├── N+1 query detection
│   ├── Connection pooling configured
│   └── Supabase get_advisors(type="performance")
├── API quality:
│   ├── All endpoints return proper HTTP status codes
│   ├── Error responses are structured and helpful
│   ├── Rate limiting on public endpoints
│   └── Input validation on all user inputs
└── Auth: Better-Auth configured correctly, sessions working

SECURITY agent audit (/engineering-security-engineer):
├── Supabase: get_advisors(type="security")
│   ├── ALL tables have RLS policies
│   ├── No public access to sensitive data
│   └── Service role key NEVER exposed client-side
├── Auth: No auth bypass possible
├── Payments: Webhook signatures verified
├── XSS: All user input sanitized before rendering
├── CSRF: Protected on all state-changing endpoints
├── Headers: Security headers set (CSP, HSTS, X-Frame-Options)
├── Secrets: No API keys in client-side code (grep for patterns)
├── Dependencies: No known vulnerabilities (npm audit)
└── CERT-In compliance: 180-day logging, NTP sync, PoC registered

DEVOPS agent audit (/engineering-devops-automator + /engineering-sre):
├── CI/CD: GitHub Actions workflow for lint + test + deploy
├── Environment: dev/staging/production properly separated
├── Monitoring: Sentry, PostHog, BetterStack configured
├── Error budgets: SLO targets defined
├── Rollback: Can rollback via Vercel instant rollback
├── Uptime: BetterStack monitoring configured
├── Load test: Can the app handle 100 concurrent users? (use k6 or artillery)
├── Backup: Supabase daily backups enabled (Pro plan), restore plan documented
└── Customer support: Crisp/Tawk.to widget embedded (free tier)

WRITER agent audit (/engineering-technical-writer):
├── README.md: Setup instructions, architecture overview, contributing guide
├── API documentation: All endpoints documented
├── In-app copy: Consistent with brand voice (brand-bible.md)
├── Landing page copy: Clear value prop, no jargon, compelling CTAs
├── Legal pages: Privacy policy, ToS, cookie policy — per-country
├── Onboarding copy: Welcoming, clear, progressive disclosure
└── Error messages: Helpful, specific, on-brand tone

REVIEWER agent final pass (/engineering-code-reviewer + /simplify):
├── Code review: All files touched during build
│   ├── No dead code, no TODOs left in production code
│   ├── Consistent patterns across codebase
│   ├── No premature abstractions
│   └── Type safety: No `any` types, no type assertions without reason
├── /simplify: Can any code be simplified or reused?
└── Final git log review: commit messages are descriptive

AFTER ALL AUDITS: Each agent writes findings to .squad/decisions/inbox/
Scribe merges into decisions.md. Lead prioritizes fixes.
Claude fixes ALL issues before proceeding to Phase 12.
```

**Tools**:
| Tool | Purpose |
|------|---------|
| All specialist skills listed above | Domain-specific audits |
| `Playwright MCP` | Cross-browser testing, accessibility checks |
| `Browserbase` | Visual regression, responsive testing |
| `Supabase` (`get_advisors`) | Security + performance |
| `Bash` | Lighthouse audit, npm audit, bundle analysis |

---

## Phase 12: Deploy & Launch Prep

### Goal: Get the app live and prepare launch materials

**Skills**: `superpowers:finishing-a-development-branch`, `schedule`

```
INSTRUCTIONS FOR CLAUDE:
1. Invoke /superpowers:finishing-a-development-branch to decide merge strategy

2. Deploy to Vercel:
   - Use mcp__claude_ai_Vercel__deploy_to_vercel
   - Verify with get_deployment + get_deployment_build_logs
   - Check runtime logs for errors

   HUMAN REQUIRED:
   - Set environment variables in Vercel dashboard
   - Configure custom domain

3. Configure Cloudflare (if using):
   - Use Cloudflare MCP for DNS configuration
   - Set up CDN caching rules
   - Configure SSL/TLS
   - Set up Cloudflare R2 for asset storage (if needed)

4. Set up email infrastructure:
   - Use Resend MCP to verify sending domain
   - Test transactional emails (welcome, password reset, billing)
   - Configure webhooks for delivery tracking

   HUMAN REQUIRED:
   - Set up Razorpay + Paddle webhook endpoints to production URL
   - Verify email sending domain DNS records

5. Legal compliance (per-country from Phase 3.5):
   - Use Termly or iubenda for privacy policy, ToS, cookie consent
   - Generate SEPARATE legal pages per target country:
     * India: DPDPA 2023 compliant privacy policy, GST invoice format
     * US: CCPA/CPRA privacy policy, CAN-SPAM compliant emails
     * EU: GDPR compliant (explicit cookie consent, DPA, right to erasure)
     * Brazil: LGPD compliant
   - Add cookie consent banner (REQUIRED for EU, good practice globally)
   - Add grievance officer details (REQUIRED for India under IT Rules 2021)
   - Display seller/company details clearly (India E-Commerce Rules 2020)
   - Implement refund policy (EU: 14-day withdrawal right for digital services)
   - Set up CERT-In compliant logging (6-hour incident reporting for India)

   HUMAN REQUIRED:
   - Review legal documents with local counsel before publishing
   - Ensure GST invoices display GSTIN, SAC code 998314 for SaaS
   - Configure data deletion workflow (DPDPA + GDPR requirement)

6. Landing page optimization:
   - Clear hero with value proposition
   - Feature sections with screenshots
   - Pricing table (connected to Razorpay/Paddle)
   - Social proof section
   - CTA above and below fold
   - Use /ads-landing skill to audit landing page quality

7. Prepare launch assets:
   - Use /remotion skill to generate walkthrough video from Stitch designs
   - Use Canva MCP (generate-design) for social media graphics
   - Use Canva MCP (export-design) to export in all formats
   - Launch copy for each channel:
     * Product Hunt tagline + description
     * Hacker News "Show HN" post
     * Reddit post template
     * Twitter/X announcement thread

   Use /ads-create skill for campaign concepts
   Use /ads-dna skill to extract brand profile

8. Set up scheduled monitoring:
   - Invoke /schedule skill for recurring health checks
   - Set up uptime monitoring (BetterStack MCP or manual)
```

**Tools**:
| Tool | Purpose |
|------|---------|
| `Vercel` (`deploy_to_vercel`, `get_deployment_build_logs`) | Deploy + debug |
| `Vercel` (`get_runtime_logs`) | Monitor production |
| `Cloudflare MCP` | DNS, CDN, SSL, Workers, R2 |
| `Resend MCP` | Email domain setup, test emails |
| `Canva` (`generate-design`, `export-design`) | Marketing assets |
| `GitHub MCP` | PR for production merge |
| `ads-landing` skill | Landing page audit |
| `ads-create` / `ads-dna` skill | Campaign prep |
| `remotion` skill | Demo video |
| `schedule` skill | Recurring monitoring agents |

---

## Phase 13: Post-Launch — Marketing & Growth

### Goal: Get users and start the feedback loop

```
INSTRUCTIONS FOR CLAUDE:
1. SEO Foundation:
   - Generate 5-10 blog post topics targeting ICP search queries
   - Write meta descriptions for all pages
   - Set up sitemap.xml and robots.txt
   - Use MDX + Contentlayer for blog (or Sanity MCP for dynamic CMS)

2. Content management:
   OPTION A — Sanity MCP (dynamic CMS):
   - Use Sanity MCP (40+ tools) for blog, changelog, docs
   - Create schemas, manage content, query with natural language

   OPTION B — MDX in repo (static):
   - Claude generates MDX blog posts in /content directory
   - Contentlayer transforms to typed JSON

3. Analytics setup:
   - Use PostHog MCP to:
     * Set up event tracking
     * Create insights dashboards
     * Configure feature flags for gradual rollouts
     * Set up A/B tests (e.g., pricing page variants)

4. Email marketing:
   - Welcome email sequence (3 emails) via React Email + Resend
   - Onboarding sequence (3 emails)
   - Weekly digest template
   - Use Resend MCP to manage contacts and send broadcasts

5. Marketing assets:
   - Use Canva MCP (generate-design) for social graphics
   - Use Canva MCP (list-brand-kits) for brand consistency
   - Use Pomelli (labs.google.com/pomelli) for brand-consistent social content
     HUMAN REQUIRED: Go to Pomelli, enter your live site URL
   - Use Nano Banana Pro (via Gemini API) for product images

6. If running paid ads:
   - /ads-plan skill for strategy
   - /ads-create skill for campaign concepts
   - /ads-generate skill for ad creatives (uses Nano Banana Pro)
   - /ads-photoshoot skill for product photography
   - /ads-meta or /ads-google skill for platform optimization

7. Feedback collection:
   - Use Tally (free) for waitlist forms and feedback surveys
   - In-app feedback widget
   - User interview scheduling template
   - NPS survey setup

8. Launch channels:
   - Product Hunt: prepare maker comment, first-day plan
   - Show HN: draft post following HN guidelines
   - Reddit: identify 3-5 relevant subreddits
   - Use GitHub MCP to create public roadmap repo
```

**Tools**:
| Tool | Purpose |
|------|---------|
| `PostHog MCP` | Analytics, feature flags, A/B testing |
| `Sanity MCP` | Blog/docs CMS (if using) |
| `Canva` (`generate-design`, `export-design`, `list-brand-kits`) | Marketing assets |
| `Resend MCP` | Email campaigns, contact management |
| `WebSearch` | Keyword research, SEO |
| `Notion` (`notion-create-database`) | Content calendar, feedback tracker |
| `GitHub MCP` | Public roadmap, changelog |
| `ads` skills suite | Paid advertising |

---

## Phase 14: Iterate & Scale

### Goal: Retention, feature expansion, and growth

**Skills**: `loop`, `schedule`

```
INSTRUCTIONS FOR CLAUDE:
1. Set up production monitoring stack:
   - BetterStack MCP: uptime monitoring + public status page
   - Axiom MCP: deep log analysis and distributed tracing
   - Upstash MCP: Redis caching for hot paths, rate limiting, session storage
   - PostHog MCP: product analytics dashboards
   - Sentry: error monitoring (already configured)
   - Supabase (get_logs): database monitoring

2. Use /loop skill for recurring monitoring:
   - Check error rates, response times, uptime
   - Review analytics for usage patterns
   - Monitor churn signals

3. Use /schedule skill for automated maintenance:
   - Scheduled security scans (Supabase advisors)
   - Automated dependency updates
   - Database performance checks

4. Iteration playbook:
   - Weekly: review analytics (PostHog), prioritize bugs (Sentry)
   - Bi-weekly: ship improvements, review feedback
   - Monthly: review metrics vs targets, adjust roadmap

5. Build public roadmap:
   - Use Notion database for roadmap items
   - Categories: Planned / In Progress / Shipped
   - OR use GitHub MCP for public issues roadmap

6. Scale preparation:
   - Supabase (get_advisors type="performance") for DB optimization
   - Upstash Redis for caching hot queries
   - Cloudflare CDN tuning
   - Inngest for job queue scaling
   - Docker MCP Toolkit for containerized microservices (if needed)

7. Use /superpowers:receiving-code-review for handling community PRs
8. Use /superpowers:writing-skills to create custom project-specific skills
```

**Tools**:
| Tool | Purpose |
|------|---------|
| `BetterStack MCP` | Uptime + status pages + logging |
| `Axiom MCP` | Log analysis + tracing |
| `Upstash MCP` | Redis caching, rate limiting |
| `PostHog MCP` | Analytics dashboards |
| `Supabase` (`get_advisors`, `get_logs`) | DB performance |
| `Vercel` (`get_runtime_logs`) | App performance |
| `Cloudflare MCP` | CDN tuning |
| `Docker MCP Toolkit` | Container management |
| `Notion` (`notion-create-database`) | Public roadmap |
| `GitHub MCP` | Issue tracking, PRs |

---

## HUMAN REQUIRED Checklist

Everything Claude can't do for you. These are split into:
- **UPFRONT** = Provide in your initial answers (Phase 0 questions)
- **BLOCKER** = Claude will pause here — it literally cannot proceed without you
- **ASYNC** = Do these whenever, Claude will work around them until needed

### ASYNC — India Entity (Do alongside build, needed before first revenue):
- [ ] Register Pvt Ltd company (Razorpay Rize / Vakilsearch / ClearTax) ~INR 7-15K
- [ ] Get PAN & TAN for company
- [ ] Register for GST (mandatory if revenue > 20L or interstate sales)
- [ ] Get IEC (Import Export Code) from DGFT — free, lifetime validity
- [ ] File LUT (Form GST RFD-11) — before first export invoice, renew annually
- [ ] Register on startupindia.gov.in for DPIIT recognition
- [ ] Open current account (HDFC/ICICI/Razorpay X recommended)
- [ ] Open EEFC account at same bank (hold forex, pay SaaS tools in USD)
- [ ] Register Point of Contact with CERT-In
- [ ] Engage a CA for GST + international tax (INR 50K-2L for setup consultation)
- [ ] (If >50 lakh users expected) Register with STPI for SOFTEX filing

### UPFRONT — API Keys (Provide in Phase 0 answers, or Claude will pause at Phase 9):
- [ ] Create Supabase project at supabase.com -> provide URL + anon key + service role key
- [ ] Create Razorpay account at razorpay.com -> provide Key ID + Secret
- [ ] Create Paddle account at paddle.com -> provide API key (global MoR)
- [ ] Create Vercel account at vercel.com (Claude will deploy here)
- [ ] Create Resend account at resend.com -> provide API key
- [ ] Create PostHog project at posthog.com -> provide API key
- [ ] Create Sentry project at sentry.io -> provide DSN
- [ ] Create Inngest account at inngest.com -> provide keys
- [ ] (Claude auto-generates) Better-Auth secret via `openssl rand -base64 32`
- [ ] (Optional) Register domain name
- [ ] (Optional) Create Cloudflare account for DNS/CDN
- [ ] (Only if US entity) Create Stripe account

### BLOCKER — Deploy (Claude WILL pause here, you must act):
- [ ] Set environment variables in Vercel dashboard (Claude will list them)
- [ ] Configure custom domain DNS (Claude can't access your registrar)
- [ ] Review legal pages before publishing (Claude generates drafts, you approve)

### ASYNC — Deploy (Do when convenient, Claude works around these):
- [ ] Configure Razorpay + Paddle webhook URLs to production domain
- [ ] Configure Cloudflare DNS (if applicable)
- [ ] Verify email sending domain (Resend + DNS records)
- [ ] (Optional) Create Upstash Redis instance for caching

### ASYNC — Launch Prep (Do alongside or after Claude finishes):
- [ ] Create Product Hunt maker profile
- [ ] Prepare social media accounts
- [ ] Review demo video (Claude generates via /remotion)
- [ ] Get 3-5 beta testers for initial feedback
- [ ] (Optional) Create Sanity project for CMS content
- [ ] (Optional) Set up BetterStack uptime monitoring

### Ongoing Compliance (After Launch):
- [ ] Annual: Renew LUT before March 31
- [ ] Annual: Update IEC on DGFT portal
- [ ] Quarterly: File TDS returns (Form 26Q, 24Q)
- [ ] Monthly: File GST returns (GSTR-1, GSTR-3B)
- [ ] When serving EU: Appoint EU Representative (DataRep/Prighter ~EUR 120/yr)
- [ ] When serving UK: Appoint UK Representative (separate from EU)
- [ ] When US revenue > $100K in any state: Register for sales tax OR confirm MoR handles it
- [ ] When enterprise B2B: Consider SOC 2 Type II audit
- [ ] When >50 lakh Indian users: Appoint CCO + Nodal Contact + Grievance Officer

---

## Complete Skill Reference

| Skill | When to Use | Phase |
|-------|------------|-------|
| **Superpowers Suite** | | |
| `superpowers:brainstorming` | Before any creative/design decisions | 0, 1, 4, 7 |
| `superpowers:writing-plans` | Before multi-step implementation | 4, 6, 9 |
| `superpowers:executing-plans` | When implementing a written plan | 9, 10 |
| `superpowers:subagent-driven-development` | Parallel independent tasks | 10 |
| `superpowers:dispatching-parallel-agents` | 2+ independent tasks at once | 10 |
| `superpowers:using-git-worktrees` | Isolated feature branches | 9, 10 |
| `superpowers:test-driven-development` | Before writing implementation code | 10, 11 |
| `superpowers:systematic-debugging` | Before proposing fixes for failures | 10, 11 |
| `superpowers:verification-before-completion` | Before claiming work is done | 11, 12 |
| `superpowers:requesting-code-review` | After completing major features | 11 |
| `superpowers:receiving-code-review` | When handling PR feedback | 11, 14 |
| `superpowers:finishing-a-development-branch` | Deciding merge/PR/cleanup strategy | 12 |
| `superpowers:writing-skills` | Create custom project-specific skills | 14 |
| **Design & Build** | | |
| `brand-architect` | Complete brand identity system (strategy, visual, voice, code) | 7 |
| `frontend-design` | Building custom UI components | 10 |
| `shadcn-ui` | Setting up/using shadcn components | 9, 10 |
| `enhance-prompt` | Before generating Stitch screens | 7, 8 |
| `stitch-loop` | Iterative design refinement (baton-passing) | 8 |
| `design-md` | Creating design system docs from Stitch | 8 |
| `react-components` | Converting Stitch designs to React | 10 |
| `simplify` | Review code for reuse, quality, efficiency | 10, 11 |
| `remotion` | Generate walkthrough videos | 12 |
| **Design Specialist** (Squad Designer agent) | | |
| `design-ui-designer` | Pixel-perfect UI, visual design systems | 8, 11.5 |
| `design-ux-architect` | CSS systems, implementation guidance | 8, 11.5 |
| `design-ux-researcher` | User behavior analysis, usability testing | 4, 11.5 |
| `design-brand-guardian` | Brand consistency enforcement | 11.5 |
| `design-image-prompt-engineer` | AI image generation prompts | 7, 13 |
| `design-inclusive-visuals-specialist` | Accessibility, defeat AI biases | 11.5 |
| `design-visual-storyteller` | Visual narratives, multimedia | 12, 13 |
| `design-whimsy-injector` | Personality, delight, micro-interactions | 11.5 |
| **Engineering Specialist** (Squad agents) | | |
| `engineering-frontend-developer` | React, UI, performance optimization | 10, 11.5 |
| `engineering-backend-architect` | Scalable systems, APIs, microservices | 6, 10 |
| `engineering-database-optimizer` | Schema, queries, indexing, PostgreSQL | 6, 11.5 |
| `engineering-software-architect` | System design, DDD, patterns | 6 |
| `engineering-security-engineer` | Threat modeling, vuln scan, secure code | 11, 11.5 |
| `engineering-code-reviewer` | Code review: correctness, maintainability | 11, 11.5 |
| `engineering-technical-writer` | API docs, README, tutorials | 11.5, 12 |
| `engineering-rapid-prototyper` | Fast MVP/prototype code | 10 |
| `engineering-devops-automator` | CI/CD, infrastructure automation | 12, 14 |
| `engineering-sre` | SLOs, error budgets, observability | 14 |
| `engineering-ai-engineer` | AI/ML features integration | 10 |
| **Utility** | | |
| `codebase-context-mapper` | Map architecture of existing codebase | 0, 6, 9 |
| `claude-api` | Build features using Claude API/SDK | 10 |
| `loop` | Run prompt on recurring interval (monitoring) | 14 |
| `schedule` | Scheduled remote agents (cron jobs) | 12, 14 |
| **Ads/Marketing** | | |
| `ads-dna` | Extract brand identity from live site | 12 |
| `ads-landing` | Audit landing page quality | 12 |
| `ads-create` | Campaign concepts and copy | 13 |
| `ads-generate` | AI-generated ad images | 13 |
| `ads-photoshoot` | Product photography (5 styles) | 13 |
| `ads-plan` | Full advertising strategy | 13 |
| `ads-meta` / `ads-google` | Platform-specific optimization | 13 |

---

## Complete MCP Tool Reference

### Stitch (12 tools) — Design Generation
| Tool | Purpose |
|------|---------|
| `create_project` | Create new design project |
| `create_design_system` | Define colors, fonts, roundness |
| `update_design_system` | Iterate on design tokens |
| `generate_screen_from_text` | Generate UI screens from prompts |
| `generate_variants` | Create design alternatives |
| `apply_design_system` | Apply styling to screens |
| `edit_screens` | Refine individual screens |
| `get_screen` | Retrieve screen for review |
| `get_project` | Get project details |
| `list_projects` / `list_screens` / `list_design_systems` | List resources |

### Pencil.dev (15 tools) — Design in Repo
| Tool | Purpose |
|------|---------|
| `get_editor_state` | Current editor state |
| `open_document` | Open/create .pen file |
| `get_guidelines` | Design rules (web-app, mobile-app, landing-page, design-system) |
| `get_style_guide_tags` / `get_style_guide` | Style inspiration |
| `batch_design` | Create/edit designs |
| `batch_get` | Read design nodes |
| `get_screenshot` | Visual review |
| `get_variables` / `set_variables` | Design variables |
| `export_nodes` | Export to images |
| `find_empty_space_on_canvas` | Layout help |
| `snapshot_layout` | Layout structure |
| `search_all_unique_properties` / `replace_all_matching_properties` | Batch operations |

### Supabase (20 tools) — Backend
| Tool | Purpose |
|------|---------|
| `apply_migration` | DDL operations (tables, RLS) |
| `execute_sql` | Run queries, seed data |
| `list_tables` / `list_migrations` / `list_extensions` | Inspect DB |
| `generate_typescript_types` | Type generation |
| `get_advisors` | Security + performance audit |
| `get_logs` | Debug and monitor |
| `deploy_edge_function` / `list_edge_functions` / `get_edge_function` | Edge functions |
| `get_project_url` / `get_publishable_keys` | Project info |
| `create_branch` / `list_branches` / `delete_branch` / `merge_branch` / `rebase_branch` / `reset_branch` | DB branching |
| `search_docs` | Search Supabase docs |

### Vercel (18 tools) — Deployment
| Tool | Purpose |
|------|---------|
| `deploy_to_vercel` | Deploy application |
| `get_deployment` / `list_deployments` | Deployment management |
| `get_deployment_build_logs` | Debug builds |
| `get_runtime_logs` | Monitor production |
| `get_project` / `list_projects` / `list_teams` | Project management |
| `check_domain_availability_and_price` | Domain checking |
| `search_vercel_documentation` | Search docs |
| `get_access_to_vercel_url` / `web_fetch_vercel_url` | Access deployments |
| `list_toolbar_threads` / `get_toolbar_thread` / `reply_to_toolbar_thread` | Collaboration |
| `edit_toolbar_message` / `add_toolbar_reaction` / `change_toolbar_thread_resolve_status` | Thread management |

### Notion (14 tools) — Documentation & PM
| Tool | Purpose |
|------|---------|
| `notion-create-pages` | Create docs, briefs, templates |
| `notion-create-database` | Structured databases (roadmap, feedback) |
| `notion-create-view` | Board/table/calendar/chart views |
| `notion-search` | Find content across workspace |
| `notion-fetch` | Read page/database content |
| `notion-update-page` / `notion-update-view` / `notion-update-data-source` | Update content |
| `notion-move-pages` / `notion-duplicate-page` | Organize content |
| `notion-get-comments` / `notion-create-comment` / `notion-list-replies` | Collaboration |
| `notion-get-teams` / `notion-get-users` | Team info |

### Figma (15 tools) — Design
| Tool | Purpose |
|------|---------|
| `get_design_context` | Read designs (code + screenshot + hints) |
| `get_screenshot` | Visual preview |
| `get_metadata` / `get_variable_defs` | Design data |
| `use_figma` | Execute Figma Plugin API JavaScript |
| `create_new_file` | Write designs INTO Figma |
| `generate_diagram` | Create FigJam diagrams |
| `search_design_system` | Search components, styles |
| `create_design_system_rules` | Set up design system |
| `get_code_connect_map` / `add_code_connect_map` / `send_code_connect_mappings` / `get_code_connect_suggestions` | Code Connect |
| `get_figjam` / `whoami` | Utilities |

### 21st.dev Magic (4 tools) — Component Building
| Tool | Purpose |
|------|---------|
| `component_builder` | Build production React components |
| `component_inspiration` | Browse component ideas |
| `component_refiner` | Improve component quality |
| `logo_search` | Find logos/icons (SVG/JSX) |

### Browserbase/Stagehand (8 tools) — Browser Automation
| Tool | Purpose |
|------|---------|
| `browserbase_session_create` / `browserbase_session_close` | Session management |
| `browserbase_stagehand_navigate` | Navigate to URLs |
| `browserbase_stagehand_act` | Click, type, interact |
| `browserbase_stagehand_observe` | Find interactive elements |
| `browserbase_stagehand_extract` | Extract structured data |
| `browserbase_stagehand_agent` | Autonomous browser agent |
| `browserbase_screenshot` | Full-page screenshots |

### Canva (27 tools) — Marketing Design
| Tool | Purpose |
|------|---------|
| `generate-design` / `generate-design-structured` | AI-generated designs |
| `create-design-from-candidate` | Create from template |
| `get-design` / `get-design-content` / `get-design-pages` / `get-design-thumbnail` | Read designs |
| `start-editing-transaction` / `perform-editing-operations` / `commit-editing-transaction` / `cancel-editing-transaction` | Edit designs |
| `get-assets` / `upload-asset-from-url` | Asset management |
| `export-design` / `get-export-formats` | Export (PNG, PDF, PPTX, etc.) |
| `search-designs` / `search-folders` / `list-folder-items` | Search & browse |
| `create-folder` / `move-item-to-folder` | Organization |
| `list-brand-kits` | Brand consistency |
| `request-outline-review` / `get-presenter-notes` | Presentations |
| `list-comments` / `list-replies` / `comment-on-design` / `reply-to-comment` | Collaboration |
| `resize-design` / `import-design-from-url` / `resolve-shortlink` | Utilities |

### Context7 (2 tools) — Documentation Lookup
| Tool | Purpose |
|------|---------|
| `resolve-library-id` | Find library ID |
| `query-docs` | Get up-to-date API docs |

### Sequential Thinking (1 tool)
| Tool | Purpose |
|------|---------|
| `sequentialthinking` | Structured step-by-step problem solving |

### Zerodha Kite (24 tools) — Financial/Trading (for fintech SaaS)
| Tool | Purpose |
|------|---------|
| `login` / `get_profile` / `get_margins` | Account management |
| `get_ltp` / `get_ohlc` / `get_quotes` / `get_historical_data` | Market data |
| `place_order` / `modify_order` / `cancel_order` | Order management |
| `get_orders` / `get_order_history` / `get_order_trades` / `get_trades` | Trade history |
| `get_holdings` / `get_positions` / `get_mf_holdings` | Portfolio |
| `place_gtt_order` / `modify_gtt_order` / `delete_gtt_order` / `get_gtts` | GTT orders |
| `search_instruments` | Instrument search |

### MCP Tools to Add (Not Yet Connected)

| Server | Tools | Purpose | Setup |
|--------|-------|---------|-------|
| **Playwright** | ~10 | E2E testing, form filling, screenshots | `claude mcp add playwright -- npx @playwright/mcp@latest` |
| **Stripe** | 25 | Payments, subscriptions, invoices | `claude mcp add stripe --transport http https://mcp.stripe.com` |
| **GitHub** | ~15 | PRs, issues, repos, actions | `claude mcp add github-mcp-server -- npx github-mcp-server` |
| **Cloudflare** | 2 (Codemode) | DNS, CDN, Workers, R2 (2,500+ endpoints) | See cloudflare.com MCP docs |
| **Resend** | ~8 | Email send, contacts, domains, webhooks | See resend.com/mcp |
| **Sentry** | 19 | Errors, stack traces, AI fix suggestions | See docs.sentry.io/ai/mcp |
| **PostHog** | ~10 | Analytics, feature flags, A/B tests | See posthog.com/docs/mcp |
| **Upstash** | ~10 | Redis ops, backups, performance stats | See github.com/upstash/mcp-server |
| **BetterStack** | ~8 | Uptime, status pages, log analysis | See betterstack.com MCP docs |
| **Axiom** | ~5 | Log queries, trace analysis | See github.com/axiomhq/mcp |
| **Sanity** | 40+ | CMS documents, schemas, releases, AI media | See sanity.io/docs/ai/mcp-server |
| **Neon** | 20+ | Serverless Postgres, branch migrations | See neon.tech MCP docs |

---

## Codebase Tools (No MCP — Claude Generates Natively)

| Tool | Purpose | Why This One |
|------|---------|-------------|
| **Drizzle ORM** | Database queries & schema | 7.4kb bundle, pure TS inference, no codegen. Best for serverless. |
| **Better-Auth** | Authentication | Open-source, RBAC, orgs, 2FA, passkeys. Lucia Auth is deprecated. |
| **Inngest** | Background jobs | Event-driven, retries, step functions. For email queues, webhooks, cron. |
| **React Email** | Email templates | JSX-based templates. Pairs with Resend. |
| **Turborepo** | Monorepo builds | 70-85% faster builds. Vercel-optimized. |
| **Framer Motion** | Animations | Micro-interactions, page transitions. |
| **Vercel AI SDK v6** | AI features | Streaming, tool calling, multi-model. Essential for AI SaaS. |
| **MDX + Contentlayer** | Blog/docs | Markdown + React components. Static content in repo. |
| **Tally** | Forms | Free waitlists, feedback surveys. Unlimited forms. |
| **Termly / iubenda** | Legal | Privacy policy, ToS, cookie consent generators. |
| **next-intl** | i18n | Best i18n for Next.js App Router. Path-based routing. |
| **Razorpay** | India payments | UPI, cards, netbanking. Mandatory for India market. |
| **Paddle** | Merchant of Record | Handles ALL global tax. 5% + $0.50 per transaction. |
| **Crowdin / Tolgee** | Translation mgmt | AI-assisted translation with human review workflow. |
| **Frankfurter API** | Currency conversion | Free, open-source, ECB data. For display only. |

---

## Advanced: Stitch Build Loop Pattern

The `stitch-loop` skill uses an autonomous **baton-passing pattern**:

```
1. Generate screen via Stitch MCP
2. Integrate into site (React components)
3. Visual verification via Browserbase screenshot
4. Write next-prompt.md (context baton for next iteration)
5. Update SITE.md (progress roadmap)
6. Loop back to step 1 for next screen

Files maintained across iterations:
- DESIGN.md    -> Cross-page design consistency
- SITE.md      -> Progress tracking roadmap
- next-prompt.md -> Baton between iterations
```

---

## Advanced: Skill Execution Pipeline

The optimal order for using skills during build:

```
/codebase-context-mapper    -> Map architecture (if existing code)
    |
/superpowers:brainstorming  -> Explore idea and requirements
    |
/superpowers:writing-plans  -> Break into 2-5 min executable tasks
    |
/brand-architect             -> Full brand identity (strategy + visual + voice + code)
    |                            Outputs: brand-bible.md, brand-tokens.css,
    |                            tailwind.config.brand.js, design-tokens.json
    |
/enhance-prompt             -> Transform brand identity to Stitch prompts
    |
Stitch MCP generation       -> Generate UI screens (using brand design system)
    |
/stitch-loop                -> Iterate: generate -> review -> refine
    |
/design-md                  -> Synthesize DESIGN.md from Stitch
    |
/superpowers:using-git-worktrees -> Isolate feature branches
    |
/react-components           -> Convert Stitch -> React components
    |
/frontend-design            -> Quality gate: production aesthetics
    |
/shadcn-ui                  -> Integrate shadcn/ui components
    |
/superpowers:test-driven-development -> Red -> Green -> Refactor
    |
/superpowers:subagent-driven-development -> Parallelize modules
    |
/simplify                   -> Review code quality and efficiency
    |
/superpowers:systematic-debugging -> Debug failures
    |
/superpowers:verification-before-completion -> Verify before claiming done
    |
/superpowers:requesting-code-review -> Self-review
    |
/superpowers:finishing-a-development-branch -> Merge strategy
    |
/remotion                   -> Generate walkthrough video
    |
/schedule                   -> Set up recurring monitoring
    |
/loop                       -> Ongoing production monitoring
```

---

## Advanced: Post-Launch Marketing Pipeline

```
1. /ads-dna               -> Extract brand identity from live site
2. Pomelli (manual)        -> Generate brand-consistent social content
3. Canva MCP               -> Generate marketing designs + export
4. /ads-create             -> Campaign concepts and copy briefs
5. /ads-generate           -> AI-generated ad images (Nano Banana Pro)
6. /ads-photoshoot         -> Product photography (5 styles)
7. /ads-plan               -> Full advertising strategy
8. /ads-landing            -> Audit landing page for conversions
9. /ads-meta or /ads-google -> Platform-specific optimization
10. PostHog MCP            -> Track campaign attribution and conversions
```

---

## Environment Tool Inventory

**Total: 157 MCP tools across 12 connected servers**

| Server | Tools | Status | Category |
|--------|-------|--------|----------|
| Canva | 27 | Connected | Marketing Design |
| Zerodha Kite | 24 | Connected | Financial/Trading |
| Supabase | 20 | Connected | Backend/Database |
| Vercel | 18 | Connected | Deployment |
| Pencil.dev | 15 | Connected | Design (in-repo) |
| Figma | 15 | Connected | Design |
| Notion | 14 | Connected | Documentation/PM |
| Stitch | 12 | Connected | Design Generation |
| Browserbase/Stagehand | 8 | Connected | Browser Automation |
| 21st.dev Magic | 4 | Connected | Component Building |
| Context7 | 2 | Connected | Documentation Lookup |
| Sequential Thinking | 1 | Connected | Problem Solving |

**Addable: 170+ tools across 12 additional servers** (Playwright, Stripe, GitHub, Cloudflare, Resend, Sentry, PostHog, Upstash, BetterStack, Axiom, Sanity, Neon)

---

## Error Recovery (When Things Go Wrong)

```
INSTRUCTIONS FOR CLAUDE:
When a tool/skill/MCP fails, DO NOT stop. Use these fallbacks:

TOOL FAILURE         → FALLBACK
─────────────────────────────────────────────────────────
Stitch MCP down      → Use Pencil.dev MCP OR /frontend-design skill to
                       generate screens directly as React code
Supabase MCP error   → Use Bash to run psql/SQL commands directly, or
                       write migration files manually in db/migrations/
Vercel deploy fails  → Read build logs (get_deployment_build_logs), fix
                       error, redeploy. If persistent, deploy via CLI: `vercel`
Playwright MCP fails → Use Browserbase/Stagehand for testing instead, or
                       write Vitest unit tests as fallback
Notion MCP error     → Write docs as local .md files instead
Figma MCP error      → Use Stitch or Pencil instead
Canva MCP error      → Use /ads-generate for marketing images instead
GitHub MCP error     → Use git CLI commands directly via Bash
Browserbase down     → Use Playwright MCP for browser automation
Context7 down        → Use WebSearch to find library docs
brand-architect fails → Use /frontend-design + manual brand token creation
                       (create brand-tokens.css and tailwind.config.brand.js manually)
21st.dev Magic fails → Use /frontend-design to generate components
Razorpay API error   → Log error, continue building other features,
                       mark payment integration as BLOCKER for user
Any skill not found  → Check if installed. If not, skip and use the
                       closest available skill (e.g., /frontend-design covers
                       most of what design-ui-designer does)

GENERAL RULES:
- Log EVERY failure to .squad/decisions.md with: what failed, what fallback was used
- Never retry the same failing call more than twice
- If a phase is completely blocked, skip it and continue to the next phase
  (mark the skipped phase in TaskCreate as "blocked")
- At the end, report ALL skipped/fallback items to the user in one batch
```

---

## The "Final 20%" Warning

AI builds 80% of your SaaS in hours. The final 20% (polish, edge cases, integrations) can take as long as the rest. Manage this:

- **Fresh sessions**: Start a new Claude session for each major phase to avoid context drift
- **CLAUDE.md file**: Keep project-level rules ("MUST do X", "MUST NOT do Y") — absolute rules > suggestions
- **Modular PRD**: Machine-readable sections with acceptance criteria, not prose
- **2-5 minute tasks**: Break work into tiny tasks with exact file paths and verification steps
- **Git worktrees**: Use `/superpowers:using-git-worktrees` for parallel feature isolation

---

## Execution Flow Summary

```
 USER: "Here's my idea: [IDEA]"
 ──────────────────────────────────────────────────────────
 PRE-PHASE: SQUAD SETUP
 ├─ Create .squad/ directory (team, routing, decisions, agent charters)
 ├─ Define 6 specialist agents (Lead, Frontend, Backend, Payments, Tester, Designer)
 └─ Scribe starts logging all decisions
      |
 PHASE 0: QUESTIONS + CLAUDE.MD
 ├─ Ask all 28 questions in one message
 ├─ User answers everything
 ├─ Create CLAUDE.md with all decisions
 └─ Go fully autonomous
      |
 PHASE 1-3: RESEARCH (~10% of tokens)
 ├─ /brainstorming + WebSearch + Browserbase scraping
 ├─ Market research + Notion databases
 └─ Competitor analysis (extract, screenshot, compare)
      |
 ⚠️  VIABILITY GATE — GO / PIVOT / KILL
 ├─ Score 7 dimensions: money, AI-longevity, defensibility, timing,
 │   feasibility, founder-fit, India-fit
 ├─ AI-era kill test: "If OpenAI adds this feature, do users still need me?"
 ├─ Product type: SaaS? Tool? API? Extension? Marketplace? CLI?
 ├─ KILL = stop here, save 90% of tokens
 ├─ PIVOT = brainstorm alternatives, re-score
 └─ GO = user confirms, proceed to build (90% of tokens ahead)
      |
 PHASE 3.5: COMPLIANCE & MARKET STRATEGY
 ├─ India-first evaluation (does product fit Indian market?)
 ├─ Entity setup: Pvt Ltd + GST + IEC + LUT
 ├─ Per-country compliance matrix (DPDPA, GDPR, CCPA, LGPD)
 ├─ Payment strategy: Razorpay (all) + Paddle MoR (global tax)
 ├─ PPP pricing table + expansion roadmap
 └─ HUMAN: Register company, get GST, file LUT
      |
 PHASE 4-5: DEFINE
 ├─ PRD with user stories + Sequential Thinking
 └─ Business model & pricing
      |
 PHASE 6: ARCHITECTURE
 ├─ Stack: Next.js + Drizzle + Better-Auth + Razorpay + Paddle + Inngest
 ├─ DB schema via Supabase MCP + multi-country config
 ├─ Payment adapter pattern (Razorpay/Paddle)
 ├─ i18n: next-intl with /[locale]/ path routing
 └─ HUMAN: Create accounts, get API keys
      |
 PHASE 7-8: DESIGN
 ├─ Brand & design system (Stitch + Pencil + Figma + Canva)
 ├─ Generate all MVP screens (Stitch + enhance-prompt)
 └─ Iterate via stitch-loop + Browserbase verification
      |
 PHASE 9-10: BUILD (Squad Multi-Agent)
 ├─ Scaffold (shadcn + Drizzle + Better-Auth + Inngest)
 ├─ Squad routing: Frontend + Backend + Payments + Tester in parallel
 ├─ Cross-review: Tester reviews Frontend, Frontend reviews Backend
 ├─ Scribe logs all decisions to .squad/decisions.md
 └─ GitHub MCP for version control
      |
 PHASE 11: TEST
 ├─ Playwright MCP for E2E testing
 ├─ Browserbase/Stagehand for visual testing
 ├─ Supabase security + performance advisors
 └─ Code review + simplify
      |
 PHASE 11.5: WORLD-CLASS QUALITY AUDIT (ALL AGENTS IN PARALLEL)
 ├─ Designer: brand consistency, UX research, accessibility, delight
 ├─ Frontend: Lighthouse 90+, Core Web Vitals, responsive, dark mode
 ├─ Backend: query optimization, indexing, N+1 detection
 ├─ Security: RLS, XSS, CSRF, secrets scan, npm audit, CERT-In
 ├─ DevOps: CI/CD, monitoring, SLOs, rollback plan
 ├─ Writer: README, API docs, in-app copy, legal pages, error messages
 ├─ Reviewer: final code review, simplify, dead code removal
 └─ ALL fixes applied before deploy
      |
 PHASE 12: DEPLOY
 ├─ Vercel MCP deploy (region: bom1 for India-first)
 ├─ Cloudflare DNS/CDN
 ├─ Resend email verification
 ├─ Per-country legal pages (DPDPA, GDPR, CCPA, LGPD)
 ├─ GST invoicing + CERT-In logging compliance
 ├─ HUMAN: Set env vars, domain, webhooks, review legal
 └─ Launch assets (Canva + remotion + ads skills)
      |
 PHASE 13-14: LAUNCH & GROW
 ├─ PostHog analytics + feature flags
 ├─ Sanity CMS for blog/docs (or MDX)
 ├─ Canva + Pomelli + ads skills for marketing
 ├─ BetterStack uptime + Axiom logs + Upstash caching
 └─ /loop + /schedule for ongoing monitoring
```

---

## Sources & References

**MCP Servers:**
- [Playwright MCP](https://github.com/microsoft/playwright-mcp) — 29,700+ stars
- [GitHub MCP](https://github.com/github/github-mcp-server) — 28,000+ stars
- [Cloudflare MCP](https://developers.cloudflare.com/agents/model-context-protocol/)
- [Stripe MCP](https://docs.stripe.com/mcp)
- [Resend MCP](https://resend.com/mcp)
- [Sentry MCP](https://docs.sentry.io/ai/mcp/)
- [PostHog MCP](https://posthog.com/docs/model-context-protocol)
- [Supabase MCP](https://supabase.com/docs/guides/getting-started/mcp)
- [Vercel MCP](https://vercel.com/docs/mcp/vercel-mcp)
- [Notion MCP](https://developers.notion.com/docs/mcp)
- [Figma MCP](https://www.figma.com/blog/the-figma-canvas-is-now-open-to-agents/)
- [Sanity MCP](https://www.sanity.io/docs/ai/mcp-server)
- [Upstash MCP](https://github.com/upstash/mcp-server)
- [Axiom MCP](https://github.com/axiomhq/mcp)
- [BetterStack MCP](https://betterstack.com/docs/getting-started/integrations/mcp/)
- [Neon MCP](https://neon.tech/docs/ai/mcp)
- [Docker MCP Toolkit](https://www.docker.com/blog/add-mcp-servers-to-claude-code-with-mcp-toolkit/)

**Skills:**
- [Stitch Skills](https://github.com/google-labs-code/stitch-skills) — enhance-prompt, stitch-loop, react-components, design-md
- [Superpowers](https://github.com/obra/superpowers) — brainstorming, plans, TDD, subagents, debugging
- [Frontend Design Skill](https://claude.com/blog/improving-frontend-design-through-skills)

**Tools & Frameworks:**
- [Better-Auth](https://www.better-auth.com/) — recommended auth for 2026
- [Drizzle ORM](https://orm.drizzle.team/) — lightweight TS ORM
- [Inngest](https://www.inngest.com/) — background jobs
- [React Email](https://react.email/) — email templates
- [Pomelli](https://labs.google.com/pomelli/about) — Google Labs AI marketing
- [Nano Banana Pro](https://blog.google/innovation-and-ai/products/nano-banana-pro/) — Google image generation

**Skills Repositories:**
- [awesome-claude-skills](https://github.com/travisvn/awesome-claude-skills) — curated skill directory
- [Vercel Labs Next.js skills](https://github.com/nichochar/vercel-labs-skills)
- [Stripe AI skills](https://github.com/stripe/ai)
- [Better Auth agent skills](https://github.com/better-auth/agent-skills)
- [Supabase agent skills](https://github.com/supabase-community/supabase-agent-skills)
- [Cloudflare skills](https://github.com/nichochar/cloudflare-skills)
- [Web Quality Skills (Addy Osmani)](https://github.com/nichochar/web-quality-skills)
- [GRC Compliance Skills](https://github.com/Sushegaad/Claude-Skills-Governance-Risk-and-Compliance)
- [Docker Skill Package](https://github.com/OpenAEC-Foundation/Docker-Claude-Skill-Package)
- [Claude SEO Assistant](https://github.com/huifer/claude-code-seo)
- [Stitch Skills](https://github.com/google-labs-code/stitch-skills)
- [MJML Email Skill](https://github.com/framix-team/skill-email-html-mjml)
- [a11y Audit Skill](https://github.com/snapsynapse/skill-a11y-audit)
- [Framer Motion Skill](https://github.com/Schoepplake/framer-motion-skill)
- [Next.js Skills](https://github.com/wsimmonds/claude-nextjs-skills)

**Multi-Agent Orchestration:**
- [Squad (bradygaster)](https://github.com/bradygaster/squad) — persistent AI agent teams in your repo
- [How Squad Runs Coordinated AI Agents — GitHub Blog](https://github.blog/ai-and-ml/github-copilot/how-squad-runs-coordinated-ai-agents-inside-your-repository/)

**Best Practices:**
- [How to Write a Good CLAUDE.md](https://www.builder.io/blog/claude-md-guide)
- [PRDs for Claude Code](https://www.chatprd.ai/learn/PRD-for-Claude-Code)
- [Best Tech Stack for SaaS 2026](https://medium.com/@musman92/best-tech-stack-for-saas-applications-in-2026)

---

*Last updated: 2026-03-27*
*Version: 5.1 (FINAL) — Complete India-first SaaS blueprint. Squad multi-agent architecture (12 agents, 100+ skills). Added 20+ skills from awesome-claude-skills: Vercel Labs Next.js (official), Stripe (official), Better Auth (official), Supabase Postgres (official), Cloudflare (official), Web Quality/Lighthouse (Addy Osmani), GRC Compliance (GDPR/SOC2/HIPAA), Docker, SEO, a11y audit, MJML email, Framer Motion, i18n expert, documentation pipeline. Phase 3.5: Compliance & Market Feasibility with detailed India entity setup (Pvt Ltd, GST, LUT, IEC, EEFC, CERT-In, STPI), DPDPA 2023 compliance, GDPR with SCCs (India has no adequacy), CCPA, LGPD. Multi-country: next-intl, PPP pricing, payment adapters (Razorpay/Stripe/Paddle), country config layer, data residency architecture. 10 country compliance matrices. Post-launch compliance scaling checklist. 17 MCP tools, 30+ skills, 157+ connected tools.*
