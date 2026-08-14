import QtQuick
import Quickshell
import Quickshell.Io
import qs.Commons
import qs.Ui

BarWidget {
  id: root
  moduleName: "azzen.agent-active"

  readonly property string agents: "opencode claude codex gemini copilot crush grok omp pi"
  property bool agentActive: false
  property string activeAgents: ""

  function updateState(output) {
    var names = String(output || "").trim().split(/\s+/).filter(Boolean)
    root.agentActive = names.length > 0
    root.activeAgents = names.join(", ")
  }

  function refresh() {
    if (!detectProc.running) detectProc.running = true
  }

  visible: agentActive
  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  Process {
    id: detectProc
    command: ["sh", "-c", "for p in opencode claude codex gemini copilot crush grok omp pi; do pgrep -x \"$p\" >/dev/null 2>&1 && printf '%s ' \"$p\"; done"]
    stdout: StdioCollector {
      waitForEnd: true
      onStreamFinished: root.updateState(text)
    }
  }

  Timer {
    interval: 3000
    running: true
    repeat: true
    triggeredOnStart: true
    onTriggered: root.refresh()
  }

  BarIconButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: "\uf120"
    slotSize: Style.bar.statusSlot
    fontSize: Style.font.caption
    tooltipText: root.agentActive
      ? "Agent active: " + root.activeAgents
      : "No agent running"
    onPressed: {}
  }
}
