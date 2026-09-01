import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    id: root; width: 360; height: 330; color: "transparent"; visible: applicationController.petVisible
    property bool developerPanelVisible: false
    Item { id: keyHandler; anchors.fill: parent; focus: true
        Keys.onPressed: function(event) { if (event.key === Qt.Key_F12) { root.developerPanelVisible = !root.developerPanelVisible; event.accepted = true } }
    }
    flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint | Qt.Tool
    Behavior on x { NumberAnimation { duration: 2800; easing.type: Easing.InOutSine } }
    Behavior on y { NumberAnimation { duration: 2800; easing.type: Easing.InOutSine } }
    Pet { id: pet; x: 45; y: 55; width: 270; height: 270; stateName: applicationController.pet.state }
    SpeechBubble {
        id: speech
        anchors.horizontalCenter: parent.horizontalCenter
        // The 3D tiger's head renders in the lower part of Pet's viewport.
        anchors.bottom: pet.bottom
        anchors.bottomMargin: 110
        message: applicationController.pet.dialogue
        visible: showing
    }
    Component.onCompleted: applicationController.updatePetPosition(root.x, root.y)
    onXChanged: applicationController.updatePetPosition(x, y)
    onYChanged: applicationController.updatePetPosition(x, y)
    Connections {
        target: applicationController
        function onMovementTargetChanged(x, y) {
            if (Math.abs(x - root.x) > 8)
                pet.facingRight = x > root.x
            root.x = x
            root.y = y
        }
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
