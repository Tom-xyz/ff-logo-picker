#!/usr/bin/env bash
# Smoke test for fflogo. Covers the cheap, TTY-free paths.
set -euo pipefail

ROOT=$(cd "$(dirname "$0")/.." && pwd)
FFLOGO="$ROOT/bin/fflogo"

[[ -x "$FFLOGO" ]] || { echo "FAIL: $FFLOGO not executable"; exit 1; }

# --help should print USAGE and exit 0
"$FFLOGO" --help | grep -q "USAGE" || { echo "FAIL: --help missing USAGE"; exit 1; }

# --version should print 'fflogo <semver>'
"$FFLOGO" --version | grep -qE "^fflogo [0-9]" || { echo "FAIL: --version output"; exit 1; }

# Unknown flag should error and exit non-zero
if "$FFLOGO" --bogus 2>/dev/null; then
  echo "FAIL: --bogus should fail"; exit 1
fi

echo "OK: --help, --version, error-on-bogus"
