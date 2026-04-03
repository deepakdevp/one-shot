#!/bin/bash
# Fix the 8 skills that failed — correct repo URLs

echo "=== Installing Next.js Skills (vercel-labs/next-skills) ==="
npx skills add vercel-labs/next-skills --all -y -g

echo ""
echo "=== Installing React Best Practices (vercel-labs/agent-skills) ==="
npx skills add vercel-labs/agent-skills --skill react-best-practices -y -g

echo ""
echo "=== Installing Better Auth Skills (better-auth/skills) ==="
npx skills add better-auth/skills --all -y -g

echo ""
echo "=== Installing Supabase Postgres Skills (supabase/agent-skills) ==="
npx skills add supabase/agent-skills --all -y -g

echo ""
echo "=== Installing Cloudflare Skills (cloudflare/skills) ==="
npx skills add cloudflare/skills --skill wrangler -y -g
npx skills add cloudflare/skills --skill web-perf -y -g
npx skills add cloudflare/skills --skill workers-best-practices -y -g

echo ""
echo "=== Done! Verifying all skills ==="
echo "--- npx skills ---"
ls ~/.agents/skills/ 2>/dev/null | sort
echo ""
echo "--- git clone skills ---"
for d in claude-seo-assistant skill-a11y-audit skill-email-html-mjml docker framer-motion nextjs-skills; do
  [ -d ~/.claude/skills/$d ] && echo "✅ $d" || echo "❌ $d"
done
