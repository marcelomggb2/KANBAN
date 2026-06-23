#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

# This repository currently ships prebuilt bundles that contain many literal
# URLs and placeholder tokens. To keep the scan actionable, we ignore generated
# assets and scan contributor-facing files (docs, scripts, manifests, workflows).
PATTERN='(token=[A-Za-z0-9]{16,}|api[_-]?key|client_secret|x-api-key|authorization:[[:space:]]*bearer[[:space:]]+[A-Za-z0-9._-]{16,}|BEGIN[[:space:]]+RSA[[:space:]]+PRIVATE[[:space:]]+KEY|BEGIN[[:space:]]+PRIVATE[[:space:]]+KEY)'

issues=0

while IFS= read -r file; do
  case "$file" in
    scripts/scan-secrets.sh)
      continue
      ;;
    *.bundle.js|*.wasm|*.png|*.svg|*.backup|dist/*|pkg/*|icons/*|_locales/*)
      continue
      ;;
  esac

  if grep -n -I -E "$PATTERN" "$file"; then
    issues=1
  fi
done < <(git ls-files)

if [[ "$issues" -eq 1 ]]; then
  echo ""
  echo "[ERROR] Potential secrets found in contributor-facing files."
  exit 1
fi

echo "[OK] No high-confidence secret patterns found in contributor-facing files."
