#!/usr/bin/env bash
# verify-lab.sh — quick health checks for the Linux for Beginners capstone
# Run on the lab machine: bash scripts/verify-lab.sh
set -euo pipefail

pass=0
fail=0

check() {
  local name="$1"
  shift
  if "$@"; then
    echo "[PASS] $name"
    pass=$((pass + 1))
  else
    echo "[FAIL] $name"
    fail=$((fail + 1))
  fi
}

echo "Linux for Beginners — lab verification"
echo "======================================"

check "OS release readable" test -r /etc/os-release
check "User is not root (prefer sudo user)" bash -c '[[ "$(id -u)" -ne 0 ]]'
check "sudo available" bash -c 'command -v sudo >/dev/null'
check "apt available" bash -c 'command -v apt >/dev/null'

if command -v systemctl >/dev/null 2>&1; then
  if systemctl is-active --quiet ssh 2>/dev/null || systemctl is-active --quiet sshd 2>/dev/null; then
    echo "[PASS] SSH service active"
    pass=$((pass + 1))
  else
    echo "[FAIL] SSH service active"
    fail=$((fail + 1))
  fi
else
  echo "[SKIP] systemctl not available"
fi

if command -v swapon >/dev/null 2>&1; then
  if swapon --show | grep -q .; then
    echo "[PASS] Swap configured"
    pass=$((pass + 1))
  else
    echo "[FAIL] Swap configured"
    fail=$((fail + 1))
  fi
fi

if command -v ufw >/dev/null 2>&1; then
  if sudo ufw status 2>/dev/null | grep -qi "Status: active"; then
    echo "[PASS] UFW active"
    pass=$((pass + 1))
  else
    echo "[FAIL] UFW active"
    fail=$((fail + 1))
  fi
else
  echo "[SKIP] ufw not installed"
fi

if command -v htop >/dev/null 2>&1; then
  echo "[PASS] htop installed"
  pass=$((pass + 1))
else
  echo "[FAIL] htop installed"
  fail=$((fail + 1))
fi

if [[ -f "$HOME/SERVER_NOTES.md" ]]; then
  echo "[PASS] ~/SERVER_NOTES.md exists"
  pass=$((pass + 1))
else
  echo "[FAIL] ~/SERVER_NOTES.md exists"
  fail=$((fail + 1))
fi

echo "======================================"
echo "Passed: $pass  Failed: $fail"
if [[ "$fail" -gt 0 ]]; then
  exit 1
fi
