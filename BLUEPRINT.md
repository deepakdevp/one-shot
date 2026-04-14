# Product One-Shot Blueprint v6.0 — Index

> Hand this file + any product idea to Claude Code. Claude grills you with every
> question it needs, collects credentials, runs research, scores viability, and
> — if GO — one-shots the entire SaaS including brand theme and production assets.
>
> Two companion files are read on demand:
> - `BLUEPRINT-BUILD.md`  → Phases 0–12 (idea → deployed MVP with theme + assets)
> - `BLUEPRINT-GROWTH.md` → Post-launch (validation, activation, retention, growth)

---

## How To Use

```
1. mkdir ~/projects/my-saas && cd ~/projects/my-saas
2. claude --dangerously-skip-permissions
3. Paste this prompt:

   "Read ~/projects/one-shot/BLUEPRINT.md and execute it for this idea: [YOUR IDEA].
    Grill me with EVERY question you need. Collect credentials.
    Score viability. If GO, one-shot the whole SaaS — including
    brand theme and assets (logo, favicon, OG image, screenshots,
    demo video). Go fully autonomous after my answers."

4. Claude asks all ~33 questions in one message.
5. You answer them all in one message.
6. Claude goes autonomous: research → viability → build → deploy.
7. Only stops for: (a) the viability GO signal, (b) missing credentials,
   (c) DNS or legal review that only you can do.
```

---

## Pipeline (North Star)

```
PRE      Squad setup: .squad/ with 10 agents, decisions.md = shared brain
PH-0     GRILL questions + credentials intake → CLAUDE.md
PH-1-3   Research: idea → market → competitors
GATE     VIABILITY SCORECARD (7 dims) ← ONLY checkpoint where Claude waits
PH-3.5   Compliance + payment strategy (India-first + global)
PH-4     PRD + user stories
PH-5     Pricing + unit economics
PH-6     Architecture + DB schema
PH-7     BRAND THEME — brand-architect autonomous (bible + tokens + tailwind)
PH-8     SCREENS + ASSETS — Stitch screens + logo + favicon + OG + demo video
PH-9     Scaffold Next.js + integrations + git
PH-10    Squad parallel build (Frontend + Backend + Payments + Tester)
PH-11    E2E tests + security + perf advisors
PH-11.5  All-agents quality audit in parallel
PH-12    Deploy Vercel + legal pages + launch assets

→ After PH-12, switch to BLUEPRINT-GROWTH.md for:
  validation playbooks, launch execution, activation, retention,
  acquisition, distribution, growth engines, CS ops, analytics, scaling.
```

---

## Absolute Rules (NEVER break)

- **GRILL first.** Do not build until every Phase-0 question is answered.
- **VIABILITY GATE is the ONLY place Claude waits.** Everything else is autonomous.
- **DESIGN THEME is non-negotiable.** `brand-bible.md`, `brand-tokens.css`, and `tailwind.config.brand.js` MUST exist before any UI code.
- **ASSETS are non-negotiable.** Logo, favicon, OG image (1200×630), app screenshots, and a ~60s demo video MUST exist before deploy.
- **Razorpay for India. Paddle MoR for global tax.** Never Stripe unless user has a US entity.
- **RLS on every Supabase table.** No exceptions.
- **All colors/fonts via brand-tokens.css.** Zero hardcoded hex or font-family.
- **All user-facing strings via next-intl.** Zero hardcoded copy.
- **TypeScript strict.** No `any`, no untyped assertions.
- **Log every decision** to `.squad/decisions.md`.
- **When blocked:** batch blockers, ask user once, continue.
- **Fresh Claude session** per major phase to avoid context drift.

---

## Phase 0 Question Bank (Claude asks ALL, then goes autonomous)

### IDEA (6)
1. One-line pitch?
2. Target user — job title, company size, pain frequency?
3. Core feature — the ONE thing it must do?
4. Markets — India-first / global / both?
5. Known competitors?
6. Why YOU? (founder-market fit, domain expertise)

### PRODUCT (6)
7. AI features — what kind, or none?
8. Realtime / collaboration needed?
9. Form factor — web / mobile / extension / CLI / desktop?
10. Integrations required (Slack, Google, Zapier, etc.)?
11. B2B / B2C / both?
12. Freemium / trial / paid-only?

### BRAND & DESIGN (6) — drives theme + assets
13. How should the brand FEEL? (3 adjectives)
14. Brand-as-person — dinner party persona (age, dress, speech)?
15. Sites whose visual style you love? Any you hate?
16. Color direction — warm / cool / neutral / mono / bold?
17. Dark mode — primary / equal / secondary?
18. Product name decided, or should Claude generate + check domains?

### BUSINESS (3)
19. Target price range (INR + USD)?
20. Annual discount %?
21. Target MRR in 12 months?

### CREDENTIALS (9) — provide what you have; Claude pauses only if missing at Phase 9
22. **Supabase** — project URL + anon key + service role key
23. **Razorpay** — Key ID + Secret + Webhook secret
24. **Paddle** (optional, global) — API key + Webhook secret
25. **Vercel** — team slug, connected y/n
26. **Resend** — API key + verified sending domain
27. **PostHog** — project API key
28. **Sentry** — DSN
29. **Inngest** — event key + signing key
30. **Domain** — name + registrar + Cloudflare y/n

### COMPLIANCE (3)
31. Pvt Ltd registered? GST? IEC? LUT filed?
32. Industry-specific regs (fintech / health / edu / gov)?
33. Launch languages (en / hi / es / pt / ar …)?

**After answers:** Claude writes `CLAUDE.md` + `.squad/`, runs Phase 1-3
research, presents VIABILITY SCORECARD, waits for "GO", then goes autonomous
through Phase 12.

---

## Deliverables Checklist

```
Research
[ ] IDEA-BRIEF.md          [ ] MARKET-RESEARCH.md     [ ] COMPETITOR-ANALYSIS.md
[ ] VIABILITY-REPORT.md ← user must say GO

Strategy
[ ] COMPLIANCE-STRATEGY.md [ ] PRD.md                 [ ] BUSINESS-MODEL.md
[ ] ARCHITECTURE.md

Theme (non-negotiable — Phase 7)
[ ] brand-bible.md         (incl. tagline variations, logo usage, content style guide)
[ ] brand-tokens.css       (incl. gradients, monospace, full type scale)
[ ] tailwind.config.brand.js
[ ] design-tokens.json

Design
[ ] DESIGN.md              [ ] SITE.md                [ ] Stitch project (all MVP screens)

Assets (non-negotiable — Phase 8, verified by 11.5 audit)
Logo & lockups (8B)
[ ] logo set: full / dark / light / mark / monochrome
[ ] lockups: horizontal / stacked / mark-only / wordmark-only
Favicons (8C)
[ ] favicon.ico + 16/32 + apple-touch + android-192/512 + manifest.webmanifest
Social cards (8D)
[ ] og-image.png (1200×630) + twitter-card + linkedin-share
Screenshots + mockups (8E + 8H.9)
[ ] app screenshots (desktop + mobile, all key screens)
[ ] device mockups (laptop + iPhone + browser frames)
Video (8F + 8H.8)
[ ] demo-video.mp4 (~60s)
[ ] animated logo reveal (Lottie + MP4)
README + diagrams (8G)
[ ] README banner + architecture diagram
Brand kit extras (8H — mandatory)
[ ] UI icon set + icon-system.md
[ ] illustrations: hero + 4 empty states + 3 errors + 3 onboarding
[ ] app icon master set (iOS + Android + PWA)
[ ] pricing graphics (3 tier cards + comparison + badges)
[ ] social profiles + covers (X, LinkedIn, IG, GitHub, YouTube)
[ ] social post templates (3 baseline)
[ ] newsletter template
[ ] pitch deck (PDF + PPTX, 12 slides)
[ ] one-pager (PDF + PNG)
[ ] press kit (logo-pack.zip + boilerplate + fact sheet)
[ ] /press public download page in app
[ ] WCAG contrast report (zero failures)
[ ] brand-guidelines.pdf (compiled from brand-bible.md)
[ ] /public/brand/assets-manifest.json (audited at 11.5)

Code
[ ] Working Next.js app with all Phase-10 features
[ ] Tests passing (Playwright E2E + unit)
[ ] Deployed to Vercel with custom domain

Ops
[ ] CLAUDE.md              [ ] .squad/                [ ] README.md
[ ] Per-country legal pages (from Phase 3.5 matrix)

Launch
[ ] Landing page (live)
[ ] Product Hunt copy      [ ] Show HN draft          [ ] Reddit templates
[ ] Ad creatives (via /ads-generate)
```

---

## Files In This Blueprint

| File | Contents | Read when |
|---|---|---|
| `BLUEPRINT.md` (this) | Index, question bank, rules, deliverables | Start of session |
| `BLUEPRINT-BUILD.md` | Phases 0–12 detailed instructions, skill/tool refs, compliance matrices, error recovery | After Phase 0 answers received |
| `BLUEPRINT-GROWTH.md` | Validation, activation, retention, acquisition, distribution, growth engines, CS ops, analytics, scaling | After Phase 12 (deploy done) |

---

## When Stuck

- Check `.squad/decisions.md` — past decisions live here
- Tool fails → see **Error Recovery** in `BLUEPRINT-BUILD.md`
- Skill missing → fallback to `/frontend-design` + manual
- Blocker → batch it, ask user once, continue

---

*v6.0 — Split from monolithic v5.1. Three files, one index, two playbooks.*
*Build file covers idea → deployed MVP with theme + assets. Growth file covers everything after.*
