# Blueprint Growth — Post-Launch Playbooks

> **Purpose**: Everything after deploy. Validation, launch execution, activation,
> retention, acquisition, distribution, growth engines, customer success, analytics,
> and scaling.
>
> **Read this after `BLUEPRINT-BUILD.md` Phase 12 completes.**
>
> Growth is ongoing — not one-shottable. Each section is a playbook Claude executes
> iteratively, often triggered by `/loop` or `/schedule` skills.

---

## How This File Works

Each section has:
1. **Goal** — what this phase is trying to achieve
2. **Playbook** — exact steps Claude runs
3. **Tools** — MCPs and skills used
4. **Deliverables** — files + artifacts produced
5. **KPIs** — how to know it's working

Claude should work section-by-section, not try to run all in parallel. Validation
first, then launch, then activation, then retention + acquisition in parallel.

---

## Section V — Validation (BEFORE heavy build, OR in parallel with MVP)

> **Why this exists**: The build pipeline's Viability Gate is Claude scoring Claude.
> Real validation needs humans. Run these in parallel with Phase 10 build — not after.

### V1. Customer Interviews

**Goal**: 5-10 conversations with target users before MVP ships.

```
Playbook:
1. From PRD.md ICP, build target list:
   - Browserbase + WebSearch: find 20 target users on LinkedIn / Twitter / Reddit
   - Filter: active in last 30 days, matches ICP exactly
2. Generate outreach template (NOT a pitch — research):
   "Hi [name], I'm researching [pain area]. Not selling anything.
    15 min call — 3 questions about how you handle [problem] today?"
3. Script (Mom Test rules — past behavior only, never hypotheticals):
   - "Walk me through the last time you hit [problem]"
   - "What did you do? What worked? What didn't?"
   - "How much time / money does this cost you per week?"
   - "What would have to be true for you to switch tools?"
4. Log every call to .squad/interviews/{date}-{name}.md
5. After 5 interviews: update IDEA-BRIEF.md with findings
6. After 10: decide — continue / pivot / kill
```

**Tools**: WebSearch, Browserbase (extract contacts), Notion (log interviews)

**Deliverable**: `.squad/interviews/` directory + `VALIDATION-FINDINGS.md`

**KPI**: 50%+ interviewees confirm pain is top-3 for them → proceed.

### V2. Landing Page Smoke Test (before full build)

**Goal**: Validate demand with a landing page + waitlist before writing product code.

```
Playbook:
1. Use Phase 7 brand-tokens + Phase 8 screens (at least one hero mock)
2. Build a minimal landing page:
   - Hero: one-line pitch + CTA "Join waitlist"
   - 3 benefits
   - Demo video OR static mock
   - Waitlist form (Tally — free)
3. Deploy to Vercel (separate from main app)
4. Drive 500 targeted visitors via:
   - 3-5 relevant subreddit posts (value-first, not spammy)
   - IndieHackers launch
   - Twitter/X thread
   - LinkedIn post
5. Measure 48h:
   - Visits
   - Waitlist signups
   - Signup rate (target: ≥20%)
```

**KPI**: ≥20% landing-to-waitlist conversion → continue build. <10% → pivot.

### V3. Waitlist Management

```
1. Tally webhook → Resend → Inngest → welcome email
2. Weekly digest: progress, screenshots, BTS
3. Early-access invites in batches of 20
4. Track: open rate, click rate, unsubscribe rate
5. Segment waitlist by: pain frequency, company size, willingness-to-pay
```

**Deliverable**: `waitlist-dashboard.md` with segments and metrics

### V4. Pre-Sales / LOIs

**Goal**: Get paid (or written commitment) BEFORE the product ships.

```
1. From waitlist + interviews, pick 5-10 hottest leads
2. Offer: Founder deal — 50% lifetime discount + direct Slack access + input on roadmap
3. Price anchor: full price displayed, then discount
4. Payment options:
   a. Deposit (50% upfront via Razorpay payment link)
   b. LOI (Letter of Intent) — signed commitment to pay on launch
5. Track in Notion: Lead → Qualified → Deposit/LOI → Customer
6. If <3 convert → serious product-market fit concern, revisit Phase 1-3
```

**KPI**: 3-5 pre-sales = strong signal. 0 = pivot or kill.

### V5. Demand Testing (Fake-Door)

```
When to use: Before building expensive features post-launch
1. Add "Coming soon: [feature]" button in-app
2. On click: modal "We're building this — want early access?"
3. Track click rate + email captures
4. If <5% of active users click → don't build it
5. If >15% click → prioritize it in next sprint
```

---

## Section L — Launch Execution

### L1. Product Hunt Launch

```
Pre-launch (2 weeks out):
[ ] Create maker profile + warm up (comment on 10 launches)
[ ] Prepare gallery assets (from /public/marketing/):
    - 1 hero image
    - 5-8 screenshots (mix of desktop + mobile)
    - Demo video (thumbnail matters)
[ ] Write tagline (60 chars max) + description (260 chars)
[ ] Pick launch date: Tuesday-Thursday best (avoid Monday + Friday)
[ ] Line up 20+ upvoters (family, friends, beta users, waitlist top)
[ ] Line up 5+ makers willing to comment in first hour

Launch day (12:01 AM PT):
[ ] First maker comment: story, why you built it, what's next
[ ] Respond to EVERY comment within 30 min
[ ] Share on Twitter/X (thread), LinkedIn, relevant subreddits
[ ] Email waitlist
[ ] Update landing page banner

Post-launch:
[ ] Badge on landing page
[ ] Thank-you email to everyone who supported
[ ] Feature top feedback in changelog
```

### L2. Show HN

```
1. Title: "Show HN: [Product] — [one-line value prop]"
2. First comment (you are 'op'): story + tech stack + why you built it + what's next
3. Be HUMBLE. Expect critique. Respond to every comment with curiosity.
4. Do NOT ask for upvotes. Do NOT shill in follow-up comments.
5. Post 8-10 AM PT on weekday.
6. If it hits front page: have status page ready, Vercel scaled, support inbox monitored.
```

### L3. Reddit Launches

```
1. Identify 3-5 subreddits where ICP hangs out (check PRD.md ICP)
2. For EACH subreddit:
   - Lurk 2 weeks to understand culture
   - Post value first (answer questions, share learnings — 3-5 posts)
   - THEN share launch as "I built X because Y" — NOT as sales pitch
3. Follow each sub's self-promo rules EXACTLY
4. Respond to every comment within 1 hour for first 24h
```

### L4. Beta → Early Adopters → Public

```
Beta (20 users from waitlist):
- Direct Slack channel or Discord
- Daily check-ins
- Record every friction point
- Ship fixes within 24h

Early adopters (next 100):
- Still hands-on
- Weekly office hours (Zoom)
- Personal onboarding calls for top 20

Public release:
- Rate limit removed
- Self-serve onboarding
- Launch day campaigns (L1-L3)
```

---

## Section A — Activation

**Goal**: New user → first value as fast as possible.

### A1. Onboarding Flow

```
Principles (in this order):
1. Time-to-value < 5 minutes (from signup to "oh!")
2. Show, don't tell — demo their own data, not a tutorial video
3. Progressive disclosure — don't show everything at once
4. Every step has a clear primary action

Implementation:
- Step 1: Minimum viable profile (name + role + company — 30 sec)
- Step 2: Import or create first entity (connect to aha moment)
- Step 3: Invite teammate OR skip (social activation loop)
- Step 4: Reach the aha — a state change that demonstrates value

Code:
- onboarding_state table (user_id, step, completed_at)
- Resumable (close browser → pick up where left off)
- Skippable for power users
```

### A2. First Value Definition

```
Write "aha moment" explicitly in PRD.md:

Example (Linear): "User creates first issue and ships it to production"
Example (Notion): "User creates first page and shares it with a teammate"
Example (Figma):  "User opens first collaborative cursor session"

The aha moment is the state change where the product's value becomes undeniable.
Everything in onboarding points toward it.

Measure: activation rate = % of signups who reach aha moment within 24h.
Target: ≥40%. Industry average: 25%.
```

### A3. Time To Value (TTV) Reduction

```
Measure TTV weekly with PostHog funnel:
signup → profile → first_action → aha_moment

For each step with >20% drop-off:
1. Read Sentry errors at that step
2. Read session replays (PostHog)
3. Identify friction
4. Ship one experiment per week

Common TTV killers:
- Asking too much in signup (remove fields)
- Empty states (seed with sample data)
- Unclear CTAs (single primary action per screen)
- Slow perceived load (skeleton screens + optimistic UI)
```

### A4. Product Tours

```
Tools: Intro.js (free, self-hosted) OR Userflow/Appcues ($$)
Use sparingly — tours are a crutch for bad UX:

Good uses:
- One-time welcome tour (max 3 steps)
- Contextual tooltip on first use of a feature
- "What's new" after feature launch

Bad uses:
- Replacing clear UI
- More than 5 steps
- Blocking the user
```

---

## Section C — Conversion + Pricing

### C1. Pricing Page

```
Structure (proven pattern):
1. Anchor at the top: "Used by [N] teams"
2. Monthly / Annual toggle (annual 20% discount default)
3. 3 tiers max (paradox of choice):
   - Starter: entry price, core features
   - Pro:     recommended (highlight), everything most users need
   - Team/Enterprise: "contact sales"
4. Feature comparison table (✓ / ✗ / text)
5. FAQ: 5-7 objections (refund? cancel? migration? data? support?)
6. Final CTA: "Start free trial" — not "Sign up"

Price display:
- Local currency via PPP (from BLUEPRINT-BUILD.md countries.ts)
- Show "billed annually" subtext
- Money-back guarantee badge (reduces friction)
```

### C2. Free Trial vs Freemium

```
Use free trial when:
- Product has clear, discrete value
- Aha moment takes 1-7 days to reach
- B2B, higher price point
- Example: Linear, Notion paid, Figma paid

Use freemium when:
- Viral / social component (invite teammates)
- Free tier has standalone value
- Usage-based upgrade trigger
- Example: Slack, Figma free, Notion free

Our default: 14-day trial, no credit card required, extend by 7 days on request.
```

### C3. Sales Funnel (B2B)

```
Stages:
1. Anonymous visitor → Lead (email capture)
2. Lead → Trial user (signup)
3. Trial → Qualified (reached aha moment)
4. Qualified → Paid (upgrade)
5. Paid → Expansion (upsell)

Track each transition in PostHog. Conversion benchmarks:
- Visitor → Lead: 2-5%
- Lead → Trial: 20-40%
- Trial → Qualified: 40-60%
- Qualified → Paid: 20-40%
- Overall visitor → paid: 0.5-2%
```

### C4. CRO (Conversion Rate Optimization)

```
Monthly CRO cycle:
1. Pick 1 funnel step with biggest drop-off (PostHog)
2. Form hypothesis ("if we X, then Y because Z")
3. Design A/B test (PostHog Experiments)
4. Run until statistical significance (usually 1-2 weeks, min 500 per variant)
5. Ship winner, document in .squad/experiments/{date}.md

Common wins:
- Removing fields from forms (+20% typical)
- Single primary CTA per screen (+15%)
- Social proof near CTA (+10%)
- Loading speed <1s (+7% per 0.5s improvement)
```

### C5. Demo Flow (for higher-ticket products)

```
If price >$99/mo or enterprise:
1. "Book a demo" CTA alongside "Start trial"
2. Calendly or Cal.com integration (15-30 min slots)
3. Pre-demo: send brief questionnaire (use case, team size, timeline)
4. Demo script:
   - 2 min: their context (you listen)
   - 10 min: show THEIR use case (not generic tour)
   - 5 min: pricing + next steps
5. Post-demo: send recording + personalized follow-up within 1h
```

---

## Section Q — Acquisition

### Q1. SEO

```
Use /claude-seo-assistant skill + PostHog to track.

Pillars:
1. Technical SEO (week 1):
   - sitemap.xml, robots.txt, canonical tags
   - Structured data (JSON-LD): Product, Organization, FAQ
   - Core Web Vitals 90+
   - Mobile-first rendering
2. On-page (ongoing):
   - One H1 per page, semantic headings
   - Meta title (60 char) + description (155 char)
   - Internal linking (3-5 per post)
   - Alt text on all images
3. Content (ongoing):
   - Target long-tail keywords ICP actually searches
   - Use WebSearch + AnswerThePublic for keyword ideas
   - Format: problem-solving posts > listicles > landing pages
4. Backlinks (ongoing):
   - Guest posts on 3-5 ICP-relevant blogs per quarter
   - HARO responses for PR
   - Launch directory listings (see Distribution)

Tools: WebSearch, /claude-seo-assistant, /web-quality-skills, PostHog MCP
```

### Q2. Content Marketing

```
Content types by goal:
- Awareness:  How-to guides, comparison posts, industry reports
- Interest:   Case studies, deep tutorials, opinion pieces
- Decision:   Feature deep-dives, pricing breakdown, vs competitors
- Retention:  Changelogs, customer stories, advanced tips

Publishing cadence:
- MVP: 1 high-quality post per week
- Scale: 3 posts/week + 1 newsletter

Where to publish:
1. Own blog (MDX + Contentlayer from Phase 9)
2. Dev.to / Hashnode / Medium (syndication with canonical)
3. LinkedIn (article + post teaser)
4. Newsletter (Resend)

Distribution after publish:
- Twitter thread (extract 5-7 key points)
- LinkedIn post (hook + 3 insights + link)
- Relevant subreddits
- HN (if novel technical insight)
- Newsletter
```

### Q3. Social Media

```
Pick 2 channels max based on ICP:
- B2B SaaS: LinkedIn + Twitter/X
- Dev tools: Twitter/X + Dev.to
- Design tools: Twitter/X + Dribbble
- B2C: Instagram + TikTok + YouTube Shorts

Posting cadence: daily, 5 days/week minimum.

Content mix (per week):
- 2 educational (how-to, insights)
- 2 product (features, demos, BTS)
- 1 personal story (founder journey)

Use Canva MCP for consistent branded graphics.
Use Pomelli for brand-consistent social content.
Schedule via Buffer / Typefully / Tweet Hunter.
```

### Q4. Cold Outreach (B2B)

```
Ethical cold outreach playbook:

1. Build targeted list (50-100/week):
   - Apollo.io / Clay for contact data
   - Filter EXACTLY to ICP
   - Enrich with LinkedIn activity

2. Personalize (mandatory):
   - Reference something specific (recent post, company news)
   - NOT "I saw you're interested in [vague topic]"
   - ACTUAL 10 seconds of research per contact

3. Template (short — 4 sentences):
   Hi [first name],
   [1 sentence: something specific to them]
   [1 sentence: problem you noticed / relevant to them]
   [1 sentence: how your product addresses it, with 1 customer proof]
   Worth a 15-min chat?

4. Follow-up: 3 touches max, 5 days apart.
5. Track in CRM (Notion database): Contacted → Opened → Replied → Meeting → Customer.

Ethics: respect unsubscribes immediately. Never use dark patterns.
GDPR: must have lawful basis. Don't cold-email EU contacts without checking.
```

### Q5. Communities

```
Long-term play. Budget: 10 hrs/week across 3-5 communities.

Rules:
1. Lurk 2 weeks before posting
2. 90% value, 10% self-promo (unless the sub allows more)
3. Answer questions in your domain expertise
4. NEVER drop links without context
5. Build a reputation, not a funnel

Where to look:
- Reddit subs matching ICP
- Discord servers (dev tools, SaaS communities)
- Slack communities (Product School, Demand Curve, etc.)
- IndieHackers, Hacker News
- Circle / Mighty Networks private communities

Track: DMs received, profile clicks, signups attributed.
```

### Q6. Influencer Outreach

```
Micro-influencers (1K-50K followers) are higher ROI than macro.

Playbook:
1. Find 20 creators whose audience = your ICP
   - Twitter search by keyword + follower range
   - YouTube search by topic + subscriber range
   - LinkedIn creators posting about your domain
2. Engage genuinely for 2 weeks (like, comment, share)
3. Pitch:
   - Free lifetime account + personalized demo
   - For paid: $100-500 for a honest review (disclose!)
   - For larger: affiliate + revenue share
4. Track attribution via unique UTM codes
5. Expect 1 in 10 to convert. Scale what works.
```

### Q7. Affiliate Program

```
When to start: After you have 100+ paying customers and retention data.

Setup:
- Use Rewardful / Tolt / FirstPromoter ($50-100/mo)
- Commission: 20-30% recurring for 12 months (SaaS standard)
- OR 50% one-time if annual plans only
- Minimum payout: $50
- Cookie window: 60 days

Recruit:
1. Existing customers (they already love you)
2. Content creators in your niche
3. Agencies / consultants who serve your ICP

Provide:
- Branded assets (logos, screenshots, banners — from /public/marketing/)
- Copy templates (tweet, email, blog post)
- Monthly leaderboard + bonus for top performers
```

### Q8. Paid Ads

```
Only start AFTER:
- You have 20+ paying customers
- You know CAC target (from LTV × 0.33 rule)
- Organic channels are saturated

Use /ads-plan, /ads-create, /ads-generate, /ads-meta, /ads-google, /ads-linkedin skills.

Starter allocation (first $1000):
- 70% Google Ads (search — high intent)
- 20% Meta Ads (retargeting website visitors)
- 10% LinkedIn (B2B only)

Track everything in PostHog with UTM + server-side conversion tracking.
Kill any campaign with CAC > 0.33 × LTV after 2 weeks.
```

---

## Section D — Distribution

> **Biggest blind spot in the original blueprint.** Don't skip.

### D1. Directories (submit first month)

```
General SaaS:
[ ] Product Hunt (launched)
[ ] BetaList
[ ] G2 (paid tier, but list is free)
[ ] Capterra
[ ] SaaSHub
[ ] AlternativeTo
[ ] Software Advice
[ ] GetApp
[ ] StackShare

Indie:
[ ] IndieHackers
[ ] Starter Story
[ ] MicroLaunch
[ ] Uneed
[ ] Fazier

Dev tools:
[ ] DevHunt
[ ] TinyStartups
[ ] SideProjectors

Each submission: use Phase 8 assets (logo, OG, screenshots, demo video).
Track in Notion database: Directory → Submitted → Approved → Backlink.
```

### D2. SaaS Marketplaces (if applicable)

```
If product extends another platform:
[ ] Shopify App Store
[ ] Slack App Directory
[ ] Zapier App Directory
[ ] Zoom Marketplace
[ ] Atlassian Marketplace
[ ] Notion Integrations
[ ] Chrome Web Store
[ ] WordPress Plugin Directory

Each has its own review process (days to weeks).
Start early — don't wait for launch.
```

### D3. Partnerships

```
Types:
1. Co-marketing: joint webinar, guest posts, newsletter swaps
2. Bundle deals: your product + complementary tool, discount
3. Technology partnerships: official integration + co-announcement
4. Reseller / referral: partner sells your product for a cut

Ideal partners share your ICP but don't compete.
Example: if you build project management for agencies, partner with
time tracking tools, invoicing tools, proposal tools.

Outreach: 5/week, personalized, specific mutual-value proposal.
```

### D4. Integrations

```
Every integration is a distribution channel:
- Zapier: lowest bar, high reach
- Make.com: alternative to Zapier
- Native integrations with popular tools in ICP stack
- API + webhooks for enterprise custom integrations

Priority: build integrations for tools your top 10 customers already use.
Not for hypothetical users.
```

---

## Section R — Retention

> **Biggest gap in the original blueprint.**

### R1. Onboarding (post-signup retention)

Already covered in Activation (Section A). Retention-focused additions:

```
Day 0: Welcome email + guided first action
Day 1: "Did you get stuck?" — offer 15-min onboarding call
Day 3: "Here's what users who love [product] do next" — feature reveal
Day 7: Usage summary + suggest next aha moment
Day 14: "What's missing?" — feedback form
Day 30: Case study of similar user who succeeded
```

### R2. Lifecycle Email Automation

```
Segment users by behavior, not demographics:

Segment                    → Trigger
─────────────────────────────────────────────────────
New (not activated)         → Onboarding sequence (R1)
Active (used core feature)  → Weekly value digest
Power (used >3 features)    → Beta access to new features
At-risk (usage dropping)    → Re-engagement sequence (R5)
Churned                     → Win-back sequence (R5)

Tool stack:
- Inngest: triggers + step functions
- React Email: templates
- Resend: delivery
- PostHog: segment definitions

Track per-email:
- Delivery rate (>95%)
- Open rate (>25%)
- Click rate (>3%)
- Unsubscribe rate (<0.5%)
```

### R3. Customer Success (CS)

```
For B2B / higher-tier customers:

Tier                        → CS touch
─────────────────────────────────────────────────────
Self-serve (<$100/mo)       → Automated only (R2)
Mid-market ($100-1K/mo)     → Monthly health check email
Enterprise (>$1K/mo)        → Dedicated CSM + quarterly business review

CSM playbook:
1. Onboarding call (week 1): goals, success criteria
2. 30-day check-in: are they hitting goals?
3. 90-day review: ROI demonstration
4. Quarterly business review (QBR): outcomes + expansion
5. Annual renewal: 60 days ahead of renewal date

Tools: Vitally / ChurnZero (enterprise), or Notion database (scrappy).
```

### R4. Feature Adoption

```
Goal: Move users from "used 1 feature" → "used 3 features".
Power users stick 3x longer.

Playbook:
1. PostHog cohort: users who have used feature X but not feature Y
2. In-app nudge: "You might like [Y] — it does [benefit]"
3. Email: "3 features you haven't tried yet"
4. Help doc + tooltip at the point of first encounter
5. Track adoption rate per feature — identify discovery failures

Monthly review:
- Which features have <20% adoption? Either improve discovery OR remove.
- Remove features that 6 months post-launch have <5% adoption.
```

### R5. Churn Reduction

```
Leading indicators of churn:
- Usage drop >50% week-over-week
- No login in 14 days
- Downgrade (half of downgrades churn within 3 months)
- Support ticket with frustrated tone
- NPS ≤6

Automated responses per indicator:
- Usage drop: "We noticed a slowdown — anything we can help with?"
- Inactive: "Here's what's new since you were last here" + personal note
- Downgrade: founder email within 24h asking why
- Ticket: escalate priority, personal follow-up
- Low NPS: call within 48h, understand, fix, follow-up in 2 weeks

Cancellation flow (must-have):
1. Never hide cancel button — dark patterns backfire
2. Ask ONE question: "What's the main reason?"
3. Show an offer based on reason:
   - Too expensive → discount or downgrade
   - Missing feature → add to roadmap, notify when shipped
   - Not using → pause subscription (3 months)
   - Switching → honest no-hard-sell goodbye
4. Exit survey → .squad/churn/{date}-{user}.md
5. Win-back email 30 days later: "What changed? Come back for X off"
```

### R6. Feedback Loops

```
Passive:
- In-app feedback widget (Tally / Canny / built-in)
- Public roadmap where users vote (Canny / GitHub issues)
- NPS survey every 90 days (PostHog Surveys)

Active:
- Quarterly power-user interviews (6 users)
- Monthly office hours (open Zoom)
- Exit interviews on cancellation (R5)

Loop closure:
- Every piece of feedback gets a response
- Roadmap publicly shows what's being worked on
- Changelog announces shipped items + credits the requester
- "You asked, we built" emails to users who requested the feature

This is the single biggest retention lever for small SaaS.
```

---

## Section $ — Revenue Expansion

### $1. Subscriptions (baseline)

```
Already set up in Phase 10. Ongoing:
- Review price monthly (compare to competitors, cost of delivery)
- Annual plans: push hard (reduces churn 30-50%)
- Grandfathering: honor old prices for existing customers (trust > revenue)
```

### $2. Usage-Based Pricing (UBP)

```
Add when:
- Clear metric drives value (API calls, GB stored, seats, events)
- Customers asking for higher limits
- Cost of delivery scales with usage

Implementation:
- Meter in your code (Stripe Billing Meter / custom)
- Inngest schedules monthly billing event
- Soft cap (warning at 80%) + hard cap (at 100%, require upgrade)
- Transparent dashboard showing current usage

Pricing design:
- Base fee + overage (stability + upside)
- Pure usage (startups — low commitment)
- Prepaid credits (high-volume enterprise)
```

### $3. Upsells

```
Natural upsell moments:
- Hit plan limit → "Upgrade to continue"
- Advanced feature → "Available on Pro"
- Team growth → "Add more seats"
- High usage → "Save 20% with annual"

Never block the aha moment behind an upsell. Upsells come AFTER value.
```

### $4. Add-ons

```
Modular features priced separately:
- White-labeling: +$X/mo
- API access: +$X/mo
- Advanced analytics: +$X/mo
- Priority support: +$X/mo
- SSO/SAML: +$X/mo (enterprise table stakes)
- Audit log export: +$X/mo (compliance)

Gate by plan tier, not pay-wall.
```

### $5. Enterprise Deals

```
When to open enterprise:
- 3+ inbound requests for "contact sales"
- Customer wants features not in any plan
- Deal size would be >$10K/yr

Enterprise playbook:
1. "Contact sales" form → your calendar (Cal.com)
2. Discovery call: needs, timeline, budget, decision process, stakeholders
3. Proposal: customized pricing + SLAs + MSA
4. Security review: SOC 2 report (if you have it), DPA, pen test results
5. Legal: redline contracts (budget for a contract lawyer)
6. Close: PO, invoice, onboarding kickoff

Enterprise often requires:
- SSO/SAML (add-on or included)
- Audit logs
- Custom roles
- Dedicated environment
- Uptime SLA
- Security questionnaire (SIG Lite, CAIQ)
- DPA, SCC (GDPR)
- Security review call
```

### $6. Lifetime Deals (LTD)

```
Use carefully — LTDs are cash today, support burden forever.

Appropriate when:
- Early stage, need capital
- Product has low marginal cost
- You can service the cohort long-term

Channels:
- AppSumo (big audience, takes 30-50% cut)
- PitchGround
- DealMirror
- SaaSzilla

Price:
- 60-80% off normal annual
- Lifetime = usually 5 years OR company lifetime, whatever's shorter
- Cap quantity (e.g., first 500) — creates urgency

Risks:
- Low-quality customers (price-driven)
- Support overload
- Dilutes brand if positioned as premium
```

### $7. Annual Plans

```
Single most impactful revenue lever for SaaS.

Push annual via:
- 20% discount
- Unlock annual-only features (extra seats, priority support)
- Annual-only add-ons
- Quarterly email: "Save 20% by going annual"

Target: 40% of new signups on annual within 6 months.
Annual reduces monthly churn by 30-50% (longer lock-in, fewer decision points).
```

---

## Section CS — Customer Success Operations

### CS1. Support

```
Tiers by response time:
- Free:       48h email only
- Starter:    24h email + chat
- Pro:        12h email + chat + Loom video
- Enterprise: 2h SLA + Slack Connect + dedicated CSM

Tools:
- Crisp / Tawk.to (free tier) — live chat
- Intercom / Front / Help Scout ($$) — full helpdesk
- Plain.com — modern scrappy alternative

Inbound triage:
- Auto-reply with ticket number + expected response time
- Tag by: bug / feature / billing / how-to / churn risk
- Route to correct owner

Success metric: First response time, first contact resolution, CSAT.
```

### CS2. Help Docs

```
Use /doc-coauthoring or /engineering-technical-writer.

Structure:
1. Getting started (5 articles — matches onboarding)
2. Core features (1 article per feature)
3. Integrations (1 per integration)
4. Troubleshooting (top 20 support questions)
5. API reference (auto-generated from OpenAPI)
6. Changelog (auto from git tags)

Tool: Mintlify / GitBook / Docusaurus / own MDX.

Every article: single goal, screenshots, expected outcome, next steps.

Measure: search queries with 0 clicks (gap in docs), support tickets that
could have been self-served (gap in docs discoverability).
```

### CS3. Live Chat

```
When to offer:
- Pricing page (every visitor: 5-10% use chat → higher conversion)
- In-app for Pro+ users
- During trial (nudge at day 3, day 7)

Don't offer when:
- You can't answer within 2 minutes (worse than no chat)
- At 2am with no automation

Routing:
- Business hours: real human
- After hours: auto-reply + form → email follow-up within 2h
```

### CS4. Success Metrics

```
North star: Net Revenue Retention (NRR) >100%
- <90% = churning faster than growing (fix retention now)
- 90-100% = healthy SaaS
- >100% = expansion outpaces churn (great)
- >120% = top 10% of SaaS

Supporting metrics:
- Gross Revenue Retention (GRR): excludes expansion, pure churn health
- CAC payback period: <12 months good, <6 months excellent
- LTV:CAC: >3 sustainable, >5 excellent
- Logo churn: <2%/mo good, <1%/mo excellent (B2B)
- Revenue churn: <3%/mo good, <1%/mo excellent
- NPS: >30 good, >50 excellent, >70 world-class
```

### CS5. Account Management

```
Segment by ARR:
- <$1K/yr: automated (no AM)
- $1-10K/yr: shared AM (1 per 100 accounts)
- $10-100K/yr: dedicated AM (1 per 20 accounts)
- >$100K/yr: dedicated CSM + solutions engineer

AM responsibilities:
- Onboarding success
- Health score monitoring
- Renewal (start 90 days before)
- Expansion opportunities
- QBRs (quarterly business reviews)
- Churn rescue
```

---

## Section M — Analytics

### M1. Event Tracking

```
Pick the right events (NOT everything):

Critical events (track day 1):
- signed_up
- completed_onboarding
- reached_aha_moment (define explicitly in PRD)
- used_core_feature
- upgraded_to_paid
- churned
- referred_user

Secondary (add week 2):
- feature_X_used (one per feature)
- feedback_submitted
- support_ticket_created
- integration_connected

Properties on every event: user_id, plan, country, signup_source.

Tool: PostHog. Server-side tracking for attribution-critical events
(upgraded_to_paid should never be client-side — ad blockers).
```

### M2. Funnel Analysis

```
Build 3 funnels, monitor weekly:

1. Signup funnel:
   landing → pricing → signup → verify → first_login → onboarding_complete

2. Activation funnel:
   onboarding_complete → first_action → second_action → aha_moment

3. Monetization funnel:
   aha_moment → pricing_viewed → upgrade_clicked → payment_completed → subscribed

For each step with >20% drop-off: write a hypothesis, run experiment, measure.
```

### M3. Cohort Analysis

```
Retention cohorts by signup week:
- Day 1, 7, 14, 30, 60, 90 retention %
- Target: Day 30 retention >40% (B2B SaaS)

Identify:
- Cohorts that retain better → what did they do differently?
- Cohorts that churn → what friction hit them?

Also cohort by acquisition channel — which channels bring stickiest users?
```

### M4. Attribution

```
Multi-touch attribution is hard. Start simple:

First-touch: what first introduced them to you
Last-touch: what made them pay
Assisted: every touch between

Tools:
- PostHog (free, unified with product analytics)
- Plausible / Fathom (privacy-first web analytics)
- Dreamdata / HockeyStack ($$, B2B-grade)

UTM discipline:
- Every external link has utm_source + utm_medium + utm_campaign
- Store first_source + last_source on user record
- Review by channel monthly, reallocate spend
```

### M5. A/B Testing

```
Only test when:
- You have >500 weekly active users (else no statistical power)
- The experiment matters (>20% impact possible on key metric)
- You have a clear hypothesis

Tool: PostHog Experiments (free, built-in).

Process:
1. Hypothesis: "If we [change], [metric] will [direction] because [reason]"
2. Sample size calc: use PostHog's calculator
3. Run min 1 week (weekday patterns) or until stat sig
4. Don't peek early — wait for the full run
5. Ship winner, kill loser, document in .squad/experiments/{date}.md
6. Re-test winners after 6 months (things drift)

Don't test:
- Cosmetic changes that don't move metrics
- >2 variants (noise dominates)
- Multiple things at once (you can't isolate)
```

---

## Section G — Growth Engines

### G1. Product-Led Growth (PLG)

```
Principles:
- Product markets itself — every user is a potential acquirer
- Free tier with real value (not crippled demo)
- Time-to-value <5 min
- Virality built into core loops

Implementation:
- Self-serve signup (no sales required)
- In-product upgrade CTAs at usage limits
- Invite flows in every collaborative feature
- Sharable artifacts (public share links, embeds)
- Usage-based metering visible to user

Example loops:
- User creates content → shares externally → recipient sees "Made with X" → signs up
- User invites teammate → teammate uses → teammate invites own team
```

### G2. Referral Programs

```
When to launch: After you have 100+ happy customers + NPS >40.

Structure:
- Give X, Get X (double-sided beats one-sided)
- Example: "Give a friend 20% off, get $20 credit when they pay"
- Or: "Invite 3 friends, get 1 month free"

Tools:
- Rewardful / Viral Loops / GrowSurf ($50-100/mo)
- Or build with Inngest + unique codes

Promotion:
- Post-aha moment in-app prompt
- Day 30 email
- Sidebar widget in dashboard

Track: referral signups, conversion rate, LTV of referred vs organic
(referred usually 20-40% higher LTV).
```

### G3. Viral Loops

```
K-factor = avg invites per user × invite conversion rate
K > 1 = exponential growth (rare)
K = 0.3-0.5 = healthy amplification
K < 0.1 = negligible

Design loops:
1. Content loop: user creates → shares → viewer signs up
   (Canva, Figma, Notion)
2. Collab loop: user invites teammates
   (Slack, Linear, Figma)
3. Network loop: more users = more value for existing
   (Twitter, Calendly)
4. Embed loop: user embeds on own site with branding
   (YouTube, Typeform, Tally)

Measure K monthly. If K <0.1, you need paid acquisition.
```

### G4. Community Building

```
When to start: As early as possible — pre-launch if possible.

Platforms:
- Discord / Slack — real-time, great for dev tools
- Circle / Mighty Networks — threaded, paid communities
- GitHub Discussions — for OSS
- Forum (Discourse) — async, SEO-friendly

Growth:
1. Seed with 10 people you know personally
2. Host weekly event (office hours, AMA, workshop)
3. Reward contributors publicly (badges, spotlight, swag)
4. Moderate firmly but kindly
5. Share in community only (makes membership valuable)

Content you can only get in the community:
- Founder AMAs
- Beta features
- Roadmap input
- Direct support from team
- Peer-to-peer help
```

### G5. Growth Experiments

```
Weekly experiment cadence:
1. Monday: pick experiment (1 acquisition + 1 retention)
2. Tuesday: design + ship
3. Wednesday-Sunday: run
4. Next Monday: analyze, document, ship winner

Prioritize with ICE scoring:
- Impact (1-10): how big if it works
- Confidence (1-10): how likely to work
- Ease (1-10): how cheap to test
- Score = I × C × E

Top 3 highest scores → run this week.

Document every experiment (winners AND losers) in .squad/experiments/.
Pattern-match across experiments to find recurring wins.
```

### G6. Network Effects

```
Not every product has them. If yours does, accelerate.

Types:
1. Direct: more users = more value for each user (Slack, WhatsApp)
2. Indirect: more users attract complementary providers (Uber, Airbnb)
3. Data: more users generate more training data (better product)
4. Social: users come for connections (Twitter, LinkedIn)

Amplifiers:
- Seed communities geographically or by vertical (reach density)
- Import contacts / lookups (leverage existing networks)
- Public profiles that get indexed (SEO from user content)
- APIs that let developers build on top (ecosystem)
```

---

## Section $$ — Monetization Expansion

Already partially in Section $ (Revenue). Expansion focus:

### $$1. Enterprise Tier

```
Trigger: 3+ requests OR ACV opportunity >$10K.

Build:
- SSO/SAML (WorkOS or custom)
- SCIM provisioning
- Role-based access control (advanced)
- Audit logs (long retention)
- Uptime SLA (99.9%+)
- Dedicated environment (optional)
- Custom contracts
- Vendor onboarding (SIG / CAIQ / security review)
- Dedicated Slack channel

Pricing: custom, starts at 3-5x Pro.
```

### $$2. Add-On Revenue

```
Monetize features used by subset of power users:
- White-labeling
- API access tier
- Advanced analytics
- Priority support
- Training / onboarding package
- Migration service
- Custom integrations

Each add-on: separate line item, predictable MRR, high margin.
```

### $$3. Upsell Flows

```
Trigger points:
- Plan limit hit → in-product prompt
- Feature attempt (locked) → preview + upgrade CTA
- High engagement → "Power users love Pro" email
- Team growth → "Add seats" reminder

Conversion rate on trigger-based upsells: 2-5% (typical).
Focus on timing, not aggression.
```

### $$4. Cross-Sell

```
Only relevant if you have multiple products.
Early stage: don't build a second product. Finish the first.

When ready:
- Bundle discount (save 20% on both)
- In-product cross-mentions
- Shared account / SSO between products
```

---

## Section SC — Scaling

### SC1. Automation

```
As you grow, automate repetitive ops:
- Onboarding: Inngest flow triggered by signup
- Billing: Razorpay webhooks auto-update state
- Support triage: AI labels tickets by category
- Lead scoring: PostHog events → CRM update
- Reporting: scheduled PostHog queries → Slack / email

Rule: if you do it 3 times, automate it. 10 times, document it. 30 times, hire.
```

### SC2. Hiring (first 5 hires)

```
Order matters. Founders do everything until each role has >20 hrs/week of work.

1. Customer Success / Support (when response time slipping)
2. Full-stack engineer #2 (when you can't ship features)
3. Growth / Marketing (when you know CAC works)
4. Second engineer (when codebase slows you down)
5. Ops / Finance / HR (when admin eats >1 day/week)

NOT "VP of X" hires at this stage. Doers only.

Hiring process:
- Async work sample (paid 2-4 hour project)
- Reference checks BEFORE offer (non-negotiable)
- Trial period explicit in offer (30 days)
- Document everything onboarded people need in .squad/onboarding/
```

### SC3. Systems

```
Replace heroics with systems as you grow:

< 100 customers: Notion + spreadsheets fine
100-1K customers: CRM (Attio / HubSpot), helpdesk (Help Scout), proper CI/CD
1K+ customers: data warehouse (Supabase → ClickHouse / BigQuery), BI (Metabase),
   on-call rotations, runbooks
10K+ customers: dedicated SRE, security team, legal retainer

Each transition: document in ARCHITECTURE.md why and when.
```

### SC4. Global Expansion

```
Already planned in Phase 3.5 (compliance matrices + country config + PPP).

Execution per new country:
1. Translate UI (next-intl → Crowdin / Tolgee review)
2. Translate legal pages (per-country compliance already mapped)
3. Add local payment methods (via payment adapter)
4. Localize marketing (Canva MCP with local language)
5. Hire local CS (or timezone-match existing)
6. Launch: local PH equivalent, local communities

Measure per country: signups, activation, revenue, support volume.
Kill countries that underperform after 90 days.
```

### SC5. Exit Strategy

```
Options (plan early, execute late):
1. Lifestyle: profitable, stays private, founder cashflow
2. Acquisition: sell to strategic (SaaS operator) or financial (PE/aggregator)
3. IPO: far off for most, requires scale ($100M+ ARR)
4. Merger: combine with peer for scale

Prepare (makes every option easier):
- Clean cap table
- Clean financials (audited after $1M ARR)
- IP assignments (every contributor signs)
- Customer contracts (no landmines)
- Recurring revenue >80% of total
- Churn <2%/mo
- Growth >20% YoY
- Documentation of everything

Acquirer due diligence asks for all of the above. Start collecting from day 1.
```

---

## Loop / Schedule Automation

```
Post-launch, use /loop and /schedule for recurring work:

/schedule (cron jobs):
- Daily: error check (Sentry), uptime check (BetterStack), critical KPIs
- Weekly: funnel analysis (PostHog), experiment review, content publish
- Monthly: pricing review, cohort analysis, financial reconciliation
- Quarterly: NPS survey, customer interviews, strategy review

/loop (active polling):
- New support tickets (auto-triage + alert)
- Churn signals (auto-trigger rescue flow)
- New waitlist signups (auto-enrichment + welcome)
- Payment failures (auto-retry + customer notify)
```

---

## KPI Dashboard

Track these weekly in PostHog + Notion:

```
ACQUISITION
- Visitors per week
- Signup conversion rate
- CAC per channel
- Top channels by volume + quality

ACTIVATION
- Activation rate (signup → aha moment)
- Time to aha moment (median)
- Onboarding completion rate

RETENTION
- Day 1, 7, 30, 90 retention
- Weekly active users
- Monthly active users
- WAU/MAU ratio (stickiness)

REVENUE
- MRR + growth rate
- ARR
- Paying customers
- ARPU (average revenue per user)
- LTV
- LTV:CAC ratio
- CAC payback (months)

RETENTION $
- Logo churn rate (monthly)
- Revenue churn rate (monthly)
- Gross Revenue Retention (GRR)
- Net Revenue Retention (NRR)
- Expansion revenue as % of new MRR

REFERRAL
- Viral coefficient (K)
- Referral conversion rate
- % of new signups from referrals

HEALTH
- NPS
- CSAT
- Support ticket volume
- First response time
- First contact resolution rate
```

---

*End of growth playbook. Growth is ongoing — revisit each section quarterly.*
*When stuck: `.squad/decisions.md` has all past decisions + rationale.*
*When scaling: hire into the bottleneck, not the title.*
