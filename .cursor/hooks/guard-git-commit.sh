#!/usr/bin/env bash
# Cursor hook (beforeShellExecution): en cada git commit
# - Bloquea --author de identidades de IA
# - Permite el resto; .githooks limpia Co-authored-by de IA del mensaje
set -euo pipefail

input="$(cat)"

command=$(printf '%s' "$input" | python3 -c 'import json,sys
try:
  d=json.load(sys.stdin)
  print(d.get("command") or "")
except Exception:
  print("")
')

if [[ -z "$command" ]]; then
  echo '{ "permission": "allow" }'
  exit 0
fi

if ! printf '%s' "$command" | grep -qiE '(^|[;&|]|&&|\|\|)[[:space:]]*git[[:space:]]+commit\b'; then
  echo '{ "permission": "allow" }'
  exit 0
fi

if printf '%s' "$command" | grep -qiE -- '--author[= ].*(Cursor|Copilot|ChatGPT|OpenAI|Claude|Anthropic|Gemini|Composer|Grok)'; then
  cat <<'EOF'
{
  "permission": "deny",
  "user_message": "Commit bloqueado: no uses --author de IA. El autor debe ser Ismael Zambrano / el equipo.",
  "agent_message": "No uses --author con identidad de IA. Usa la identidad Git del usuario."
}
EOF
  exit 0
fi

echo '{ "permission": "allow" }'
exit 0
