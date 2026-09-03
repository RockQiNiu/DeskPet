import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    id: root; width: 360; height: 400; color: "transparent"; visible: applicationController.petVisible
    property bool developerPanelVisible: false
    property bool reviewRunning: false
    property int reviewIndex: 0
    property var reviewItems: ["idle", "walk", "run", "jump", "sit", "wave", "sleep", "celebrate", "angry", "happy", "crash"]
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
            // Mage2D frames are authored facing right. Left movement mirrors
            // the same PNG sequence; vertical-only movement preserves facing.
            const dx = x - root.x
            if (Math.abs(dx) > 16) {
                pet.facingRight = dx >= 0
            }
            pet.dialogueRunning = true
            dialogueRunTimer.restart()
            root.x = x
            root.y = y
        }
    }
    Timer {
        id: dialogueRunTimer
        interval: 2900
        repeat: false
        onTriggered: pet.dialogueRunning = false
    }
    Timer {
        id: reviewTimer
        repeat: false
        onTriggered: {
            if (!root.reviewRunning)
                return
            if (root.reviewIndex >= root.reviewItems.length) {
                root.reviewRunning = false
                return
            }
            const eventName = root.reviewItems[root.reviewIndex]
            applicationController.pet.trigger(eventName)
            root.reviewIndex += 1
            // Looping animations are reviewed for two seconds; one-shot clips
            // run once, then leave a short inspection pause before the next.
            const oneShot = eventName === "jump" || eventName === "wave" || eventName === "celebrate" || eventName === "crash"
            interval = oneShot ? 1800 : 2500
            start()
        }
    }
    Connections {
        target: spriteController
        function onAnimationFinished(animation) {
            applicationController.pet.completeAnimation(animation)
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
    Rectangle { visible: root.developerPanelVisible; x: 12; y: 12; width: 336; height: 376; radius: 10; color: "#ee20252f"; border.color: "#7090b0"
        Column { anchors.fill: parent; anchors.margins: 10; spacing: 5
            Text { text: "Developer Panel (F12)"; color: "white" }
            Text { text: "PetState: " + applicationController.pet.state + "\nAnimation: " + spriteController.currentAnimation + "\nFrame: " + spriteController.currentFrame + " / " + spriteController.frameCount + "\nFPS: " + spriteController.fps + "   Loop: " + spriteController.loop + "\nBuild failures: " + applicationController.pet.buildFailureCount; color: "#b8c7d9" }
            Text { text: "2D Sprite Animation Test"; color: "#f5c86e" }
            Grid { columns: 4; spacing: 4
                Repeater { model: [ ["Idle", "idle"], ["Walk", "walk"], ["Run", "run"], ["Jump", "jump"], ["Sit", "sit"], ["Wave", "wave"], ["Sleep", "sleep"], ["Celebrate", "commit"], ["Dead", "crash"], ["Angry", "failed"], ["Happy", "success"] ]
                    delegate: Button { required property var modelData; text: modelData[0]; onClicked: applicationController.pet.trigger(modelData[1]) }
                }
            }
            Button { text: root.reviewRunning ? "Stop Animation Review" : "Start Animation Review"; onClicked: { root.reviewRunning = !root.reviewRunning; if (root.reviewRunning) { root.reviewIndex = 0; reviewTimer.start() } else reviewTimer.stop() } }
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
