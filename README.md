<p align="center">
  <img src="assets/logo.svg" alt="One-Shot" width="120" height="120" />
</p>

<h1 align="center">One-Shot</h1>

<p align="center">
  <strong>One prompt. One idea. One fully-built product — with brand theme and assets.</strong>
</p>

<p align="center">
  Hand Claude Code your idea and this blueprint. It grills you with every question
  it needs, scores viability, and — if GO — builds the entire product end-to-end:
  research, brand identity, screens, assets, code, tests, deploy.
</p>

<p align="center">
  <a href="#quick-start">Quick Start</a> &bull;
  <a href="#what-it-does">What It Does</a> &bull;
  <a href="#the-flow">The Flow</a> &bull;
  <a href="SETUP.md">Setup</a> &bull;
  <a href="EXAMPLE.md">Example Run</a> &bull;
  <a href="CONTRIBUTING.md">Contributing</a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/blueprint-v6.0-blue" alt="v6.0" />
  <img src="https://img.shields.io/badge/skills-100%2B-purple" alt="100+ Skills" />
  <img src="https://img.shields.io/badge/MCP_tools-157-green" alt="157 MCP Tools" />
  <img src="https://img.shields.io/badge/squad_agents-10-orange" alt="10 Squad Agents" />
  <img src="https://img.shields.io/badge/license-MIT-yellow" alt="MIT License" />
</p>

---

## What It Does

A **three-file battle plan** that turns Claude Code into a full product team.
You provide an idea. Claude does everything else:

- **Grills you** with ~33 questions (idea, product, brand, business, credentials, compliance)
- **Researches** market, competitors, AI-era longevity
- **Scores viability** on 7 dimensions — kills bad ideas early to save 90% of your tokens
- **Plans compliance** for India-first global launch (DPDPA, GDPR, CCPA, LGPD)
- **Generates brand theme** — bible, tokens, Tailwind config, dark mode (mandatory before any UI)
- **Generates assets** — logo set, favicons, OG images, app screenshots, 60s demo video (mandatory before deploy)
- **Builds in parallel** via Squad multi-agent: Frontend + Backend + Payments + Tester
- **Audits everything** — security, performance, accessibility, brand consistency, copy
- **Deploys** to Vercel, configures monitoring, generates launch materials
- **Then hands off** to a growth playbook for validation, activation, retention, growth

Works for **any product type**:

| SaaS | Tools | APIs | Extensions | Marketplaces |
|------|-------|------|-----------|--------------|
| CLI | Mobile | Templates | Open Source | Desktop |

---

## Quick Start

### 1. Install (one time, ~10 minutes)

```bash
git clone https://github.com/deepakdevp/one-shot.git ~/projects/one-shot
cd ~/projects/one-shot
bash setup.sh
```

This installs MCP servers (Playwright, GitHub, Cloudflare) and 20+ skills.
See [SETUP.md](SETUP.md) for the full guide, including account creation and
verification.

### 2. Get your API keys (one time, ~30 minutes)

Copy `.env.example` to `.env.local` and fill in keys from:

[Supabase](https://supabase.com) · [Razorpay](https://razorpay.com) ·
[Paddle](https://paddle.com) · [Vercel](https://vercel.com) ·
[Resend](https://resend.com) · [PostHog](https://posthog.com) ·
[Sentry](https://sentry.io) · [Inngest](https://inngest.com)

### 3. Build something

```bash
mkdir ~/projects/my-idea && cd ~/projects/my-idea
claude --dangerously-skip-permissions
```

Paste this prompt:

```
Read ~/projects/one-shot/BLUEPRINT.md and execute it for this idea: [YOUR IDEA].
Grill me with every question you need. Collect credentials. Score viability.
If GO, one-shot the whole SaaS — including brand theme and assets
(logo, favicon, OG image, screenshots, demo video).
Go fully autonomous after my answers.
```

### 4. Answer the grill, then walk away

Claude asks all ~33 questions in one message. You answer in one message. After
that, Claude only stops for:

1. The **viability GO signal** (the only mandatory checkpoint)
2. **Missing credentials** if you didn't provide them upfront
3. **Vercel env vars** — paste into Vercel dashboard
4. **Domain DNS** — add records at your registrar
5. **Legal review** — skim generated privacy policy + ToS

Need help picturing it? See [EXAMPLE.md](EXAMPLE.md) for a full walkthrough.

---

## The Flow

```
You: "Here's my idea: [IDEA]"
─────────────────────────────────────────────────────────────────
PRE      Squad setup: .squad/ with 10 agents + decisions.md
PH-0     GRILL: 33 questions → CLAUDE.md → autonomous mode
PH-1-3   Research: idea, market, competitors  (~10% tokens)
─────────────────────────────────────────────────────────────────
GATE     VIABILITY CHECK — GO (50+) / PIVOT (35-49) / KILL (<35)
         7 dimensions: money, AI-longevity, defensibility, timing,
         feasibility, founder-fit, India-fit
         ⚠️  KILL = stop here, save 90% of tokens
         (the ONLY user checkpoint after Phase 0)
─────────────────────────────────────────────────────────────────
PH-3.5   Compliance: India entity + per-country matrices
PH-4-5   PRD + business model + pricing
PH-6     Architecture: Next.js + Drizzle + Better-Auth + Razorpay
PH-7     BRAND THEME (mandatory) — brand bible + tokens + tailwind
PH-8     SCREENS + ASSETS (mandatory) — Stitch screens + logo +
         favicon + OG + app screenshots + 60s demo video
PH-9     Scaffold Next.js + integrations + git init
PH-10    BUILD: Squad parallel — Frontend + Backend + Payments
         + Tester, with cross-review enforced
PH-11    Test: Playwright E2E + visual + security + perf
PH-11.5  AUDIT: All agents audit their domain in parallel
PH-12    Deploy: Vercel + Cloudflare + legal + launch assets
─────────────────────────────────────────────────────────────────
POST     BLUEPRINT-GROWTH.md — validation, activation,
         retention, acquisition, growth engines, scaling
```

---

## Files In This Repo

| File | Role |
|---|---|
| **`BLUEPRINT.md`** | Compact index — paste this into Claude. 33-question grill, rules, deliverables. |
| **`BLUEPRINT-BUILD.md`** | Phases 0–12 — research → viability → brand theme → assets → build → deploy. |
| **`BLUEPRINT-GROWTH.md`** | Post-launch playbooks — validation, activation, retention, acquisition, distribution, growth, CS, analytics, scaling. |
| `SETUP.md` | One-time install: Claude Code, MCP servers, skills, accounts. |
| `.env.example` | Template of all credentials Claude asks for. |
| `EXAMPLE.md` | Full walkthrough of one-shotting a fake product. |
| `setup.sh` | Install MCP servers + skills. |
| `fix-skills.sh` | Recover from failed skill installs. |
| `CONTRIBUTING.md` | How to contribute to the blueprint. |
| `CODE_OF_CONDUCT.md` | Community standards. |

---

## The Viability Gate

The only place Claude stops and waits for you. Scores your idea on 7 dimensions
before spending 90% of tokens building it.

| Dimension | What it checks |
|-----------|---------------|
| Money potential | Are people ALREADY paying for solutions? |
| AI-era longevity | Will AI make this obsolete in 6-18 months? |
| Competitive defensibility | Can a funded competitor clone this in a week? |
| Market timing | Growing, stable, or shrinking market? |
| Execution feasibility | Can solo founder + AI build this in days? |
| Founder-market fit | Domain expertise? Would you use it yourself? |
| India market fit | Makes sense at Indian price points? |

**The AI Kill Test**:

> "If OpenAI adds this exact feature tomorrow, would users still need my product?"

**YES** = durable (workflow / data / integration moat). **NO** = fragile.

---

## Brand Theme + Assets (non-negotiable)

Every previous "AI-built product" looks generic. This blueprint forces Claude to
produce a real brand and real assets before deploy is allowed.

**Phase 7 — Brand theme** (must exist before any UI code):
- `brand-bible.md` — strategy, visual, voice
- `brand-tokens.css` — CSS custom properties, light + dark mode
- `tailwind.config.brand.js` — Tailwind theme extension
- `design-tokens.json` — W3C portable format

**Phase 8 — Assets** (must exist before deploy):
- Logo set: full / dark / light / mark / monochrome (5 SVGs)
- Favicons: ico + 16/32/192/512 + apple-touch + manifest
- OG images: 1200×630 + Twitter card + LinkedIn card
- App screenshots: desktop + mobile, all key flows
- 60-second demo video via `/remotion`
- README banner + architecture diagram

Phase 11.5 audit verifies every asset exists. Deploy is gated on it.

---

## Squad Multi-Agent Architecture

Inspired by [bradygaster/squad](https://github.com/bradygaster/squad). Each
agent has a charter, expertise boundary, and shares context via `decisions.md`.

```
.squad/
├── team.md           Roster (10 agents)
├── routing.md        Who handles what
├── decisions.md      Shared brain — every decision logged
└── agents/
    ├── lead/         Dispatcher only — never writes code
    ├── designer/     brand-architect, Stitch, UX research, assets
    ├── frontend/     Next.js, React, shadcn, Stitch→React
    ├── backend/      Supabase, Drizzle, Better-Auth, Inngest
    ├── payments/     Razorpay, Paddle, billing, subscriptions
    ├── tester/       Playwright E2E, Browserbase visual, TDD
    ├── security/     Threat model, OWASP, RLS, CERT-In
    ├── reviewer/     Code review, simplify, type strictness
    ├── devops/       CI/CD, Vercel, Cloudflare, SRE
    ├── writer/       Docs, in-app copy, legal pages
    └── scribe/       Silent — appends every decision to decisions.md
```

**Cross-review rule:** Tester reviews Frontend. Frontend reviews Backend.
Never self-review.

---

## Default Tech Stack

| Layer | Tool | Why |
|---|---|---|
| Framework | Next.js 15+ App Router | Server components, dominant ecosystem |
| Styling | Tailwind v4 + shadcn/ui | Industry standard |
| ORM | Drizzle | 7.4kb bundle, pure TS, serverless-friendly |
| Database | Supabase (Postgres + RLS) | Auth, realtime, storage, edge functions |
| Auth | Better-Auth | Open-source, RBAC, orgs, 2FA, passkeys |
| India payments | Razorpay | UPI mandatory, RBI compliant |
| Global payments | Paddle (MoR) | Handles ALL global tax |
| Email | Resend + React Email | Modern API + JSX templates |
| Background jobs | Inngest | Event-driven, retries, observability |
| i18n | next-intl | Best for App Router |
| Analytics | PostHog | Flags, A/B, session replay |
| Errors | Sentry | Stack traces, AI fix suggestions |
| Hosting | Vercel | Edge network, preview deploys |
| CDN/DNS | Cloudflare | 2,500+ API endpoints via MCP |

---

## India-First Strategy

Built for founders launching from India:

- **Entity setup**: Pvt Ltd, GST, IEC, LUT (0% export tax), DPIIT
- **Payments**: Razorpay (India) + Paddle (global tax handling)
- **Compliance**: DPDPA 2023, CERT-In (6h reporting), RBI data localization
- **PPP pricing**: Automatic purchasing-power-parity discounts by country
- **Expansion**: India → US → EU → LATAM → SEA → Middle East
- **Per-country**: Different gateways, legal pages, languages, pricing

---

## Requirements

- [Claude Code](https://claude.ai/code) (Max plan recommended)
- Node.js 18+
- Git + GitHub account
- Accounts for the services in [SETUP.md](SETUP.md)

### Estimated Usage

| Approach | Token usage | Timeline |
|---|---|---|
| Full build in one week | ~60-65% of weekly Max | 1 week |
| Split research + build | ~35% per week | 2 weeks |
| Sonnet for research | ~50% total | 1.5 weeks |

---

## Contributing

This blueprint gets better with every project run through it. See
[CONTRIBUTING.md](CONTRIBUTING.md) for guidelines. High-leverage contributions:

- **New product type adaptations** (Shopify apps, WordPress plugins, etc.)
- **Country compliance matrices** (countries not yet covered)
- **Payment gateway adapters** (PhonePe, Cashfree, CCAvenue)
- **Skill recommendations** (new skills worth installing)
- **Bug reports** (ran the blueprint, hit an issue)
- **Success stories** (built something — share what you learned)

---

## License

MIT — see [LICENSE](LICENSE).

---

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
