<p align="center">
  <img src="assets/logo.svg" alt="One-Shot" width="120" height="120" />
</p>

<h1 align="center">One-Shot</h1>

<p align="center">
  <strong>One prompt. One idea. One fully-built product.</strong>
</p>

<p align="center">
  Give Claude Code your idea and this blueprint. It researches, validates, designs, builds, tests, and deploys — autonomously.
</p>

<p align="center">
  <a href="#quick-start">Quick Start</a> &bull;
  <a href="#what-it-does">What It Does</a> &bull;
  <a href="#the-flow">The Flow</a> &bull;
  <a href="#requirements">Requirements</a> &bull;
  <a href="#skills--tools">Skills & Tools</a> &bull;
  <a href="#contributing">Contributing</a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/skills-100%2B-blue" alt="100+ Skills" />
  <img src="https://img.shields.io/badge/MCP_tools-157-green" alt="157 MCP Tools" />
  <img src="https://img.shields.io/badge/squad_agents-12-purple" alt="12 Squad Agents" />
  <img src="https://img.shields.io/badge/product_types-15-orange" alt="15 Product Types" />
  <img src="https://img.shields.io/badge/license-MIT-yellow" alt="MIT License" />
</p>

---

## What Is One-Shot?

A **3,000-line battle plan** that turns Claude Code into a full product team. You provide an idea, it does everything else:

- Researches the market, competitors, and feasibility
- **Kills bad ideas early** (Viability Gate scores 7 dimensions, saves 90% of your tokens)
- Checks AI-era longevity ("Will this survive when ChatGPT adds this feature?")
- Handles compliance for India-first global launch (DPDPA, GDPR, CCPA)
- Designs brand identity, UI screens, and design system
- Builds the full application with parallel specialist agents
- Tests with Playwright E2E, audits security, performance, accessibility
- Deploys to Vercel, sets up monitoring, generates launch materials

Works for **any product type** — not just SaaS:

| SaaS | Tools | APIs | Browser Extensions | Marketplaces |
|------|-------|------|-------------------|-------------|
| CLI Tools | Mobile Apps | Templates | Open Source | Desktop Apps |

## Quick Start

### 1. Install (one time, 5 minutes)

```bash
git clone https://github.com/deepakdevp/one-shot.git
cd product-blueprint
bash setup.sh
```

This installs MCP servers (Playwright, GitHub, Cloudflare) and 20+ skills (Stripe, Next.js, Supabase, Cloudflare, accessibility, SEO, Docker, and more).

### 2. Create accounts (one time, 30 minutes)

Get API keys from: [Supabase](https://supabase.com) | [Razorpay](https://razorpay.com) | [Paddle](https://paddle.com) | [Vercel](https://vercel.com) | [Resend](https://resend.com) | [PostHog](https://posthog.com) | [Sentry](https://sentry.io) | [Inngest](https://inngest.com)

### 3. Build something

```bash
mkdir ~/projects/my-idea && cd ~/projects/my-idea
claude --dangerously-skip-permissions
```

Paste:

```
Read [path-to]/product-blueprint/BLUEPRINT.md and execute it for this idea: [YOUR IDEA].
Start with Phase 0 — ask me ALL questions you need before building.
After I answer, go fully autonomous until you hit a blocker that ONLY I can resolve.
```

### 4. Answer ~28 questions, then walk away

Claude asks everything upfront (idea, market, brand, tech preferences, API keys), then goes fully autonomous. It only stops for:

1. **Vercel env vars** — paste into Vercel dashboard
2. **Domain DNS** — add records at your registrar
3. **Legal review** — skim the generated privacy policy + ToS

---

## The Flow

```
 You: "Here's my idea: [IDEA]"
 ──────────────────────────────────────────────────────────────
 SETUP    Create .squad/ (12 specialist agents + shared brain)
 PH-0     Ask 28 questions → create CLAUDE.md → go autonomous
 PH-1-3   Research: idea validation, market, competitors  (~10% tokens)
 ──────────────────────────────────────────────────────────────
 GATE     VIABILITY CHECK — GO (50+) / PIVOT (35-49) / KILL (<35)
          Score: money, AI-longevity, defensibility, timing,
          feasibility, founder-fit, India-fit
          ⚠️  KILL = stop here, save 90% of tokens
 ──────────────────────────────────────────────────────────────
 PH-3.5   Compliance: India entity, DPDPA, GDPR, per-country matrix
 PH-4-5   PRD, business model, pricing tiers
 PH-6     Architecture: Next.js + Drizzle + Better-Auth + Razorpay
 PH-7     Brand: /brand-architect → brand bible + design tokens
 PH-8     Screens: Stitch AI generation → design system
 PH-9     Scaffold: Next.js project with all integrations wired
 PH-10    BUILD: Squad fan-out — Frontend + Backend + Payments
          + Tester in parallel, cross-review enforced
 PH-11    Test: Playwright E2E + Browserbase visual + security audit
 PH-11.5  QUALITY AUDIT: All 12 agents audit their domain in parallel
 PH-12    Deploy: Vercel + Cloudflare + legal + launch assets
 PH-13    Marketing: SEO + analytics + content + ads
 PH-14    Scale: monitoring + caching + iteration playbook
```

## The Viability Gate

The most important phase. Scores your idea on 7 dimensions before spending 90% of tokens building it:

| Dimension | What It Checks |
|-----------|---------------|
| Money Potential | Are people ALREADY paying for solutions? |
| AI-Era Longevity | Will AI make this obsolete in 6-18 months? |
| Competitive Defensibility | Can a funded competitor clone this in a week? |
| Market Timing | Growing, stable, or shrinking market? |
| Execution Feasibility | Can solo founder + AI build this in days? |
| Founder-Market Fit | Domain expertise? Would you use this yourself? |
| India Market Fit | Makes sense at Indian price points? |

**The AI Kill Test:**
> "If OpenAI adds this exact feature tomorrow, would users still need my product?"

**YES** = durable (value is in workflow/data/integration). **NO** = fragile (building on borrowed time).

## Squad Architecture

Inspired by [bradygaster/squad](https://github.com/bradygaster/squad). Each agent has a charter, expertise boundaries, and shared context via `decisions.md`.

```
.squad/
├── team.md           # 12 agent roster
├── routing.md        # Who handles what
├── decisions.md      # Shared brain (all decisions logged here)
└── agents/
    ├── lead/         # Dispatcher — never writes code
    ├── designer/     # brand-architect, Stitch, UX research, whimsy
    ├── frontend/     # Next.js, React, shadcn, Stitch→React conversion
    ├── backend/      # Supabase, Drizzle, Better-Auth, Inngest
    ├── payments/     # Razorpay, Paddle, billing, subscriptions
    ├── tester/       # Playwright E2E, visual testing, TDD
    ├── security/     # Threat modeling, OWASP, RLS audit, CERT-In
    ├── reviewer/     # Code review, simplify, TypeScript strictness
    ├── devops/       # CI/CD, Docker, Cloudflare, SRE
    ├── writer/       # Docs, README, API docs, in-app copy, SEO
    ├── seo/          # Technical SEO, structured data, meta tags
    └── i18n/         # Internationalization, translation files
```

**Cross-review rule:** Tester reviews Frontend. Frontend reviews Backend. Never self-review.

## Default Tech Stack

| Layer | Tool | Why |
|-------|------|-----|
| Framework | Next.js 15+ (App Router) | Server components, dominant ecosystem |
| Styling | Tailwind CSS v4 + shadcn/ui | Industry standard |
| ORM | Drizzle ORM | 7.4kb bundle, pure TS inference, serverless-optimized |
| Database | Supabase (Postgres + RLS) | Auth, realtime, storage, edge functions |
| Auth | Better-Auth | Open-source, RBAC, orgs, 2FA, passkeys (Lucia is deprecated) |
| India Payments | Razorpay | UPI mandatory, RBI compliant |
| Global Payments | Paddle (MoR) | Handles ALL global tax compliance |
| Email | Resend + React Email | Modern API + JSX templates |
| Background Jobs | Inngest | Event-driven, retries, observability |
| i18n | next-intl | Best for App Router |
| Analytics | PostHog | Feature flags, A/B testing, session replay |
| Errors | Sentry | Stack traces, AI fix suggestions |
| Hosting | Vercel | Edge network, preview deploys |
| CDN/DNS | Cloudflare | 2,500+ API endpoints via MCP |

## India-First Strategy

Built for founders launching from India:

- **Entity setup guide**: Pvt Ltd, GST, IEC, LUT (0% export tax), DPIIT
- **Payment strategy**: Razorpay (India) + Paddle (global tax handling)
- **Compliance**: DPDPA 2023, CERT-In (6-hour reporting), RBI data localization
- **PPP pricing**: Automatic purchasing power parity discounts by country
- **Expansion roadmap**: India → US → EU → LATAM → SEA → Middle East
- **Per-country**: Different payments, legal pages, languages, pricing

## Skills & Tools

### 157 MCP Tools (12 connected servers)

Stitch, Pencil.dev, Supabase, Vercel, Notion, Figma, 21st.dev Magic, Context7, Browserbase/Stagehand, Canva, Sequential Thinking, Zerodha Kite

### 100+ Skills

**Official vendor:** Next.js (Vercel Labs), Stripe, Better-Auth, Supabase Postgres, Cloudflare, Web Quality (Addy Osmani)

**Design:** brand-architect, design-ui-designer, design-ux-architect, design-ux-researcher, design-brand-guardian, design-whimsy-injector, enhance-prompt, stitch-loop, Framer Motion

**Engineering:** frontend-developer, backend-architect, database-optimizer, security-engineer, code-reviewer, technical-writer, devops-automator, SRE, rapid-prototyper

**Quality:** accessibility, core-web-vitals, performance, SEO, web-quality-audit, a11y-audit

**Other:** Docker, MJML email, i18n, Next.js skills, find-skills

## Requirements

- [Claude Code](https://claude.ai/code) (Max plan recommended — $100/month)
- Node.js 18+
- Git + GitHub account

### Estimated Usage

| Approach | Token Usage | Timeline |
|----------|------------|----------|
| Full build in one week | ~60-65% of weekly allocation | 1 week |
| Split research + build | ~35% per week | 2 weeks |
| With Sonnet for research phases | ~50% total | 1.5 weeks |

## File Structure

```
product-blueprint/
├── BLUEPRINT.md        # The 3,000-line master plan (this is what Claude reads)
├── setup.sh            # One-time setup: install MCP servers + skills
├── fix-skills.sh       # Fix script for failed skill installations
├── README.md           # You are here
├── CONTRIBUTING.md     # How to contribute
├── LICENSE             # MIT
└── assets/
    └── logo.svg        # Project logo
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines. Key areas where contributions are welcome:

- **New product type adaptations** (Shopify apps, WordPress plugins, etc.)
- **Country-specific compliance** (add compliance for countries not yet covered)
- **Payment gateway integrations** (PhonePe, Cashfree, CCAvenue, etc.)
- **Skill recommendations** (found a great skill? Add it to the setup script)
- **Bug reports** (ran the blueprint and hit an issue? Report it)
- **Success stories** (built something with this? Share it)

## License

MIT - See [LICENSE](LICENSE) for details.

## Acknowledgments

- [bradygaster/squad](https://github.com/bradygaster/squad) — Squad multi-agent patterns
- [travisvn/awesome-claude-skills](https://github.com/travisvn/awesome-claude-skills) — Skill discovery
- [Superpowers](https://github.com/obra/superpowers) — Claude Code workflow framework
- [Google Stitch](https://github.com/google-labs-code/stitch-skills) — AI design generation
- [Addy Osmani](https://github.com/nichochar/web-quality-skills) — Web quality skills

---

<p align="center">
  Built with Claude Code from India.
</p>
