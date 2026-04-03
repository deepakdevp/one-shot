# Contributing to Product Blueprint

Thanks for wanting to improve this. Here's how to contribute effectively.

## What We Need

### High Priority
- **Product type adaptations** — Add pipeline adaptations for product types not yet covered (Shopify apps, WordPress plugins, Slack apps, Discord bots, etc.)
- **Country compliance** — Add compliance requirements for countries not in the blueprint (South Korea, Mexico, Egypt, Nigeria, etc.)
- **Payment gateways** — Add integration patterns for regional payment methods (PhonePe, Cashfree, CCAvenue, GoPay, GCash, PIX, etc.)
- **Bug reports** — Ran the blueprint and Claude got stuck? File an issue with the phase, error, and what you expected.

### Medium Priority
- **Skill recommendations** — Found a skill that's better than what's listed? Open a PR with the skill name, install command, and which phase it improves.
- **MCP server additions** — New MCP servers that would improve the pipeline.
- **Tech stack alternatives** — Better tool for a specific use case? Make the case.

### Always Welcome
- **Success stories** — Built a product with this blueprint? Share it in Discussions.
- **Typo fixes** — Just open a PR.
- **Clarity improvements** — If a phase's instructions confused Claude, rewrite them to be clearer.

## How to Contribute

### For small changes (typos, clarifications)
1. Fork the repo
2. Edit the file
3. Open a PR with a clear title

### For new features (product types, countries, skills)
1. Fork the repo
2. Create a branch: `git checkout -b add-shopify-app-type`
3. Make your changes to `BLUEPRINT.md`
4. Test by running the relevant phase with Claude Code
5. Open a PR with:
   - What you added
   - How you tested it
   - Which phase(s) it affects

### For bug reports
Open an issue with:
- Which phase failed
- The error or unexpected behavior
- What product type you were building
- Your environment (OS, Claude Code version)

## Guidelines

### For BLUEPRINT.md changes
- Keep instructions in code blocks with `INSTRUCTIONS FOR CLAUDE:` format
- Every tool/skill mentioned must have an install command in `setup.sh`
- Maintain the phase numbering (don't renumber existing phases)
- Add to the Compact Execution Checklist at the top if adding a new phase
- Test your changes by actually running the phase with Claude Code

### For setup.sh changes
- Use `-y -g` flags for non-interactive installation
- Add `2>/dev/null || echo "already exists, skipping"` for git clones
- Group by: MCP servers, official vendor skills, community skills

### Code of Conduct
Be respectful, constructive, and specific. "This doesn't work" is not helpful. "Phase 10 fails when building a CLI tool because it tries to generate Stitch screens" is helpful.

## Questions?

Open a Discussion thread. Don't use Issues for questions.
