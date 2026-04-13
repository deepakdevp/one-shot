# Example — One-Shotting "InvoicePilot"

A walkthrough of running the blueprint end-to-end on a fictional product.
Read this once before your first real run so you know what to expect.

> **The product**: InvoicePilot — automated GST-compliant invoicing for Indian
> freelancers. Connects to bank, auto-generates invoices, files quarterly TDS,
> sends payment reminders.
>
> **The founder**: Solo Indian dev. Has Supabase + Razorpay accounts.
> Wants to launch in 7 days.

---

## Step 1 — Start Claude

```bash
mkdir ~/projects/invoicepilot && cd ~/projects/invoicepilot
claude --dangerously-skip-permissions
```

## Step 2 — Paste the trigger prompt

```
Read ~/projects/one-shot/BLUEPRINT.md and execute it for this idea:
"InvoicePilot — automated GST-compliant invoicing for Indian freelancers.
Connects to bank, auto-generates invoices, files quarterly TDS, sends payment
reminders. India-first."

Grill me with every question you need. Collect credentials. Score viability.
If GO, one-shot the whole SaaS — including brand theme and assets
(logo, favicon, OG image, screenshots, demo video).
Go fully autonomous after my answers.
```

## Step 3 — Claude grills you (Phase 0)

Claude reads `BLUEPRINT.md`, then asks all 33 questions in **one message**.
Example (compressed):

```
I'll grill you with everything I need to one-shot InvoicePilot. Answer all
in one reply.

IDEA
1. One-line pitch?
2. Target user — what kind of freelancer? Solo dev? Designer? Agency owner?
   Company size? How often do they invoice?
3. Core feature — the ONE thing it must do? (auto-invoice from bank txn?
   GST filing? payment reminders? all three?)
4. Markets — India only, or India+global?
5. Known competitors? (Zoho Invoice, Refrens, Quickbooks?)
6. Why YOU? Have you been a freelancer? Filed GST yourself?

PRODUCT
7. AI features — auto-categorize transactions? Generate line items from
   description? Or none?
8. Realtime / collab — does the freelancer share the dashboard with a CA?
9. Form factor — web app, mobile, browser extension, all?
10. Integrations — which banks (HDFC, ICICI, SBI)? UPI apps? Tally?
11. B2B (sell to freelancers via outreach) or B2C (self-serve)?
12. Freemium / trial / paid-only?

BRAND & DESIGN
13. How should it FEEL? (3 adjectives)
14. Brand-as-person — what does this brand wear, drink, talk like?
15. Sites whose visual style you love? Any you hate?
16. Color direction — warm, cool, neutral, mono, bold?
17. Dark mode — primary, equal, secondary?
18. Name decided ("InvoicePilot"), or want me to generate alternatives + check domains?

BUSINESS
19. Target price (INR + USD)?
20. Annual discount %?
21. Target MRR in 12 months?

CREDENTIALS (paste what you have, skip what you don't)
22. Supabase URL + anon key + service role key?
23. Razorpay Key ID + Secret + Webhook secret?
24. Paddle (optional)?
25. Vercel — connected, team slug?
26. Resend API key + verified domain?
27. PostHog project key?
28. Sentry DSN?
29. Inngest event key + signing key?
30. Domain — registered? where?

COMPLIANCE
31. Pvt Ltd registered? GST? IEC? LUT?
32. Industry-specific regs? (this one touches financial data — RBI?)
33. Launch languages — en only, en+hi?

Drop everything in one reply and I'll go autonomous after.
```

## Step 4 — You answer (one big reply)

Example (the answers you'd actually paste):

```
1. "Stop chasing invoices. Get paid on time, file GST automatically."
2. Solo Indian devs + designers, 1-5 clients, invoicing 3-10 times/month.
3. Auto-generate GST invoice from a bank transaction in <30 seconds.
4. India only for first 6 months. Global English-speaking freelancers later.
5. Refrens (closest), Zoho Invoice (too heavy), Quickbooks (too expensive).
6. I freelanced for 3 years. Filed my own GST. Hated every minute of it.

7. AI to auto-categorize transactions + generate line items from short text.
8. Yes — share dashboard with CA (read-only).
9. Web first. Mobile is post-MVP.
10. Bank: HDFC + ICICI for MVP. UPI: optional. Tally: post-MVP.
11. B2C self-serve.
12. 14-day trial, no card. Then ₹499/mo or ₹4999/yr.

13. Calm, professional, modern. Not "playful startup".
14. A 30-something CA who runs marathons. Wears linen, drinks filter coffee,
    speaks plainly.
15. Love: Linear, Stripe, Vercel. Hate: typical Indian SaaS sites with too
    many gradients.
16. Cool neutral with a single accent (deep teal or burnt orange — pick one).
17. Dark mode equal to light. Devs and designers expect both.
18. Keep "InvoicePilot". Check domain.

19. ₹499/mo or $9/mo. Pro tier ₹1499/mo or $29/mo (multi-client + CA seat).
20. 17% annual discount (~2 months free).
21. ₹3L MRR by month 12 (≈ 600 paid users).

22. Supabase: https://abc.supabase.co + anon=eyJxxx + service=eyJyyy
23. Razorpay: rzp_test_aaa + secret_bbb + webhook_ccc
24. Paddle: skip
25. Vercel: connected, team=deepak
26. Resend: re_xxx + invoicepilot.com (not yet verified)
27. PostHog: phc_xxx
28. Sentry: https://abc@sentry.io/123
29. Inngest: ie_xxx + sk_xxx
30. Domain: invoicepilot.com (Namecheap), no Cloudflare yet

31. Pvt Ltd: yes (registered last year). GST: yes. IEC: no. LUT: no.
32. RBI guidelines for handling financial data. Not a fintech (don't process
    payments) but read bank txn data via Account Aggregator.
33. en + hi at launch. Hindi for tier-2 city users.
```

## Step 5 — Claude writes CLAUDE.md and goes autonomous

You see one short message:

```
Got it. Writing CLAUDE.md, creating .squad/, going autonomous.
Will only stop at the Viability Gate. Updates per phase, one line each.
```

Then Claude works silently, posting one-line updates:

```
PH-1 ✓ IDEA-BRIEF.md written. Confidence: high.
PH-2 ✓ MARKET-RESEARCH.md written. TAM ~₹120Cr, SAM ~₹15Cr.
PH-3 ✓ COMPETITOR-ANALYSIS.md written. 4 competitors, gap = "auto from bank txn".

⚠️  VIABILITY GATE — please review:
```

## Step 6 — Viability scorecard (you decide)

Claude shows:

```
VIABILITY SCORECARD — InvoicePilot

1. Money potential          7/10
   ✓ People pay Refrens (₹450/mo) and Zoho (₹600/mo)
   ✓ Indian freelancer market growing 40% YoY
   ✗ Price-sensitive segment, low ARPU

2. AI-era longevity         8/10
   ✓ Workflow tool, not GPT wrapper
   ✓ Bank integration creates switching cost
   ✓ Compliance (GST) creates moat
   AI Kill Test: If OpenAI adds invoice gen, do users still need this?
   YES — they still need bank integration + filing.

3. Competitive defensibility 6/10
   ✓ "Auto from bank" is differentiated
   ✗ Refrens could copy this in 4 weeks
   → Moat = bank partnerships + compliance trust

4. Market timing             8/10
   ✓ 1.4M+ Indian freelancers, growing post-pandemic
   ✓ Account Aggregator opens bank data access in 2024
   ✓ GST simplification = freelancers more aware

5. Execution feasibility     7/10
   ✓ 1-2 weeks for MVP via this blueprint
   ✗ Account Aggregator integration takes 2-4 weeks
   → MVP could fake bank import via CSV upload, real AA integration in v1.1

6. Founder-market fit       9/10
   ✓ 3 years freelancing experience
   ✓ Has filed own GST — knows the pain
   ✓ Can reach freelancer communities (Twitter, IH, Reddit)

7. India market fit         10/10
   ✓ Built for India, GST-native, INR pricing
   ✓ Indian freelancer segment growing
   ✓ Hindi support planned

TOTAL: 55/70 → GO ✅

Recommendation: START. Use CSV import for MVP, defer Account Aggregator
to v1.1. Focus on GST + payment reminder workflow first.

Type GO to proceed, PIVOT to brainstorm alternatives, KILL to stop.
```

## Step 7 — You say GO

```
GO
```

Claude continues autonomously through Phase 3.5 → Phase 12. Each phase
posts one line:

```
PH-3.5  ✓ COMPLIANCE-STRATEGY.md written. India-first, RBI advisory needed for AA.
PH-4    ✓ PRD.md written. MVP scope: 5 features.
PH-5    ✓ BUSINESS-MODEL.md written. ₹499 starter, ₹1499 pro.
PH-6    ✓ ARCHITECTURE.md written. Schema: 12 tables. RLS on all.
PH-7    ✓ Brand theme done. Color: deep teal #0a5e5e + warm cream #faf7f0.
        Files: brand-bible.md, brand-tokens.css, tailwind.config.brand.js
PH-8    ✓ Screens generated (Stitch). Assets:
        - logo.svg + 4 variants
        - favicon set (7 files)
        - og-image.png + social cards
        - 60s demo video (rendered)
        - 8 app screenshots (desktop + mobile)
PH-9    ✓ Scaffolded. Drizzle migrations applied. RLS verified.
PH-10   ⚙ Squad fan-out: FE + BE + Payments + Tester in parallel.
        FE done (12 components). BE done (auth + 6 endpoints).
        Payments done (Razorpay checkout + webhook). Tester: 18 E2E tests pass.
PH-11   ✓ E2E green. Security advisor: 0 issues. Lighthouse: 94 perf, 100 a11y.
PH-11.5 ✓ Quality audit by all agents. 7 issues found, 7 fixed.
PH-12   ⚠️  Need from you:
        1. Set env vars in Vercel dashboard (paste-ready list below)
        2. Add CNAME for invoicepilot.com → cname.vercel-dns.com
        3. Verify Resend domain (4 DNS records)
        4. Review legal pages: privacy-policy.md, terms.md, refund.md

        Once those are done, say "deploy" and I'll push to production.
```

## Step 8 — You handle the 4 blockers

Set Vercel env vars, point DNS, verify Resend, skim legal. Reply:

```
deploy
```

```
PH-12   ✓ Deployed to https://invoicepilot.com
        ✓ Cloudflare DNS configured
        ✓ Razorpay webhooks pointed to production
        ✓ Sentry releases tagged
        ✓ Demo video uploaded to /public/marketing/

LAUNCH ASSETS READY:
        - landing page live
        - Product Hunt copy (PRODUCT-HUNT.md)
        - Show HN draft (HN-POST.md)
        - 5 Reddit templates (REDDIT/)
        - Twitter/X launch thread (TWITTER-THREAD.md)
        - LinkedIn post (LINKEDIN.md)

DELIVERABLES (all in repo):
        IDEA-BRIEF.md, MARKET-RESEARCH.md, COMPETITOR-ANALYSIS.md,
        VIABILITY-REPORT.md, COMPLIANCE-STRATEGY.md, PRD.md,
        BUSINESS-MODEL.md, ARCHITECTURE.md, brand-bible.md,
        brand-tokens.css, tailwind.config.brand.js, design-tokens.json,
        DESIGN.md, SITE.md, CLAUDE.md, .squad/, README.md,
        legal pages (DPDPA), launch copy, ad creatives

Total time: ~4 hours of autonomous work.

When ready for post-launch, run:
"Read ~/projects/one-shot/BLUEPRINT-GROWTH.md and start with Section V
 (Validation). I have 0 paying customers and want 10 in 30 days."
```

## Step 9 — You launch

You now have a working SaaS at invoicepilot.com with:
- Functional auth, billing, GST invoice generation
- Per-country legal pages
- Brand theme + assets ready for marketing
- Demo video for Product Hunt
- All launch copy drafted

Ship it.

---

## What This Example Shows

1. **You answered ~33 questions in one reply.** No back-and-forth.
2. **Viability gate is the only stop.** Everything else is autonomous.
3. **Brand theme + assets are real.** Not generic AI slop — actual logo,
   actual screenshots, actual demo video.
4. **Blockers are batched.** Claude collects DNS + env vars + legal review
   into ONE pause, not four.
5. **Deliverables are concrete.** You get every file listed in `BLUEPRINT.md`'s
   "Deliverables Checklist".
6. **Growth is a separate phase.** Build is one-shottable. Growth is iterative
   and runs from `BLUEPRINT-GROWTH.md`.

---

## Common Variations

### "I don't have all the credentials yet"

That's fine. Provide what you have. Claude will pause at Phase 9 if a
required key is missing, ask for it once, and continue.

### "My idea is not a SaaS"

The Viability Gate classifies your product type. If it's a CLI tool, browser
extension, mobile app, marketplace, or template, the blueprint adapts the
phases. See the "Product Type Classification" table in `BLUEPRINT-BUILD.md`.

### "I want to validate before building"

Use `BLUEPRINT-GROWTH.md` Section V (Validation) **first**:

```
Read ~/projects/one-shot/BLUEPRINT-GROWTH.md and run Section V (Validation)
for this idea: [IDEA]. Don't build the product yet — just generate the
landing page test, customer interview list, and pre-sales playbook.
```

Then run the build pipeline once you have validation signal.

### "I want to go faster"

Skip the Viability Gate at your own risk:

```
Read ~/projects/one-shot/BLUEPRINT.md and execute it for: [IDEA].
I've already validated this. Skip the viability scorecard and go
straight to Phase 3.5.
```

(Not recommended for new ideas, but useful for re-runs.)

### "It built something I don't like"

Each phase logs to `.squad/decisions.md`. Read that file, find the decision
you want to change, then:

```
Update .squad/decisions.md to use [different choice] for [thing]. Then
re-run Phase [N] to apply it.
```

---

## Tips From Real Runs

- **Answer the brand questions thoughtfully.** Q13-17 drive the entire visual
  identity. "Calm, professional, modern" produces a very different product
  than "playful, energetic, bold".
- **Provide all credentials upfront.** Pausing mid-build to fetch keys breaks
  flow and wastes context.
- **Don't interrupt.** Once Claude is past the Viability Gate, let it run.
  Interrupting forces context drift.
- **Use a fresh session per major phase.** If you split work across days,
  start a new Claude session each time and let it re-read CLAUDE.md.
- **Keep `.squad/decisions.md`.** This is your project's brain. Don't delete
  it between sessions.

---

## What's Not In This Example

- Actual API responses (Claude shows them inline as it works)
- Actual generated code (it lives in your project repo)
- Actual screenshots (they're in `/public/marketing/` after Phase 8)
- Iteration after launch (that's `BLUEPRINT-GROWTH.md`)

---

Built something with this? Share it via [issue templates](.github/ISSUE_TEMPLATE/)
or [CONTRIBUTING.md](CONTRIBUTING.md).
