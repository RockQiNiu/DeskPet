import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    id: root; width: 360; height: 400; color: "transparent"; visible: applicationController.petVisible
    property bool developerPanelVisible: false
    property int movementDuration: applicationController.pet.state === "ChasingMouse" ? 1100 : 2800
    Item { id: keyHandler; anchors.fill: parent; focus: true
        Keys.onPressed: function(event) { if (event.key === Qt.Key_F12) { root.developerPanelVisible = !root.developerPanelVisible; event.accepted = true } }
    }
    flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint | Qt.Tool
    Behavior on x { NumberAnimation { duration: root.movementDuration; easing.type: Easing.InOutSine } }
    Behavior on y { NumberAnimation { duration: root.movementDuration; easing.type: Easing.InOutSine } }
    Pet { id: pet; x: 45; y: 115; width: 270; height: 270; stateName: applicationController.pet.state }
    SpeechBubble {
        id: speech
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: pet.top
        anchors.bottomMargin: 4
        message: applicationController.pet.dialogue
        visible: showing
    }
    Component.onCompleted: applicationController.updatePetPosition(root.x, root.y)
    onXChanged: applicationController.updatePetPosition(x, y)
    onYChanged: applicationController.updatePetPosition(x, y)
    Connections {
        target: applicationController
        function onMovementTargetChanged(x, y) {
            // Turn along the actual 2D desktop movement vector. This covers
            // left/right, up/down, and diagonal mouse following.
            const dx = x - root.x
            const dy = y - root.y
            if (Math.abs(dx) + Math.abs(dy) > 16) {
                pet.heading = Math.atan2(dy, dx) * 180 / Math.PI
                pet.facingRight = dx >= 0
            }
            pet.dialogueRunning = true
            dialogueRunTimer.restart()
            root.x = x
            root.y = y
        }
        function onPerchWindowMoved() {
            pet.tailWag = true
        }
    }
    Timer {
        id: dialogueRunTimer
        interval: 2900
        repeat: false
        onTriggered: pet.dialogueRunning = false
    }
    MouseArea { anchors.fill: parent; acceptedButtons: Qt.LeftButton
        property real pressX
        property real pressY
        onPressed: function(mouse) { pressX = mouse.x; pressY = mouse.y; applicationController.petClicked() }
        onPositionChanged: function(mouse) {
            if (pressed) { root.x += mouse.x - pressX; root.y += mouse.y - pressY }
        }
    }
    Rectangle { visible: root.developerPanelVisible; x: 185; y: -40; width: 230; height: 300; radius: 10; color: "#ee20252f"; border.color: "#7090b0"
        Column { anchors.fill: parent; anchors.margins: 10; spacing: 5
            Text { text: "Developer Panel (F12)"; color: "white" }
            Text { text: "State: " + applicationController.pet.state + "\nBuild failures: " + applicationController.pet.buildFailureCount; color: "#b8c7d9" }
            Button { text: "UserCoding"; onClicked: applicationController.pet.trigger("coding") }
            Button { text: "BuildFailed x1"; onClicked: applicationController.pet.trigger("failed") }
            Button { text: "BuildFailed x17"; onClicked: applicationController.pet.triggerBuildFailures(17) }
            Button { text: "BuildSuccess"; onClicked: applicationController.pet.trigger("success") }
            Button { text: "CPU High (70%)"; onClicked: applicationController.pet.trigger("cpu") }
            Button { text: "Late Night"; onClicked: applicationController.pet.trigger("sleep") }
            Button { text: "Git Commit"; onClicked: applicationController.pet.trigger("commit") }
            Button { text: "Program Crash"; onClicked: applicationController.pet.trigger("crash") }
            Button { text: "Reset Counter"; onClicked: applicationController.pet.resetBuildFailures() }
        }
    }
}
