#!/usr/bin/env bash
# Cursor hook: permite git commit; la limpieza de Co-authored-by la hacen .githooks
set -euo pipefail
cat >/dev/null
echo '{ "permission": "allow" }'
exit 0
