#!/usr/bin/env bash
# Shared guard used by the pre-commit and pre-push hooks.
#
# check_paths <label> <file-with-NUL-or-newline-separated-paths>
#   Fails if any path matches a pattern in excluded-paths.
# check_sizes <blob-list>
#   Fails if any blob exceeds MAX_BYTES.
# check_message <file>
#   Fails if the message in <file> names a file inside an ignored directory.
# check_message_text <context> <text>
#   The same test against a string, used by the pre-push hook.

set -uo pipefail

HOOKDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PATTERN_FILE="$HOOKDIR/excluded-paths"
ALLOW_FILE="$HOOKDIR/allowed-paths"
MAX_BYTES=$((5 * 1024 * 1024))

patterns() {
    grep -Ev '^\s*(#|$)' "$PATTERN_FILE"
}

allowances() {
    [[ -f "$ALLOW_FILE" ]] || return 0
    grep -Ev '^\s*(#|$)' "$ALLOW_FILE"
}

# Echoes any path matching an excluded pattern. Reads paths on stdin.
#
# An allowance is a narrow exception carved out of a broad block, so one named
# directory can hold what is refused everywhere else. It is applied after the
# block, so a path has to be excluded and then allowed to get through.
match_excluded() {
    local pats allow
    pats="$(patterns)"
    [[ -z "$pats" ]] && return 0
    allow="$(allowances)"
    if [[ -z "$allow" ]]; then
        grep -E -f <(printf '%s\n' "$pats") || true
    else
        grep -E -f <(printf '%s\n' "$pats") \
            | { grep -E -v -f <(printf '%s\n' "$allow") || true; }
    fi
}

fail_paths() {
    local context="$1" offenders="$2"
    echo "BLOCKED: $context" >&2
    echo >&2
    while IFS= read -r p; do
        [[ -n "$p" ]] && echo "    $p" >&2
    done <<< "$offenders"
    echo >&2
    echo "These paths are excluded from this repository." >&2
    exit 1
}

fail_size() {
    local offenders="$1"
    echo "BLOCKED: file larger than $((MAX_BYTES / 1024 / 1024)) MB" >&2
    echo >&2
    while IFS= read -r line; do
        [[ -n "$line" ]] && echo "    $line" >&2
    done <<< "$offenders"
    echo >&2
    echo "Large files bloat history permanently. Keep them out, or use Git LFS." >&2
    exit 1
}

# A commit message is as public as the tree. Naming a file inside an ignored
# directory tells the world what is kept in there, even though the file itself
# never lands. Only the directory name may appear, because .gitignore carries
# it anyway and it says nothing about the contents.
#
# The directory names come from excluded-paths, which is the single source of
# truth for the path guard. Add a fourth ignored directory there one day and
# this check covers it without anyone remembering to edit two files. Only the
# anchored directory rules are used. The file extension rules are not
# directories and must not become message patterns.
ignored_dirs() {
    patterns() { grep -Ev '^\s*(#|$)' "$PATTERN_FILE"; }
    patterns | grep -E '^\^.*/$' | sed -E 's|^\^||; s|/$||'
}

message_offenders() {
    local dirs pattern
    dirs="$(ignored_dirs | paste -sd '|' -)"
    [[ -z "$dirs" ]] && return 0
    pattern="(${dirs})/[A-Za-z0-9_.-]+"
    grep -oE "$pattern" | sort -u || true
}

# Refuses text naming a file inside an ignored directory. Used by pre-push,
# where the message is read from a commit rather than from a file.
check_message_text() {
    local context="$1" text="$2" offenders
    offenders="$(printf '%s\n' "$text" | grep -Ev '^\s*#' | message_offenders)"
    [[ -z "$offenders" ]] && return 0
    echo "BLOCKED: $context names a file inside an ignored directory" >&2
    echo >&2
    while IFS= read -r p; do
        [[ -n "$p" ]] && echo "    $p" >&2
    done <<< "$offenders"
    echo >&2
    echo "Commit messages are public. Name the directory if you must, never a" >&2
    echo "file inside it. Say 'my local notes' instead." >&2
    exit 1
}

check_message() {
    local file="${1:-}"
    [[ -n "$file" && -f "$file" ]] || return 0
    check_message_text "the commit message" "$(cat "$file")"
}
