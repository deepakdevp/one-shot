# Setup — One-Time Installation

Everything you need to install before running One-Shot. Budget ~30–60 minutes.

---

## 1. Install Claude Code

```bash
npm install -g @anthropic-ai/claude-code
claude --version
```

Login when prompted. A Max plan is recommended — full SaaS builds use a lot
of tokens. Pro works for research-only or small projects.

---

## 2. Clone this repo

```bash
git clone https://github.com/deepakdevp/one-shot.git ~/projects/one-shot
cd ~/projects/one-shot
```

> Keep the path `~/projects/one-shot`. The trigger prompt references this path.
> If you put it elsewhere, update the path in your prompt.

---

## 3. Install MCP servers + skills

```bash
bash setup.sh
```

This installs:

**MCP servers** (Tier 1):
- `playwright` — E2E testing
- `github-mcp-server` — repos, PRs, issues
- `cloudflare` — DNS, CDN, Workers, R2

**Skills** (official vendor):
- Vercel Labs Next.js skills
- React best practices
- Stripe payment patterns
- Better Auth (auth setup, 2FA, orgs, providers)
- Supabase Postgres best practices
- Web quality (Lighthouse, Core Web Vitals, SEO, a11y)
- Cloudflare (Wrangler, web-perf, workers-best-practices)

**Skills** (community):
- Claude SEO Assistant
- a11y audit
- MJML email templates
- Docker Skills Package
- Framer Motion
- Next.js community skills

If anything fails:

```bash
bash fix-skills.sh
```

### Verify

```bash
ls ~/.agents/skills/      # npx-installed skills
ls ~/.claude/skills/      # git-cloned skills
claude mcp list           # MCP servers
```

You should see all of the above. If any are missing, re-run `setup.sh` or
install manually (see [BLUEPRINT-BUILD.md](BLUEPRINT-BUILD.md) "MCP Tool
Reference" section).

---

## 4. Add Tier 2 MCP servers (optional but recommended)

These aren't installed by `setup.sh` because they need account setup first.
Add them when you reach the relevant phase:

| MCP | Phase | Setup |
|---|---|---|
| Supabase | 6 | https://supabase.com/docs/guides/getting-started/mcp |
| Vercel | 12 | https://vercel.com/docs/mcp/vercel-mcp |
| Resend | 12 | https://resend.com/mcp |
| Sentry | 11–14 | https://docs.sentry.io/ai/mcp/ |
| PostHog | 13 | https://posthog.com/docs/model-context-protocol |
| Notion | all | https://developers.notion.com/docs/mcp |
| Stitch | 8 | already connected via claude.ai |
| Browserbase | 1, 11 | https://www.browserbase.com/docs/mcp |
| Canva | 7, 12, 13 | already connected via claude.ai |
| Figma | 7, 8 | already connected via claude.ai |

---

## 5. Create accounts + collect API keys

Make accounts with these. You'll paste keys into Claude during Phase 0.

### Required for every project

| Service | Why | Free tier? | URL |
|---|---|---|---|
| **Supabase** | DB + Auth + Storage | Yes (500 MB) | https://supabase.com |
| **Razorpay** | India payments | Yes (no setup fee) | https://razorpay.com |
| **Vercel** | Hosting | Yes (Hobby) | https://vercel.com |
| **Resend** | Email | Yes (100/day) | https://resend.com |
| **PostHog** | Analytics | Yes (1M events/mo) | https://posthog.com |
| **Sentry** | Error tracking | Yes (5K errors/mo) | https://sentry.io |
| **Inngest** | Background jobs | Yes (50K runs/mo) | https://inngest.com |

### Optional / when needed

| Service | When | URL |
|---|---|---|
| **Paddle** | Global payments via Merchant of Record | https://paddle.com |
| **Cloudflare** | DNS + CDN | https://dash.cloudflare.com |
| **OpenAI / Anthropic** | If product has AI features | console.anthropic.com |
| **Stripe** | Only if you have a US entity | https://stripe.com |
| **BetterStack** | Uptime monitoring | https://betterstack.com |
| **Upstash** | Redis caching | https://upstash.com |
| **Sanity** | CMS for blog/docs | https://sanity.io |

### India entity (start in parallel — doesn't block build)

| Step | Where | Cost |
|---|---|---|
| Pvt Ltd registration | Razorpay Rize / Vakilsearch / ClearTax | ₹7-15K |
| PAN + TAN | Same | included |
| GST registration | gst.gov.in | free |
| IEC (Import Export Code) | dgft.gov.in | free |
| LUT (Form GST RFD-11) | gst.gov.in | free |
| DPIIT recognition | startupindia.gov.in | free |
| Current account + EEFC | HDFC / ICICI / Razorpay X | free |
| CA engagement | local | ₹50K-2L setup |

See [BLUEPRINT-BUILD.md](BLUEPRINT-BUILD.md) "Phase 3.5" for the full India
compliance walkthrough.

---

## 6. Fill in `.env.example`

```bash
cp .env.example ~/credentials.env
# Edit ~/credentials.env with your keys
chmod 600 ~/credentials.env
```

Keep this file outside any project directory you ship publicly. When Claude
asks for credentials in Phase 0, paste from this file.

> Never commit credentials. `.env.local`, `.env`, and `.env.*` are in the
> default Next.js `.gitignore`. Double-check before pushing.

---

## 7. (Recommended) Domain registration

Pick a domain before you start a project — Phase 7 checks domain availability
when generating product names.

Registrars:
- **Namecheap** — cheap, simple
- **Cloudflare Registrar** — at-cost pricing, no markup
- **Porkbun** — competitive prices, free WHOIS privacy

---

## 8. Verify the full setup

```bash
# Claude Code installed
claude --version

# MCP servers responding
claude mcp list

# Skills available
ls ~/.agents/skills/ ~/.claude/skills/

# Git working
git --version

# Node version >= 18
node --version
```

If everything passes, you're ready. Start a new project and paste the trigger
prompt from [README.md](README.md#3-build-something).

---

## Troubleshooting

### `npx skills` fails

Check that you have npm 10+ and run `npm install -g npm@latest` first. If
specific skills fail, run `bash fix-skills.sh`.

### MCP server won't connect

```bash
claude mcp remove <name>
claude mcp add <name> -- <command>
claude mcp list
```

If it still fails, the MCP server might be down. Check the GitHub issues for
that server. Most have fallbacks documented in `BLUEPRINT-BUILD.md` "Error
Recovery".

### Claude can't read `BLUEPRINT.md`

The path in your trigger prompt must be absolute and correct:

```
Read /full/absolute/path/to/one-shot/BLUEPRINT.md
```

Or use `~/projects/one-shot/BLUEPRINT.md` if you cloned to the recommended path.

### "Skill not found" during build

Claude's blueprint tries to use ~30 skills. If one is missing, it falls back
automatically (see "Error Recovery" in `BLUEPRINT-BUILD.md`). Most missing
skills won't break the build.

### Razorpay account not approved yet

Razorpay test mode works without KYC. Use test keys for Phase 9 scaffold.
You'll need live keys before going to production.

---

## Next Steps

You're set up. Now:

1. Read [README.md](README.md) for the quick start
2. Read [EXAMPLE.md](EXAMPLE.md) for a full walkthrough
3. Start a new project and paste the trigger prompt

Welcome to one-shotting.
