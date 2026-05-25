#!/usr/bin/env bash
# Lightweight on-save touch for SKILL.md files.
# Surfaces a one-line health summary so the user knows when to re-run /skill-health-lens.
# Never blocks the edit — exit 0 even on errors.

set -eu

file="${CURSOR_HOOK_FILE_PATH:-}"
[ -z "$file" ] && exit 0
[ ! -f "$file" ] && exit 0

bytes=$(wc -c <"$file" | tr -d ' ')
# Rough tokens = bytes/4
tokens=$(( bytes / 4 ))

if   [ "$tokens" -gt 5000 ]; then status="🔴 ${tokens} tokens — split recommended"
elif [ "$tokens" -gt 2000 ]; then status="🟡 ${tokens} tokens — watch budget"
else                              status="🟢 ${tokens} tokens"
fi

printf '[skill-health-lens] %s — %s\n' "$(basename "$(dirname "$file")")" "$status" >&2
exit 0
