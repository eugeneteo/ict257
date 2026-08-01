#!/usr/bin/env bash
# Shared guard used by the pre-commit and pre-push hooks.
#
# check_paths <label> <file-with-NUL-or-newline-separated-paths>
#   Fails if any path matches a pattern in excluded-paths.
# check_sizes <blob-list>
#   Fails if any blob exceeds MAX_BYTES.

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
check_message() {
    local file="${1:-}" body offenders
    [[ -n "$file" && -f "$file" ]] || return 0
    body="$(grep -Ev '^\s*#' "$file")"
    offenders="$(printf '%s\n' "$body" \
        | grep -oE '\.?(private|my-notes)/[A-Za-z0-9_.-]+' | sort -u || true)"
    [[ -z "$offenders" ]] && return 0
    echo "BLOCKED: the commit message names a file inside an ignored directory" >&2
    echo >&2
    while IFS= read -r p; do
        [[ -n "$p" ]] && echo "    $p" >&2
    done <<< "$offenders"
    echo >&2
    echo "Commit messages are public. Name the directory if you must, never a" >&2
    echo "file inside it. Say 'my local notes' instead." >&2
    exit 1
}
