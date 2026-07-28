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
MAX_BYTES=$((5 * 1024 * 1024))

patterns() {
    grep -Ev '^\s*(#|$)' "$PATTERN_FILE"
}

# Echoes any path matching an excluded pattern. Reads paths on stdin.
match_excluded() {
    local pats
    pats="$(patterns)"
    [[ -z "$pats" ]] && return 0
    grep -E -f <(printf '%s\n' "$pats") || true
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
