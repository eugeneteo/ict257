---
name: rhel10-docs
description: "Search official Red Hat documentation for Red Hat Enterprise Linux 10 (RHEL 10), answering with exact citations from docs.redhat.com. Use when the prompt involves triggers such as \"check Red Hat docs\", \"RHEL 10 docs\", \"what do Red Hat docs say\", \"look up RHEL documentation\", \"is X supported in RHEL 10\", \"what replaced X in RHEL 10\", \"docs.redhat.com\", \"official guidance on RHEL\"."
---

# RHEL 10 documentation search

Answer questions about Red Hat Enterprise Linux 10 using only official Red
Hat documentation, with a citation for every claim.

## Scope

- Search **only** `https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/10/`.
- RHEL 8 and RHEL 9 documentation is out of scope. If a user asks about those
  versions, say so and answer from the RHEL 10 page only.
- Never answer from generic Linux knowledge (Debian, Ubuntu, Arch wikis) when
  a Red Hat page can answer it.

## How to search

1. Use the host's web search and page-fetch tools against `docs.redhat.com`.
2. Red Hat pages are large. Never paste a full page into your answer —
   locate the relevant section (by its heading anchor) and quote only that.
3. Prefer the specific guide's page (for example, "Configuring and managing
   networking") over search-result summaries.

## Answering rules

- **Cite everything.** Every factual claim, package name, parameter, path,
  or limit carries an inline markdown link to the exact doc page or anchor.
- **Quote syntax verbatim.** Commands, config keys, and file paths (for
  example `/etc/dnf/dnf.conf`, `systemctl`, `nft`) must match the docs
  character-for-character.
- **Preview is not GA.** If a feature is marked Technology Preview or
  Developer Preview, label it as preview in the answer.
- **Silence is "not documented".** If the RHEL 10 documentation does not
  cover a feature or command, say it is not documented. Do not guess.

## Sample prompts

1. "Check Red Hat docs — what replaced iptables in RHEL 10?"
2. "How does DNF change package management in RHEL 10?"
3. "Per Red Hat docs, how do I run rootless Podman containers on RHEL 10?"
4. "Is the `tuned` profile `network-latency` still available in RHEL 10?"
