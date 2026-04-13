# Blueprint Build — Phases 0–12

> **Purpose**: Take answered Phase-0 questions + credentials → deployed SaaS with
> full brand theme and production assets. Read this after `BLUEPRINT.md` index.
>
> **When stuck**: Check `.squad/decisions.md`, then `Error Recovery` at the bottom.

---

## Pre-Phase: Squad Setup (Multi-Agent Architecture)

Before Phase 0, create `.squad/` in the project root. Based on
[bradygaster/squad](https://github.com/bradygaster/squad) patterns.

```
.squad/
├── team.md              # Roster (10 agents)
├── routing.md           # Which agent handles what
├── decisions.md         # Shared brain — EVERY decision logged here
├── decisions/inbox/     # Drop-box for parallel agent writes
├── agents/
│   ├── lead/charter.md       # Orchestrator — DISPATCHER ONLY, never writes code
│   ├── designer/charter.md   # brand-architect, Stitch, UX research, assets
│   ├── frontend/charter.md   # React, shadcn, Framer Motion, responsive
│   ├── backend/charter.md    # Supabase, Drizzle, Better-Auth, Inngest
│   ├── payments/charter.md   # Razorpay, Paddle, webhooks, subscriptions
│   ├── tester/charter.md     # Playwright, Browserbase, TDD
│   ├── security/charter.md   # RLS, secrets, vuln scan, CERT-In
│   ├── reviewer/charter.md   # Code review, simplify (cross-review only)
│   ├── devops/charter.md     # CI/CD, Vercel, Cloudflare, SRE
│   ├── writer/charter.md     # Docs, in-app copy, legal pages
│   └── scribe/charter.md     # SILENT — appends every decision to decisions.md
└── log/                      # Session history
```

**Rules**:
- Every architectural decision → append to `decisions.md` with date + rationale
- Agents NEVER work outside their charter
- Lead is dispatcher only — never writes code itself
- Code review: DIFFERENT agent reviews (never self-review)
- Parallel fan-out via `/superpowers:dispatching-parallel-agents`

---

## Phase 0 — Grill + Credentials + CLAUDE.md

**Skill**: `superpowers:brainstorming` (internally, after answers received)

```
CLAUDE:
1. Read BLUEPRINT.md (the index) — get the question bank.
2. Ask ALL 33 questions in ONE message, grouped by category.
   - If user's opening prompt already answered some, skip those.
   - Mark optional vs required.
3. WAIT for the user's single answer message.
4. After answers:
   a. Write CLAUDE.md (template below)
   b. Create .squad/ directory with 10 agent charters
   c. Create TaskCreate list for all 14 phases
   d. Internally invoke /superpowers:brainstorming to refine the idea
      — DO NOT ask more questions
   e. If Notion MCP connected: create project hub page
5. Go autonomous through Phase 1 → Phase 12.
6. AUTONOMY RULES:
   - Make decisions yourself. Don't ask "X or Y?" — pick, log to decisions.md
   - If a tool/MCP fails, use the Error Recovery fallback
   - Run parallel subagents wherever possible
   - Commit code regularly with descriptive messages
   - One-line progress update per phase, no verbose summaries
```

### CLAUDE.md Template

```markdown
# CLAUDE.md — Project Rules (auto-generated Phase 0)

## Product
- Name: {Q18}
- One-liner: {Q1}
- Core feature: {Q3}
- Target user: {Q2}
- Markets: {Q4}
- Form factor: {Q9}

## Stack (defaults — override only with explicit reason)
- Framework: Next.js 15+ App Router + TypeScript strict + Tailwind v4
- UI: shadcn/ui + Radix + Framer Motion
- ORM: Drizzle
- DB: Supabase (Postgres + RLS + Realtime)
- Auth: Better-Auth (RBAC, orgs, 2FA, passkeys)
- Payments: Razorpay (India) + Paddle MoR (global)
- Email: Resend + React Email
- Jobs: Inngest
- i18n: next-intl
- Analytics: PostHog
- Errors: Sentry
- Hosting: Vercel (region bom1 for India-first)
- CDN/DNS: Cloudflare

## Absolute Rules
- MUST use Razorpay for Indian payments
- MUST store payment data in India (RBI)
- MUST implement RLS on ALL Supabase tables
- MUST use brand-tokens.css for ALL colors/fonts
- MUST put user-facing strings in next-intl translation files
- MUST log all decisions to .squad/decisions.md
- MUST run /verification-before-completion before claiming work is done
- MUST NOT use `any` in TypeScript
- MUST NOT skip tests for auth, payments, core CRUD
- MUST NOT ask the user questions after Phase 0 (except VIABILITY GATE)
- MUST generate all assets (logo, favicon, OG, screenshots, demo video) before deploy

## Credentials (from Phase 0)
SUPABASE_URL=...
SUPABASE_ANON_KEY=...
SUPABASE_SERVICE_ROLE_KEY=...
RAZORPAY_KEY_ID=...
RAZORPAY_KEY_SECRET=...
RAZORPAY_WEBHOOK_SECRET=...
# (all other keys from Phase 0)

## Brand Input (feeds Phase 7 brand-architect)
- Feel: {Q13}
- Persona: {Q14}
- Loved/hated sites: {Q15}
- Color direction: {Q16}
- Dark mode: {Q17}

## Compliance
- Entity: {Q31}
- Target countries: {Q4}
- Regulations: DPDPA (India) + {per-country from Phase 3.5}
- Languages at launch: {Q33}
```

---

## Phase 1 — Idea Discovery & Brainstorming

**Goal**: Transform vague idea → crisp validated concept.

**Skill**: `superpowers:brainstorming`

```
1. Invoke /superpowers:brainstorming internally (no user questions)
2. Explore: pain point, who experiences it, frequency, current workarounds, WTP
3. WebSearch — Reddit, X, Indie Hackers, Product Hunt, G2 for pain validation
4. Browserbase — navigate competitor sites, extract feature lists + pricing
5. Output IDEA-BRIEF.md
```

**Deliverable**: `IDEA-BRIEF.md` — problem, persona, existing solutions, gaps, confidence score

---

## Phase 2 — Market & Problem Research

**Goal**: Quantify the opportunity.

```
1. WebSearch — TAM/SAM/SOM, growth trends, pricing benchmarks
2. Browserbase — extract reviews from G2/Capterra/Trustpilot
3. Build competitive landscape map
4. Draft user interview question template
```

**Deliverable**: `MARKET-RESEARCH.md` — TAM/SAM/SOM, top competitors, trends, interview template

---

## Phase 3 — Competitor Analysis

**Goal**: Find the gap you can own.

```
1. For each competitor:
   - Browserbase: navigate, extract features, pricing, positioning
   - WebSearch G2/Capterra reviews (filter 1-3 star for pain points)
   - Extract changelog for feature trajectory
2. Feature comparison matrix
3. Identify #1 gap — what are users consistently complaining about?
4. Define positioning: cheaper / simpler / more powerful / niche-specific
```

**Deliverable**: `COMPETITOR-ANALYSIS.md` — feature matrix, pricing comparison, gap analysis, positioning

---

## VIABILITY GATE — GO / PIVOT / KILL (MANDATORY CHECKPOINT)

> **THIS IS THE ONLY PHASE WHERE CLAUDE STOPS AND WAITS FOR THE USER.**
> Everything before costs ~10% of tokens. Everything after costs ~90%.
> Be BRUTALLY honest. The user wants truth, not encouragement.

### 7-Dimension Scorecard (score each 1-10)

| # | Dimension | Key questions |
|---|-----------|---------------|
| 1 | **Money potential** | Are people ALREADY paying? Realistic 12-month MRR? Can you charge enough to cover costs? |
| 2 | **AI-era longevity** | Will AI make this obsolete in 6-18 months? Is this a wrapper? Data moat? If OpenAI adds this feature tomorrow, do users still need you? |
| 3 | **Competitive defensibility** | How many competitors? Funded? Solo-dev viable? Time to clone? |
| 4 | **Market timing** | Growing / stable / shrinking? Early / on time / late? Tailwinds? |
| 5 | **Execution feasibility** | Solo + AI buildable? Needs data/partnerships/licenses? Days/weeks/months to MVP? |
| 6 | **Founder-market fit** | Domain expertise? Would they use it? Can they reach the audience? |
| 7 | **India market fit** | Makes sense for India? PPP affordability? Can Indian users be early case studies? |

**Scoring bands** (out of 70):
- **50–70 → GO** ✅ Proceed to Phase 3.5
- **35–49 → CONDITIONAL GO** ⚠️ Fix weakest dim or pivot
- **20–34 → PIVOT** 🔄 Suggest 2–3 alternative forms, re-score
- **<20 → KILL** ❌ Stop, save the tokens, recommend what to research next

### AI-Era Longevity Test

**DIE in the AI era**: GPT wrappers, AI writers, AI image gens, AI chatbot builders, AI summarizers — anything where the entire value is one AI API call.

**SURVIVE and thrive**: Vertical SaaS with domain data, workflow tools (AI is a feature not the product), data platforms, integration layers, compliance tools, two-sided marketplaces, dev tools with ecosystem lock-in, AI+human judgment products.

**Golden test**: *"If OpenAI/Anthropic/Google adds this exact feature to their product tomorrow, would my users still use my product?"* YES → durable. NO → fragile.

### Product Type Classification

Determine what this actually IS. It may not be a SaaS. Adapt the pipeline:

| Type | Monetization | Adaptation |
|---|---|---|
| Pure SaaS | Subscription | Full pipeline |
| Tool/Utility | Freemium / one-time | Skip marketing-heavy phases |
| API Product | Usage-based | Skip heavy branding, add OpenAPI docs |
| Marketplace | Transaction fee | Add supply + demand sides |
| Browser Extension | Freemium | Manifest V3 + Chrome Web Store |
| Mobile App | Sub / IAP | React Native + App Store |
| CLI Tool | Freemium / pro | Skip design, npm/brew distribution |
| Open Source + Paid | Hosted / pro | Community-first |
| Template/Boilerplate | One-time | Code quality IS the product |
| Chrome Extension | Freemium | Different deploy |
| Shopify/WP App | Freemium / usage | Platform-specific review |

**Claude MUST write to .squad/decisions.md**: `PRODUCT TYPE: {type}. Adapting phases [X, Y, Z].`

### Present to User — WAIT FOR "GO"

Show full scorecard + reasoning + decision. Wait for explicit user "GO" (or "pivot" / "kill").

**Deliverable**: `VIABILITY-REPORT.md` — scorecard, AI-era assessment, product type, GO/PIVOT/KILL, adapted phase list.

---

## Phase 3.5 — Compliance, Feasibility & Market Strategy (India-First)

**Goal**: Determine WHERE to launch, WHAT compliance applies, HOW to structure for multi-country.

### Market Fit Decision Tree

```
Does this product fit the Indian market?
├── YES → Build India-first. Also fits global? → plan expansion.
└── NO  → Pick top country with best market fit. Check FEMA/RBI to launch from India.
```

**Default expansion order**: India → US/Canada → UK/EU → LATAM → SEA → Middle East.

### India Entity Setup (ASYNC — user handles alongside build)

**Recommended**: Private Limited Company (Pvt Ltd)
- Register with MCA (~INR 7-15K, via Razorpay Rize / Vakilsearch / ClearTax)
- PAN + TAN for company
- GST (mandatory if revenue > ₹20L or interstate). SaaS = SAC 998314. Domestic 18%, exports 0% with LUT.
- **IEC** from DGFT (free, lifetime — required for foreign payments)
- **LUT** (Form GST RFD-11) — zero-rates SaaS exports. File BEFORE first export. Renew by March 31 annually.
- **DPIIT recognition** at startupindia.gov.in (80-IAC tax holiday, angel tax exemption)
- Current account (HDFC / ICICI / Razorpay X)
- **EEFC account** — hold forex, pay SaaS tools in USD
- CERT-In PoC registration
- SOFTEX filing via STPI for exports > ₹5L
- CA engagement for GST + international tax (INR 50K-2L setup)

**Why Pvt Ltd over LLP**: VCs prefer it, DPIIT benefits, FDI automatic route, ESOPs possible, LLP can't issue shares.

### Compliance Matrix (Per Target Country)

**INDIA**:
- **DPDPA 2023** — consent (free, specific, informed), children under 18 need verifiable parental consent (stricter than GDPR's 16), cross-border allowed except blacklist, penalties up to ₹250 crore
- **CERT-In Directions (April 2022)** — report cyber incidents within **6 HOURS**, maintain ICT logs **180 days in India**, NTP sync, designated PoC
- **IT Act 2000 + Rules 2021** — Section 43A reasonable security, grievance officer (24h ack, 15 day resolve)
- **RBI** — payment data ONLY in India, card-on-file tokenization mandatory, Razorpay/Cashfree handle this
- **Consumer Protection E-Commerce Rules 2020** — display legal name, GSTIN, total price, refund policy, grievance officer
- **GST** — 18% domestic, 0% exports with LUT, GSTIN on all invoices

**USA**:
- No federal privacy law. State laws: CCPA/CPRA (CA), Virginia CDPA, Colorado CPA, Connecticut DPA, COPPA (<13)
- Sales tax varies by state — use Paddle MoR OR Stripe Tax
- CAN-SPAM, ADA web accessibility, SOC 2 for enterprise

**EU (GDPR)**:
- Lawful basis (consent / legitimate interest / contract)
- Explicit OPT-IN cookie consent (not opt-out), granular, no pre-ticked boxes
- Data breach notification within 72h
- India has NO adequacy decision → use SCCs (2021) + Transfer Impact Assessment
- **EU Representative required** (Art. 27) — use DataRep or Prighter (~€120/yr)
- ROPA, DPA for B2B, VAT collection per country (use OSS or MoR)
- 14-day right of withdrawal for digital services (can be waived at checkout with explicit consent)

**UK (post-Brexit)**: UK GDPR + ICO registration + UK representative + 20% VAT.

**Brazil**: LGPD, PIX/Boleto payments, NF-e may be required.

**Singapore**: PDPA, no localization, easy from India.

**UAE**: DIFC/ADGM rules, Arabic, RTL UI, local gateways.

**Japan**: APPI, strict transfer rules, Japanese language, JCB + Konbini.

### Payment Strategy (India-Based Company)

**India customers**:
- Razorpay primary (UPI, cards, netbanking, wallets, EMI, e-mandate)
- Pricing INR + 18% GST
- GST-compliant invoices (GSTIN, SAC 998314)

**Global customers** — pick one:
- **Option A (easiest)**: Paddle MoR — 5% + $0.50, handles ALL global tax
- **Option B (control)**: Razorpay International — ~3%, INR settlement, unified dashboard, you handle tax
- **Option C (payouts)**: Cashfree Global — if you need strong disbursement API

**Why NOT Stripe**: FEMA/RBI friction, Razorpay is RBI-compliant ground-up, better UPI/netbanking. Only use Stripe if you have a US entity (Stripe Atlas $500).

### PPP Pricing Tiers

| Tier | Discount | Countries |
|---|---|---|
| 0 Full | 0% | US, UK, CH, NO, AU |
| 1 Slight | 0-10% | CA, DE, FR, JP, KR |
| 2 Moderate | 20-30% | ES, PT, PL, CL, MY |
| 3 Significant | 40-50% | BR, MX, TR, TH, ZA |
| 4 Heavy | 60-70% | IN, ID, VN, PH |
| 5 Maximum | 70-80% | PK, BD, ET, MM |

Detect via Vercel geo headers (free). Apply discount to base USD. Display in local currency with `Intl.NumberFormat`. At checkout, verify IP country matches billing country (prevent VPN abuse).

### Data Residency

- **Frontend**: Vercel global CDN
- **Serverless**: Set Vercel function region to `bom1` (Mumbai) for India-first
- **Primary DB**: Supabase AWS ap-south-1 (Mumbai)
- **EU enterprise**: separate Supabase in eu-central-1, route via middleware
- **Payment data**: MUST be in India (RBI) — Razorpay handles this
- **CERT-In logs**: 180 days in India (AWS CloudWatch ap-south-1)

**Deliverable**: `COMPLIANCE-STRATEGY.md` — markets ranked, entity checklist, per-country compliance, payment decision, PPP table, data residency, post-launch scaling checklist.

---

## Phase 4 — Product Definition

**Skill**: `superpowers:writing-plans`

```
1. Define ICP (job title, company size, context, budget authority)
2. Value prop: "For [user] who [need], [product] is a [category] that [benefit].
   Unlike [alternative], we [differentiator]."
3. List ALL features → ruthlessly cut to the ONE that solves core problem
4. Classify: Must-have (MVP) / Should-have (v1.1) / Nice-to-have (v2+)
5. Write PRD with user stories + acceptance criteria
6. Define success metrics (activation, retention, revenue)
```

**Deliverable**: `PRD.md` — ICP, value prop, MVP scope, user stories, success metrics, out-of-scope list

---

## Phase 5 — Business Model

```
1. Pricing model: subscription / usage / freemium / per-seat
2. Design 2-3 pricing tiers (use competitor research from Phase 3)
3. Free/paid split if freemium (gate features that drive upgrade)
4. Unit economics: CAC, LTV, LTV:CAC ratio (target >3), payback period
5. Billing flow: monthly + annual (20% discount), 14-day trial
6. INR + USD pricing with PPP for other markets
```

**Deliverable**: `BUSINESS-MODEL.md` — pricing table, free/paid split, unit economics, billing flow

---

## Phase 6 — Tech Stack & Architecture

**Skill**: `superpowers:writing-plans`

### Default Stack (2026)

```
Framework     Next.js 15+ App Router + TypeScript strict
Styling       Tailwind v4
UI            shadcn/ui + Radix
Animation     Framer Motion
ORM           Drizzle (7.4kb, pure TS inference)
DB            Supabase (Postgres + RLS + Realtime)
Auth          Better-Auth (RBAC, orgs, 2FA, passkeys)
Pay-India     Razorpay
Pay-Global    Paddle MoR OR Razorpay Intl
Email         Resend + React Email
Jobs          Inngest
Hosting       Vercel (region bom1)
CDN/DNS       Cloudflare
Analytics     PostHog
Errors        Sentry
Storage       Supabase Storage or Cloudflare R2
AI (if used)  Vercel AI SDK v6
i18n          next-intl (path-based routing)
Blog/Docs     MDX + Contentlayer or Sanity
```

**Why these**:
- Better-Auth over Clerk: open-source, no vendor lock-in, built-in RBAC + orgs
- Drizzle over Prisma: tiny bundle, pure TS, faster cold starts
- Inngest over raw cron: event-driven, retries, step functions, observability

### Actions

```
1. Design DB schema from PRD features
2. Plan API routes and data flow
3. Design payment adapter pattern (Razorpay / Paddle / Stripe interface)
4. Country config layer (config/countries.ts)
5. Background job definitions (Inngest functions)
6. List all env vars needed → Phase 9 human blocker if missing
7. Supabase MCP: apply_migration for each table + RLS policies
8. generate_typescript_types for type safety
```

**Deliverable**: `ARCHITECTURE.md` — stack, schema SQL, API route map, job definitions, env checklist

---

## Phase 7 — BRAND THEME (non-negotiable before any UI)

**Skills**: `brand-architect` → `enhance-prompt`

> **CRITICAL**: Phase 8 cannot start until this phase produces brand-bible.md,
> brand-tokens.css, and tailwind.config.brand.js. Phase 10 cannot start until
> those files are imported into the scaffold.

### Naming (if not decided)

1. Generate 10+ name candidates
2. Check domains via `mcp__claude_ai_Vercel__check_domain_availability_and_price`
3. Score on memorability, relevance, availability
4. Pick the best — don't ask user (autonomous mode)
5. Log choice to `.squad/decisions.md`

### Run brand-architect in AUTONOMOUS mode

`brand-architect` normally asks 8-12 interactive questions with checkpoints. In autonomous mode, **skip interviews and gates** — use Phase 0 answers (Q13-17) as input.

Run all 6 brand-architect phases end-to-end:

| Phase | Output |
|---|---|
| 1. Brand Brief | Compiled from Q13-17 |
| 2. Brand Strategy | Purpose, vision, mission, values, positioning |
| 3. Visual Direction | Pick best of 3 directions using user prefs |
| 4. Full Brand Bible | Colors, typography, spacing, shadows, border-radius, voice |
| 5. Code Artifacts | **brand-tokens.css** (light + dark), **tailwind.config.brand.js**, **design-tokens.json** (W3C) |
| 6. Pipeline Handoff | Save files, prepare for Phase 8 |

### Mandatory Outputs (verify all exist before Phase 8)

```
[ ] brand-bible.md            — strategy + visual + voice spec
[ ] brand-tokens.css          — CSS custom props, light + dark modes
[ ] tailwind.config.brand.js  — Tailwind theme extension
[ ] design-tokens.json        — W3C format (portable)
```

### Feed brand into design tools

```
Stitch (PRIMARY — screen generation):
  mcp__stitch__create_project
  mcp__stitch__create_design_system  ← apply brand colors, fonts, roundness

Pencil (alternative — in-repo designs):
  pencil get_guidelines(topic="design-system")
  pencil set_variables  ← apply brand tokens

Canva (for marketing assets — Phase 8):
  mcp__claude_ai_Canva__list-brand-kits
```

### Fallback

If `brand-architect` skill unavailable: use `/frontend-design` + manually create brand-tokens.css and tailwind.config.brand.js from Q13-17 answers. Log fallback to decisions.md.

**Deliverable**: Brand-bible.md + tokens + tailwind config + design-tokens.json

---

## Phase 8 — Screens + ASSETS (non-negotiable before deploy)

**Skills**: `enhance-prompt` → `stitch-loop` → `design-md` → `design-image-prompt-engineer`

> **Assets to produce — ALL must exist before Phase 12 deploy.** Claude verifies
> this in Phase 11.5 audit.

### 8A — Generate Screens (Stitch)

```
1. /enhance-prompt — turn brand-bible.md into Stitch-optimized prompts per screen
2. For each MVP screen:
   a. mcp__stitch__generate_screen_from_text with brand + prompt
   b. mcp__stitch__generate_variants for alternatives
   c. mcp__stitch__apply_design_system for consistency
   d. mcp__stitch__edit_screens for refinement
3. /stitch-loop — iterative baton-passing (next-prompt.md + SITE.md + DESIGN.md)
4. /design-md — synthesize DESIGN.md from Stitch project
```

**Typical MVP screen set**:
- Landing page (hero + features + pricing + social proof + CTA)
- Sign-up / Sign-in
- Onboarding flow (2-3 steps)
- Dashboard (main app view)
- Core feature screen(s)
- Settings (profile + account + team)
- Billing / pricing
- 404 / error / empty states

**Verify visually** via Browserbase screenshot of live Stitch previews.

### 8B — Logo + Brand Mark

```
1. Use /design-image-prompt-engineer to craft logo prompts from brand-bible
2. Generate via Nano Banana Pro (Gemini) OR 21st.dev Magic logo_search
3. Produce:
   [ ] logo.svg              — primary full logo
   [ ] logo-dark.svg         — for dark backgrounds
   [ ] logo-light.svg        — for light backgrounds
   [ ] logo-mark.svg         — icon-only (favicon base)
   [ ] logo-monochrome.svg   — single-color for print/watermarks
4. Validate contrast vs brand background (WCAG AA)
5. Save under /public/brand/
```

### 8C — Favicon Set

```
Generate from logo-mark.svg:
[ ] favicon.ico               (32x32, 16x16 multi-size)
[ ] favicon-32.png
[ ] favicon-16.png
[ ] apple-touch-icon.png      (180x180)
[ ] android-chrome-192.png
[ ] android-chrome-512.png
[ ] manifest.webmanifest      (PWA manifest with brand colors)
```

### 8D — OG + Social Cards

```
Use Canva MCP (generate-design + export-design) OR Nano Banana Pro:
[ ] og-image.png              (1200x630 — OpenGraph default)
[ ] twitter-card.png          (1200x675 — large summary card)
[ ] linkedin-share.png        (1200x627)
[ ] social-card-variants/     (hero variant per marketing channel)

Each card must use brand-tokens.css colors + typography.
Include: product name, one-line pitch, brand mark.
```

### 8E — App Screenshots

```
After Phase 11 (app is working):
1. Playwright MCP — navigate through key flows in dev mode
2. Browserbase screenshot at 1440x900 + 375x812 for each screen:
   [ ] screenshot-landing.png
   [ ] screenshot-dashboard.png
   [ ] screenshot-core-feature.png
   [ ] screenshot-settings.png
   [ ] mobile-screenshot-landing.png
   [ ] mobile-screenshot-dashboard.png
3. Save under /public/marketing/screenshots/
4. These feed: Product Hunt listing, landing page, ads, README
```

### 8F — Demo Video (~60s walkthrough)

```
Use /remotion skill:
1. Script a 60-second walkthrough:
   0-5s   — Hook (problem statement)
   5-15s  — Core feature demo
   15-35s — Key benefits (3 features)
   35-50s — Social proof / differentiator
   50-60s — CTA (visit site)
2. Remotion composition with:
   - Brand colors from brand-tokens.css
   - Brand fonts
   - Screenshots from 8E as backgrounds
   - Voiceover via ElevenLabs (optional)
3. Render mp4 at 1920x1080 60fps
4. Save as /public/marketing/demo-video.mp4
5. Upload preview to YouTube (optional, via user action)
```

### 8G — README Hero Assets

```
[ ] README-banner.png         (1280x640 — GitHub README top)
[ ] architecture-diagram.svg  (generated via Figma MCP generate_diagram)
```

### Deliverables

```
/public/brand/               Logos + favicons + manifest
/public/marketing/           OG + screenshots + demo video + social cards
DESIGN.md                    Design system documentation
SITE.md                      Screen + page roadmap
Stitch project               All MVP screens, iterated
```

**Verify count**: Phase 11.5 audit MUST confirm all of the above files exist.

---

## Phase 9 — Scaffold + Integrations

**Skills**: `superpowers:writing-plans` → `shadcn-ui` → `superpowers:using-git-worktrees`

```bash
# Scaffold
npx create-next-app@latest [name] --typescript --tailwind --eslint --app --src-dir --import-alias "@/*"

# UI — APPLY BRAND-ARCHITECT OUTPUTS
npx shadcn@latest init
# Copy tailwind.config.brand.js into tailwind.config.ts
# Copy brand-tokens.css into src/app/globals.css
# Copy logos/favicons/assets from Phase 8 into /public/

npm i framer-motion
npm i drizzle-orm postgres
npm i -D drizzle-kit
npm i better-auth
npm i razorpay
npm i resend @react-email/components
npm i inngest
npm i posthog-js @sentry/nextjs
npm i next-intl
```

### Project structure

```
src/
├── app/
│   ├── (auth)/            Auth routes
│   ├── (dashboard)/       Protected app routes
│   ├── (marketing)/       Public pages
│   ├── api/
│   │   ├── webhooks/      Razorpay, Paddle, auth
│   │   ├── inngest/
│   │   └── ...
│   ├── layout.tsx
│   └── page.tsx
├── components/
│   ├── ui/                shadcn
│   └── emails/            React Email templates
├── db/
│   ├── schema.ts          Drizzle
│   ├── migrations/
│   └── index.ts
├── inngest/
│   ├── client.ts
│   └── functions/
├── lib/
│   ├── auth.ts            Better-Auth config
│   ├── payments/
│   │   ├── adapter.ts     PaymentAdapter interface
│   │   ├── razorpay.ts
│   │   └── paddle.ts
│   ├── email.ts
│   └── utils.ts
├── config/
│   ├── countries.ts       Per-country config
│   └── ppp.ts             PPP discount table
├── messages/              next-intl translation files
│   ├── en.json
│   └── hi.json
└── content/
    └── legal/             Per-country legal (MDX)
        ├── IN/
        ├── US/
        └── EU/

public/
├── brand/                 Logos + favicons + manifest (from Phase 8)
└── marketing/             OG + screenshots + demo video (from Phase 8)
```

### Env vars

```
# Supabase
DATABASE_URL=
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=

# Better-Auth
BETTER_AUTH_SECRET=   # openssl rand -base64 32
BETTER_AUTH_URL=http://localhost:3000

# Payments
RAZORPAY_KEY_ID=
RAZORPAY_KEY_SECRET=
RAZORPAY_WEBHOOK_SECRET=
# PADDLE_API_KEY=
# PADDLE_WEBHOOK_SECRET=

# Email / Analytics / Errors / Jobs
RESEND_API_KEY=
NEXT_PUBLIC_POSTHOG_KEY=
SENTRY_DSN=
INNGEST_EVENT_KEY=
INNGEST_SIGNING_KEY=
```

### Database setup

```
1. Supabase MCP apply_migration for each table
2. RLS policies on EVERY table (no exceptions)
3. Supabase MCP generate_typescript_types → /src/db/types.ts
4. Supabase MCP get_advisors(type="security") — fix all issues before Phase 10
```

### Git init

```
git init
git add .
git commit -m "initial scaffold with brand theme applied"
# GitHub MCP: create repo, push
```

---

## Phase 10 — Build Core Features (Squad Parallel)

**Skills**: `superpowers:executing-plans` → `superpowers:subagent-driven-development` → `superpowers:test-driven-development` → `react-components` → `frontend-design`

### Squad routing

```
LEAD (main session): reads decisions.md, routes work via routing.md

FRONTEND agent  → Convert Stitch screens to React, dashboard, onboarding, settings
                  Uses: react-components, frontend-design, shadcn-ui, next-best-practices

BACKEND agent   → Better-Auth flow, Drizzle schema, server actions, API routes, Inngest jobs
                  Uses: Supabase MCP, Context7, engineering-backend-architect

PAYMENTS agent  → Razorpay Checkout, Paddle MoR, webhooks (idempotent), billing portal, subscription mgmt
                  Uses: payment adapter pattern

TESTER agent    → Writes tests FROM spec while others implement
                  Uses: Playwright MCP, Browserbase MCP, test-driven-development

SCRIBE          → Logs every decision to .squad/decisions.md (silent background)

RULE: Tester reviews Frontend. Frontend reviews Backend. NEVER self-review.
```

### Build order (dependencies matter)

```
a. Auth (sign-up, sign-in, middleware, protected routes, social login)
b. DB layer (Drizzle schema, queries, server actions)
c. Dashboard layout (sidebar, nav, user menu, notifications bell)
d. Core feature screens (THE value of the product)
e. Settings (profile, account, team)
f. Account deletion flow       ← DPDPA + GDPR: right to erasure
g. Data export (JSON/CSV)      ← GDPR: right to portability
h. Billing (pricing page, checkout, subscription mgmt)
i. Webhook handlers with IDEMPOTENCY (Razorpay/Paddle fire 2x)
j. Background jobs (emails, webhooks, scheduled)
k. Notification system (in-app table + email via Inngest)
l. Audit log (audit_logs table — compliance requirement)
m. Landing page (marketing site — uses Phase 8 screenshots + OG)
n. Onboarding flow
o. Email templates (welcome, onboarding, billing — React Email)
p. Favicon + OG + manifest wiring (using Phase 8 assets)
```

### TDD loop per feature

```
1. /superpowers:test-driven-development
2. Write failing test → implement → verify green
3. /simplify after major features
4. Git worktree per independent feature (isolation)
5. Commit often with descriptive messages
```

---

## Phase 11 — Testing + Quality

**Skills**: `superpowers:test-driven-development` → `superpowers:systematic-debugging` → `superpowers:verification-before-completion` → `superpowers:requesting-code-review`

### Critical path tests (Playwright MCP)

```
[ ] Auth: sign up → sign in → dashboard → sign out
[ ] Payments: select plan → checkout → webhook → subscription active
[ ] Core: CRUD for main feature
[ ] Billing: upgrade → downgrade → cancel → resubscribe
[ ] Onboarding: complete flow → reach dashboard
[ ] Email: trigger event → verify sent (Resend MCP)
[ ] Data export works end-to-end
[ ] Account deletion works (DPDPA/GDPR)
```

### Visual / AI testing (Browserbase Stagehand)

```
- stagehand_observe: verify interactive elements on each page
- stagehand_act: test user flows with natural language
- browserbase_screenshot: visual regression snapshots
- stagehand_extract: verify page content
```

### Security checklist

```
[ ] All Supabase tables have RLS
[ ] Supabase get_advisors(type="security") — no issues
[ ] API routes validate auth
[ ] Razorpay + Paddle webhooks verify signatures
[ ] No secrets in client-side code (grep patterns)
[ ] CSRF protection on forms
[ ] Security headers set (CSP, HSTS, X-Frame-Options)
[ ] npm audit — no high/critical vulns
```

### Performance

```
[ ] Supabase get_advisors(type="performance") — no issues
[ ] No N+1 queries
[ ] Indexes on hot columns
[ ] Lighthouse ≥ 90 on all metrics
[ ] Core Web Vitals: LCP <2.5s, FID <100ms, CLS <0.1
```

---

## Phase 11.5 — World-Class Quality Audit (Parallel Fan-Out)

> This makes the difference between "AI built this" and "world-class."
> Run ALL audits simultaneously via Squad parallel fan-out.

```
DESIGNER audit
├── Brand consistency — every screen matches brand-bible.md exactly
├── /design-brand-guardian — colors, fonts, spacing, radius, shadows
├── /design-ux-researcher — 3-click test, primary action obvious, error states
├── /design-inclusive-visuals-specialist — WCAG AA contrast, 44x44 touch targets,
│   keyboard nav, screen reader labels, no color-only info
├── /design-whimsy-injector — 3-5 moments of delight (loading, empty, 404)
├── VERIFY all Phase 8 assets exist:
│   [ ] logo set (5 variants)
│   [ ] favicon set (7 files + manifest)
│   [ ] OG + social cards
│   [ ] app screenshots (desktop + mobile)
│   [ ] demo video
└── /design-visual-storyteller — landing page tells a story

FRONTEND audit
├── Lighthouse 90+ all metrics
├── Core Web Vitals pass
├── Bundle size — no unnecessary imports
├── next/image, WebP/AVIF
├── Responsive: 375, 768, 1024, 1440
├── Dark mode fully working
├── i18n: all strings in translation files
└── Cross-browser: Chromium + Firefox via Playwright

BACKEND audit
├── Query optimization, indexes, no seq scans
├── N+1 detection
├── Connection pooling
├── API: proper status codes, structured errors, rate limiting, input validation
└── Better-Auth configured correctly, sessions working

SECURITY audit
├── Supabase get_advisors(type="security") — 0 issues
├── No auth bypass
├── Webhook signatures verified
├── XSS — all user input sanitized
├── CSRF on all state-changing endpoints
├── Security headers
├── No client-side secrets
├── npm audit clean
└── CERT-In: 180-day logging, NTP sync, PoC registered

DEVOPS audit
├── GitHub Actions: lint + test + deploy
├── dev/staging/prod separation
├── Sentry, PostHog, BetterStack configured
├── SLO targets defined
├── Vercel instant rollback works
├── Load test: 100 concurrent users (k6 or artillery)
└── Supabase daily backups enabled

WRITER audit
├── README.md — setup, architecture, contributing
├── API docs — all endpoints
├── In-app copy matches brand voice
├── Landing copy — clear, no jargon
├── Legal pages per country (DPDPA, GDPR, CCPA, LGPD)
├── Onboarding copy — welcoming, progressive disclosure
└── Error messages — helpful, specific, on-brand

REVIEWER final pass
├── /engineering-code-reviewer on all files
├── No dead code, no prod TODOs
├── Consistent patterns
├── No `any`, no unjustified type assertions
├── /simplify — can anything be reused or removed?
└── Git log review — descriptive commits
```

**All agents write findings to `.squad/decisions/inbox/`. Scribe merges to decisions.md. Lead prioritizes. Claude fixes ALL issues before Phase 12.**

---

## Phase 12 — Deploy + Launch Prep

**Skills**: `superpowers:finishing-a-development-branch`, `schedule`

### Deploy

```
1. /superpowers:finishing-a-development-branch — decide merge strategy
2. Vercel MCP: deploy_to_vercel (region bom1)
3. get_deployment_build_logs — verify success
4. get_runtime_logs — check for errors
5. HUMAN REQUIRED:
   [ ] Set env vars in Vercel dashboard
   [ ] Configure custom domain DNS
```

### Cloudflare (if using)

```
- Cloudflare MCP: DNS records, CDN caching rules, SSL/TLS
- R2 bucket for large assets (optional)
```

### Email infrastructure

```
- Resend MCP: verify sending domain (SPF/DKIM/DMARC)
- Test transactional: welcome, password reset, billing, receipt
- Configure delivery webhooks
```

### Legal pages (per-country from Phase 3.5)

```
India:  DPDPA privacy policy, GST invoice format, grievance officer details
US:     CCPA/CPRA privacy, CAN-SPAM compliant emails
EU:     GDPR privacy (cookie consent explicit opt-in, DPA, right to erasure)
Brazil: LGPD privacy
All:    Terms of Service, refund policy, cookie policy
HUMAN: Review legal drafts with local counsel before publishing
```

### Launch assets (using Phase 8 outputs)

```
[ ] Landing page live with:
    - Hero using brand tokens + og-image
    - Feature sections with app-screenshots
    - Demo video embedded
    - Pricing table connected to Razorpay/Paddle
    - Social proof section
[ ] Product Hunt: tagline + description + gallery (uses screenshots + demo)
[ ] Show HN draft: follows HN guidelines
[ ] Reddit templates: per-subreddit
[ ] Twitter/X announcement thread
[ ] LinkedIn announcement post
```

Use `/ads-landing` skill to audit the landing page for conversion.

### Monitoring

```
- BetterStack: uptime + status page
- /schedule: recurring health checks
```

**After Phase 12 completes**, switch to `BLUEPRINT-GROWTH.md` for validation execution, activation, retention, acquisition, and growth.

---

## Error Recovery (when things fail)

```
Tool failure              → Fallback
─────────────────────────────────────────────────────────────
Stitch MCP down           → Pencil.dev MCP OR /frontend-design to generate React directly
Supabase MCP error        → Bash psql OR manual migration files in db/migrations/
Vercel deploy fails       → read get_deployment_build_logs → fix → redeploy; else `vercel` CLI
Playwright MCP fails      → Browserbase Stagehand OR Vitest unit tests
Notion MCP error          → Write docs as local .md
Figma MCP error           → Stitch or Pencil
Canva MCP error           → /ads-generate or Nano Banana Pro
GitHub MCP error          → git CLI via Bash
Browserbase down          → Playwright MCP
Context7 down             → WebSearch for library docs
brand-architect fails     → /frontend-design + manually author brand-tokens.css
21st.dev Magic fails      → /frontend-design
Razorpay API error        → log, continue other features, mark payment as BLOCKER
Skill not found           → Use closest available, log fallback

GENERAL:
- Log EVERY failure to .squad/decisions.md (what failed, fallback used)
- Never retry the same failing call more than twice
- If a phase is fully blocked, mark blocked in TaskCreate, skip, continue
- Report ALL skipped/fallback items to user in ONE batch at the end
```

---

## Human Required Checklist (grouped by when)

### UPFRONT (provide in Phase 0 answers, else Claude pauses at Phase 9)
- [ ] Supabase project URL + anon + service role
- [ ] Razorpay Key ID + Secret
- [ ] Paddle API key (optional)
- [ ] Vercel account connected
- [ ] Resend API key + domain
- [ ] PostHog project key
- [ ] Sentry DSN
- [ ] Inngest keys
- [ ] Domain registered (or let Claude suggest)

### BLOCKER (Phase 12 — Claude WILL pause)
- [ ] Vercel env vars set in dashboard
- [ ] Custom domain DNS configured
- [ ] Legal pages reviewed with counsel before publishing

### ASYNC (do alongside, Claude works around)
- [ ] Pvt Ltd registration, PAN, TAN, GST, IEC, LUT
- [ ] Razorpay/Paddle webhook URLs point to production
- [ ] Email sending domain DNS (SPF/DKIM/DMARC)
- [ ] Cloudflare DNS (if applicable)
- [ ] Upstash Redis instance (optional caching)
- [ ] Product Hunt maker profile
- [ ] 3-5 beta testers lined up

---

## Skill Reference (compact)

| Skill | Use in phase |
|---|---|
| `superpowers:brainstorming` | 0, 1, 4, 7 |
| `superpowers:writing-plans` | 4, 6, 9 |
| `superpowers:executing-plans` | 9, 10 |
| `superpowers:subagent-driven-development` | 10 |
| `superpowers:dispatching-parallel-agents` | 10, 11.5 |
| `superpowers:using-git-worktrees` | 9, 10 |
| `superpowers:test-driven-development` | 10, 11 |
| `superpowers:systematic-debugging` | 10, 11 |
| `superpowers:verification-before-completion` | 11, 12 |
| `superpowers:requesting-code-review` | 11 |
| `superpowers:finishing-a-development-branch` | 12 |
| `brand-architect` | 7 |
| `enhance-prompt` | 7, 8 |
| `stitch-loop` | 8 |
| `design-md` | 8 |
| `design-image-prompt-engineer` | 7, 8, 13 |
| `design-brand-guardian` | 11.5 |
| `design-inclusive-visuals-specialist` | 11.5 |
| `design-whimsy-injector` | 11.5 |
| `frontend-design` | 10 |
| `shadcn-ui` | 9, 10 |
| `react-components` | 10 |
| `simplify` | 10, 11 |
| `remotion` | 8 |
| `engineering-*` specialist suite | 6, 10, 11.5 |
| `ads-landing` / `ads-create` / `ads-generate` / `ads-dna` | 12, 13 |
| `schedule` / `loop` | 12, 14 |

---

## MCP Tool Reference (compact)

| Server | Tools | Primary use |
|---|---|---|
| Stitch | 12 | Screen generation (Phase 8) |
| Pencil.dev | 15 | In-repo designs fallback |
| Supabase | 20 | DB, migrations, advisors (6, 9, 10, 11) |
| Vercel | 18 | Deploy, logs, domains (12) |
| Notion | 14 | Docs, PM |
| Figma | 15 | Read designs, diagrams |
| 21st.dev Magic | 4 | Component builder, logo search |
| Browserbase/Stagehand | 8 | Visual + AI testing |
| Canva | 27 | Marketing assets (8, 12, 13) |
| Context7 | 2 | Library docs |
| Sequential Thinking | 1 | Structured decisions |
| Playwright (add) | ~10 | E2E (11) |
| GitHub (add) | ~15 | Repo, PRs |
| Cloudflare (add) | many | DNS, CDN, Workers, R2 (12) |
| Resend (add) | ~8 | Email domain verify, test sends |
| Sentry (add) | 19 | Errors + AI fixes |
| PostHog (add) | ~10 | Analytics, flags, A/B |

---

*End of build playbook. For post-launch execution (validation, activation, retention,
acquisition, distribution, growth engines, CS, analytics, scaling), read `BLUEPRINT-GROWTH.md`.*
