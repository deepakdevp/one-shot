# Contributing to One-Shot

Thanks for considering a contribution. This blueprint gets sharper with every
real project run through it. Your bug reports, success stories, and PRs make
it better for every future founder.

---

## Quick Links

- 🐛 [Report a bug](https://github.com/deepakdevp/one-shot/issues/new/choose)
- ✨ [Suggest a feature](https://github.com/deepakdevp/one-shot/issues/new/choose)
- 🎉 [Share a success story](https://github.com/deepakdevp/one-shot/issues/new/choose)
- 💬 [Discussions](https://github.com/deepakdevp/one-shot/discussions)

---

## Ways to Contribute

### 1. Run the blueprint and report what breaks

The most valuable contribution. Run it on a real idea, note where it stumbles,
file an issue with:
- The trigger prompt you used
- Which phase failed (or produced bad output)
- What you expected vs what happened
- Your environment (OS, Claude Code version, MCP servers installed)

### 2. Add country compliance

Phase 3.5 in `BLUEPRINT-BUILD.md` covers India, USA, EU, UK, Brazil, Singapore,
UAE, Japan, and Southeast Asia.

Missing or thin: Canada, Australia, South Africa, Mexico, Nigeria, Kenya,
Saudi Arabia, deeper Indonesia / Vietnam.

For each new country, add:
- Privacy law summary with citations
- Data localization requirements
- Recommended payment gateways
- Tax handling (rate + collection method)
- Language requirements
- Cross-border transfer rules from India

### 3. Add product type adaptations

`BLUEPRINT-BUILD.md` lists 15 product types. If you've built a type that
doesn't fit the SaaS pipeline cleanly, add an adaptation section explaining
what to skip, what to add, what to substitute.

High demand: Shopify apps, WordPress plugins, Slack apps, Discord bots,
Chrome extensions, VS Code extensions, CLI tools, mobile apps.

### 4. Add payment gateway adapters

Defaults are Razorpay (India) + Paddle (global MoR). Adapter contributions
welcome for: PhonePe, Cashfree (deeper), CCAvenue, Instamojo, Mollie (EU),
Adyen, Mercado Pago (LATAM), GoPay, GCash.

Each adapter should match the `PaymentAdapter` interface in `BLUEPRINT-BUILD.md`
Phase 6.

### 5. Skill / MCP recommendations

Criteria:
- Open source or vendor-official
- Maintained (commits in last 6 months)
- Solves a real Phase X need
- Doesn't duplicate something already in `setup.sh`

### 6. Improve `BLUEPRINT-GROWTH.md`

The growth playbook is the newest part and most likely to need refinement.
PRs that add concrete tactics, real examples, or correct bad advice are
welcome. Cite sources for any benchmark numbers.

### 7. Translate

Translations to Hindi, Tamil, Telugu, Bengali, Spanish, Portuguese, Bahasa,
Arabic, etc. are welcome. Keep code/CLI strings in English.

### 8. Share success stories

Built something with this? File a success story issue with:
- What you built
- Which phases worked well
- Which phases stumbled
- Token usage
- Time to launch
- Any custom adaptations

These help calibrate expectations and reveal blind spots.

---

## How to Submit a PR

### Setup

```bash
# Fork via GitHub UI, then:
git clone https://github.com/YOUR_USERNAME/one-shot.git ~/projects/one-shot
cd ~/projects/one-shot
git remote add upstream https://github.com/deepakdevp/one-shot.git
git checkout -b your-branch-name
```

### Make your change

- Edit the file(s)
- Match the existing tone (terse, action-oriented, no fluff)
- Match the existing markdown style
- If you add a new section, link it from the relevant index/table

### Commit

```bash
git add <files>
git commit -m "Add [thing] for [reason]"
```

Use imperative mood ("Add", "Fix", "Update") not past tense.
Keep the subject line ≤72 chars.

### Push and PR

```bash
git push origin your-branch-name
# Open a PR via GitHub UI
```

In the PR description:
- What you changed
- Why
- How you tested it (if applicable)
- Related issues

### Review

Maintainer reviews within 1 week. If no response, ping the PR.

---

## Style Guide

### Markdown

- Headings: ATX style (`#`, `##`, `###`)
- Code blocks: triple backticks with language tag where possible
- Lists: `-` for unordered, `1.` for ordered
- Tables: GFM with header separators
- No emoji in headings or filenames
- Line length: aim for ~80–100 chars but don't sweat it

### Tone

- Terse. Action over explanation.
- Imperative ("do X") not subjunctive ("you might consider doing X")
- No filler ("This section will discuss...", "It's worth noting that...")
- No marketing-speak ("game-changing", "revolutionary", "best-in-class")
- Cite sources for claims (with URLs)

### Structure

Every new section should answer:
1. **What** is this?
2. **When** do you use it?
3. **How** do you do it (concrete steps)?
4. **What's the deliverable** (file or output)?
5. **What does success look like** (KPI or check)?

---

## Guidelines for Specific Files

### `BLUEPRINT.md` (the index)

- Keep it under 250 lines — must fit in one Claude tool call
- Don't add detailed instructions here; they belong in `BLUEPRINT-BUILD.md`
- Updates here should also update the deliverables checklist

### `BLUEPRINT-BUILD.md` (phases 0–12)

- Phase numbering is load-bearing — don't renumber existing phases
- Every tool/skill mentioned must have an install path (in `setup.sh` or
  documented in `SETUP.md`)
- Add new phases only with strong justification
- Test your changes by actually running the phase with Claude Code

### `BLUEPRINT-GROWTH.md` (post-launch)

- Section letters (V, L, A, C, Q, D, R, $, CS, M, G, $$, SC) are stable —
  add new content within existing sections rather than creating new top-level ones
- Every tactic should have measurable KPIs
- Cite source for any benchmark number

### `setup.sh`

- Use `-y -g` flags for non-interactive installation
- Add `2>/dev/null || echo "already exists, skipping"` for git clones
- Group by: MCP servers, official vendor skills, community skills
- Test on a clean machine before submitting

### `.env.example`

- Group by service, not alphabetical
- Mark required vs optional
- Comment with where to get each key
- Never commit a filled-in version

---

## What Won't Be Accepted

- Adding a tool/skill/MCP just because it's trendy — justify the value
- Adding a section that duplicates existing content
- Adding marketing language for a vendor
- Removing India-first defaults (load-bearing — the blueprint targets Indian
  founders specifically)
- Replacing Razorpay with Stripe as a default (Stripe is fine if you have a
  US entity, but Razorpay is the right default for India)
- Sweeping rewrites that break existing project structures

---

## Code of Conduct

Be respectful, constructive, and specific. "This doesn't work" is not helpful.
"Phase 10 fails when building a CLI tool because it tries to generate Stitch
screens" is helpful.

See [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for full community standards.

---

## Questions?

Open a [discussion](https://github.com/deepakdevp/one-shot/discussions) or
file an issue with the `question` label.

Thanks for contributing.
