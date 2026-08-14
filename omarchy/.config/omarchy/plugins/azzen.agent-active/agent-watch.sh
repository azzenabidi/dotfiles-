#!/bin/bash
# Streams the currently running AI agents, one line per change.
#   - new agents:  caught by a 0.4s poll
#   - exited agents: caught instantly by a per-PID watcher subshell
# Prints a space-separated agent list, or an empty line when none run.
# Watcher subshells also track MAINPID so they never outlive the main
# loop (killed together with the widget's Process on shell reload).
AGENTS="opencode claude codex gemini copilot crush grok omp pi"
MAINPID=$$
prev=""

report() {
  local names='' p
  for p in $AGENTS; do
    pgrep -x "$p" >/dev/null 2>&1 && names="$names $p"
  done
  echo "${names# }"
}

emit() {
  local cur
  cur="$(report)"
  if [[ "$cur" != "$prev" ]]; then
    prev="$cur"
    echo "$cur"
  fi
}

rm -f /tmp/agent-active.*
trap 'rm -f /tmp/agent-active.$$.*' EXIT
emit
while true; do
  for p in $AGENTS; do
    for pid in $(pgrep -x "$p" 2>/dev/null); do
      guard="/tmp/agent-active.$$.$pid"
      if [[ ! -e "$guard" ]]; then
        touch "$guard"
        ( while kill -0 "$MAINPID" 2>/dev/null && kill -0 "$pid" 2>/dev/null; do sleep 0.05; done
          rm -f "$guard"
          if ! kill -0 "$MAINPID" 2>/dev/null; then exit 0; fi
          report
        ) &
      fi
    done
  done
  emit
  sleep 0.4
done
