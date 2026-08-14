import QtQuick
import Quickshell
import Quickshell.Io
import qs.Commons
import qs.Ui

BarWidget {
  id: root
  moduleName: "azzen.agent-active"

  property bool agentActive: false
  property string activeAgents: ""

  function updateState(output) {
    var names = String(output || "").trim().split(/\s+/).filter(Boolean)
    root.agentActive = names.length > 0
    root.activeAgents = names.join(", ")
  }

  visible: agentActive
  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  Process {
    id: watchProc
    running: true
    command: ["bash", Quickshell.env("HOME") + "/.config/omarchy/plugins/azzen.agent-active/agent-watch.sh"]
    stdout: SplitParser {
      onRead: (data) => root.updateState(data)
    }
  }

  BarIconButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: "\uf06a9"
    slotSize: Style.bar.statusSlot
    fontSize: Style.font.caption
    tooltipText: root.agentActive
      ? "Agent active: " + root.activeAgents
      : "No agent running"
    onPressed: {}
  }
}
