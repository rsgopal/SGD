# Spec-Guided Development (SGD)

A growing collection of skills for teams who want to think before they build.

The core idea: before writing code, understand the problem clearly and capture intent in a spec. Then build against that spec. Then verify the result against the original intent — not just "does it run" but "does it do what we meant."

Each skill is a standalone tool. Use one, use several, or use them as inspiration for your own.

---

## Using the skills

### Claude Code (install script)

Run the installer — it registers the plugin and sets everything up in one step:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/rsgopal/SGD/main/install-claude.sh)
```

Then invoke any skill with `/skill-name` in Claude Code. To uninstall:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/rsgopal/SGD/main/uninstall-claude.sh)
```

### Claude Code (manual, project-scoped)

Copy a skill's `SKILL.md` from this repo into your project's `.claude/skills/` folder:

```bash
# example: installing sgd:triage into your project
mkdir -p your-project/.claude/skills/sgd-triage
curl -fsSL https://raw.githubusercontent.com/rsgopal/SGD/main/skills/sgd-triage/SKILL.md \
  -o your-project/.claude/skills/sgd-triage/SKILL.md
```

The skill will be available only within that project.

### Copilot, Cursor, Codex, and other agents

Each skill includes a `prompt.md` — the same instructions without any Claude-specific syntax. Paste it into your tool's custom instructions, system prompt, or chat window.

---

## Skills

| Skill | What it does |
|---|---|
| [`sgd:triage`](skills/sgd-triage/) | Classify a problem using the Cynefin framework before committing to an approach |

---

## Contributing

This repo grows one skill at a time. If you build something useful on top of these ideas, open a PR or file an issue.
