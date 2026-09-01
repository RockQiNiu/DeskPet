import QtQuick

Item {
    id: bubble
    property string message: ""
    property int duration: 4500
    property bool showing: message.length > 0
    width: Math.min(270, Math.max(150, label.implicitWidth + 34))
    height: label.implicitHeight + 30
    onMessageChanged: { showing = message.length > 0; if (showing) hideTimer.restart() }
    Rectangle {
        anchors.fill: parent; anchors.bottomMargin: 8; radius: 18
        color: "#f8fffafc"; border.width: 2; border.color: "#b9c8d8"
        Text { id: label; anchors.centerIn: parent; width: parent.width - 28; text: bubble.message; color: "#263746"; font.pixelSize: 14; wrapMode: Text.WordWrap; horizontalAlignment: Text.AlignHCenter }
    }
    Rectangle { width: 16; height: 16; rotation: 45; anchors.horizontalCenter: parent.horizontalCenter; anchors.bottom: parent.bottom; anchors.bottomMargin: 2; color: "#f8fffafc"; border.color: "#b9c8d8"; border.width: 2 }
    Timer { id: hideTimer; interval: bubble.duration; onTriggered: bubble.showing = false }
}
