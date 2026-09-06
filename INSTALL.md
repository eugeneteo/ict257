# Installing the rhel10-docs skill

The repository ships an assistant skill, `skills/rhel10-docs/`, that makes
your coding agent answer RHEL 10 questions from official Red Hat
documentation only, with a citation on every claim. It is one directory
holding a single `SKILL.md`, so the same file works in every tool; only the
install location differs.

First, get the repo:

```sh
git clone https://github.com/eugeneteo/ict257.git
cd ict257
```

---

## Claude Code

Copy the skill into your personal skills directory:

```sh
mkdir -p ~/.claude/skills
cp -r skills/rhel10-docs ~/.claude/skills/
```

Then restart Claude Code (or start a new session) and verify with the
`/skills` command — `rhel10-docs` should be listed.

Project-level alternative: copy into `<your-project>/.claude/skills/`
instead of `~/.claude/skills/` if you want the skill only in one project.

---

## Antigravity (agy)

Antigravity reads agent skills from `~/.gemini/config/skills/`. A symlink
works, so you can point at this checkout and `git pull` to update:

```sh
mkdir -p ~/.gemini/config/skills
ln -s "$(pwd)/skills/rhel10-docs" ~/.gemini/config/skills/rhel10-docs
```

Restart agy and confirm the skill appears in its skill list (or invoke it
with a sample prompt below).

---

## Codex

Codex CLI does not use a skills directory; it reads instructions from
`AGENTS.md`. Two options:

**Option A — per-project (recommended for coursework).** In each project
where you want the skill, add a line to the project's `AGENTS.md`:

```markdown
## RHEL 10 documentation search
When I ask about RHEL 10, Red Hat docs, or docs.redhat.com, follow the
rules in <ABSOLUTE_PATH_TO_ict257>/skills/rhel10-docs/SKILL.md:
search only docs.redhat.com RHEL 10 documentation and cite every claim.
```

**Option B — global.** Append the same block to `~/.codex/AGENTS.md` so
it applies in every Codex session.

---

## GitHub Copilot

Copilot reads custom instructions from `.github/copilot-instructions.md`
in the repository. For each project, create or extend that file:

```markdown
## RHEL 10 documentation search
When I ask about RHEL 10, Red Hat docs, or docs.redhat.com, follow the
rules in <ABSOLUTE_PATH_TO_ict257>/skills/rhel10-docs/SKILL.md:
search only docs.redhat.com RHEL 10 documentation and cite every claim.
```

Committing `.github/copilot-instructions.md` to the project repo means
the rule applies for every collaborator automatically — use this for
group work. VS Code and GitHub Copilot CLI both honor this file.

---

## Verify the install

In any tool, ask:

> Check Red Hat docs — what replaced iptables in RHEL 10?

A correct install produces an answer that (a) names the RHEL 10
replacement, and (b) includes a link to the exact docs.redhat.com page.
If the tool answers from general knowledge with no citation, the skill
is not loaded — recheck the paths above.
