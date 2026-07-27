#!/bin/bash
# kb-layout.sh — Keyboard layout indicator for quickshell bar
# Outputs current keyboard layout as a short code.

short_name() {
  case "$1" in
    French*) echo "FR" ;;
    Arabic*) echo "AR" ;;
    English*) echo "EN" ;;
    German*) echo "DE" ;;
    Spanish*) echo "ES" ;;
    *) echo "${1:0:2}" ;;
  esac
}

LAYOUT=$(hyprctl devices -j 2>/dev/null | python3 -c "
import json,sys
d=json.load(sys.stdin)
for k in d.get('keyboards',[]):
  if 'at-translated' in k.get('name',''):
    print(k.get('active_keymap','')); break
" 2>/dev/null || true)

short_name "${LAYOUT:-unknown}"
