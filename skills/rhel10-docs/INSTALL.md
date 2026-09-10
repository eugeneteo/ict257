# Installing the rhel10-docs skill

The repository ships an assistant skill, `skills/rhel10-docs/`, that makes
your coding agent answer RHEL 10 questions from official Red Hat
documentation only, with a citation on every claim. The skill is one
prompt-only `SKILL.md`, so the same file works in every tool; only the
install location differs.

First, get the repo:

```sh
git clone https://github.com/eugeneteo/ict257.git
cd ict257
```

## Why the install methods differ

Tools that support the [Agent Skills](https://agentskills.io) format
(`SKILL.md` folders) read the skill from a skills directory, so a **symlink**
into this checkout is enough — and a later `git pull` here updates the skill
everywhere at once. A plain copy (`cp -r`) also works but will not track
updates; use it if you plan to delete this checkout after installing.

- **Claude Code** — skills directory `~/.claude/skills/` (or per-project
  `.claude/skills/`).
- **Antigravity (agy)** — skills directory `~/.gemini/config/skills/`.
- **GitHub Copilot** — skills directory `.github/skills/` inside each
  repository (repo-level is the reliable location; support across Copilot
  CLI, code review, the cloud agent, and VS Code agent mode since
  December 2025).

Codex CLI has **no skills directory**; it reads instructions from
`AGENTS.md`, so there the skill is loaded by pointing an `AGENTS.md` entry
at the `SKILL.md` file path.

---

## Claude Code

```sh
mkdir -p ~/.claude/skills
ln -s "$(pwd)/skills/rhel10-docs" ~/.claude/skills/rhel10-docs
```

Restart Claude Code (or start a new session) and verify with the `/skills`
command — `rhel10-docs` should be listed.

Copy instead of symlink, or install for one project only, if you prefer:

```sh
cp -r skills/rhel10-docs ~/.claude/skills/        # snapshot copy
cp -r skills/rhel10-docs <your-project>/.claude/skills/   # per-project
```

---

## Antigravity (agy)

```sh
mkdir -p ~/.gemini/config/skills
ln -s "$(pwd)/skills/rhel10-docs" ~/.gemini/config/skills/rhel10-docs
```

Restart agy and confirm the skill appears in its skill list (or invoke it
with a sample prompt below).

---

## GitHub Copilot

Copilot loads skills from `.github/skills/` in each repository. Symlink
this checkout into every project where you want the skill:

```sh
cd <your-project>
mkdir -p .github/skills
ln -s /absolute/path/to/ict257/skills/rhel10-docs .github/skills/rhel10-docs
```

Committing the symlink to the project repo means the rule applies for every
collaborator automatically — use this for group work. If a collaborator's
checkout has the symlink pointing at a path that does not exist on their
machine, they should re-create it with the command above using their own
clone path, or copy the folder instead:

```sh
cp -r /absolute/path/to/ict257/skills/rhel10-docs .github/skills/rhel10-docs
```

VS Code and GitHub Copilot CLI both honor `.github/skills/`.

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

## Renaming the skill

You can rename the skill to whatever you like — for example `redhat-docs`
or `my-rhel10`. Rename **both** the directory and the `name:` line at
the top of `SKILL.md`, and keep the two identical:

```sh
mv ~/.claude/skills/rhel10-docs ~/.claude/skills/redhat-docs
```

```yaml
---
name: redhat-docs
---
```

Notes by install type:

- **Claude Code / Antigravity / Copilot**: the skill is invoked and listed
  by the `name:` field, so that is the line that matters. Rename the
  symlink (not this checkout's directory), and keep the symlink name
  matching the `name:` line.
- **Codex**: you point at the file, so change the heading in your
  `AGENTS.md` block, and the path if you moved the file. Nothing inside
  `SKILL.md` needs to change for Codex, but renaming both anyway keeps
  the skill consistent wherever you install it.

Avoid spaces and uppercase in the name; letters, digits, and hyphens are
safe everywhere.

---

## Verify the install

In any tool, ask:

> Check Red Hat docs — what replaced iptables in RHEL 10?

A correct install produces an answer that (a) names the RHEL 10
replacement, and (b) includes a link to the exact docs.redhat.com page.
If the tool answers from general knowledge with no citation, the skill
is not loaded — recheck the paths above.
