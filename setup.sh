#!/bin/bash
# SaaS One-Shot Pipeline Setup v2 — Run once globally
# Fixed repo URLs (2026-03-29)

echo "=== Installing Tier 1 MCP Servers ==="
claude mcp add playwright -- npx @playwright/mcp@latest
claude mcp add github-mcp-server -- npx github-mcp-server
claude mcp add cloudflare -- npx @anthropic-ai/mcp-remote https://mcp.cloudflare.com/sse

echo ""
echo "=== Installing Skills (Official Vendor) ==="

# Next.js skills (Vercel Labs — 3 skills)
npx skills add vercel-labs/next-skills --all -y -g

# React best practices (Vercel Labs)
npx skills add vercel-labs/agent-skills --skill react-best-practices -y -g

# Stripe payment best practices
npx skills add stripe/ai --skill stripe-best-practices -y -g

# Better Auth (auth setup, 2FA, orgs, providers)
npx skills add better-auth/skills --all -y -g

# Supabase PostgreSQL best practices
npx skills add supabase/agent-skills --all -y -g

# Web quality: Lighthouse, Core Web Vitals, SEO, a11y (Addy Osmani — 6 skills)
npx skills add addyosmani/web-quality-skills --all -y -g

# Cloudflare Workers, KV, R2, web-perf
npx skills add cloudflare/skills --skill wrangler -y -g
npx skills add cloudflare/skills --skill web-perf -y -g
npx skills add cloudflare/skills --skill workers-best-practices -y -g

echo ""
echo "=== Installing Skills (Community — High Value) ==="
git clone https://github.com/huifer/claude-code-seo.git ~/.claude/skills/claude-seo-assistant 2>/dev/null || echo "claude-seo-assistant already exists, skipping"
git clone https://github.com/snapsynapse/skill-a11y-audit.git ~/.claude/skills/skill-a11y-audit 2>/dev/null || echo "skill-a11y-audit already exists, skipping"
git clone https://github.com/framix-team/skill-email-html-mjml.git ~/.claude/skills/skill-email-html-mjml 2>/dev/null || echo "skill-email-html-mjml already exists, skipping"
git clone https://github.com/OpenAEC-Foundation/Docker-Claude-Skill-Package.git ~/.claude/skills/docker 2>/dev/null || echo "docker skills already exists, skipping"
git clone https://github.com/Schoepplake/framer-motion-skill.git ~/.claude/skills/framer-motion 2>/dev/null || echo "framer-motion already exists, skipping"
git clone https://github.com/wsimmonds/claude-nextjs-skills.git ~/.claude/skills/nextjs-skills 2>/dev/null || echo "nextjs-skills already exists, skipping"

echo ""
echo "=== Verifying Installation ==="
echo "--- npx skills (in ~/.agents/skills/) ---"
ls ~/.agents/skills/ 2>/dev/null | sort
echo ""
echo "--- git clone skills (in ~/.claude/skills/) ---"
for d in claude-seo-assistant skill-a11y-audit skill-email-html-mjml docker framer-motion nextjs-skills; do
  [ -d ~/.claude/skills/$d ] && echo "✅ $d" || echo "❌ $d"
done

echo ""
echo "=== Setup Complete ==="
echo ""
echo "Next steps:"
echo "  1. Create accounts and get API keys for:"
echo "     - Supabase:  supabase.com"
echo "     - Razorpay:  razorpay.com"
echo "     - Paddle:    paddle.com"
echo "     - Vercel:    vercel.com"
echo "     - Resend:    resend.com"
echo "     - PostHog:   posthog.com"
echo "     - Sentry:    sentry.io"
echo "     - Inngest:   inngest.com"
echo ""
echo "  2. To start a new SaaS project:"
echo "     mkdir ~/projects/my-saas && cd ~/projects/my-saas"
echo "     claude --dangerously-skip-permissions"
echo '     Paste: "Read ~/docs/SAAS-ONE-SHOT-PLAN.md and execute it for this idea: [YOUR IDEA]"'
