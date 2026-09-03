import QtQuick

Item {
    id: root
    property string stateName: "Idle"
    property bool dialogueRunning: false
    property bool facingRight: true
    property bool smoking: stateName === "Smoking"
    property bool jumping: stateName === "Jumping"

    function refreshAnimation() {
        spriteController.setPetState(stateName)
    }
    onStateNameChanged: refreshAnimation()
    onDialogueRunningChanged: refreshAnimation()
    Component.onCompleted: refreshAnimation()

    // Foot anchor: bottom-centre. All Mage2D assets share a 512x512 canvas.
    Image {
        id: sprite
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        width: parent.width
        height: parent.height
        source: spriteController.frameSource
        fillMode: Image.PreserveAspectFit
        smooth: true
        cache: true
        // `Item.scale = -1` mirrors both axes and clips a bottom-anchored
        // sprite vertically. Use an explicit X-only transform for leftward
        // movement so the feet always remain on the same baseline.
        transform: Scale {
            origin.x: sprite.width / 2
            origin.y: sprite.height
            xScale: root.facingRight ? 1 : -1
            yScale: 1
        }
    }

    SequentialAnimation on y {
        running: root.jumping
        loops: 1
        NumberAnimation { to: -48; duration: 250; easing.type: Easing.OutQuad }
        NumberAnimation { to: 0; duration: 400; easing.type: Easing.InQuad }
    }

    // State-independent CPU-high overlay effect.
    Item {
        visible: root.smoking
        anchors.fill: parent
        Repeater {
            model: 4
            delegate: Rectangle {
                width: 28 + index * 4; height: width; radius: width / 2
                x: 110 + index * 12; y: 50 + index * 8
                color: "#bac4cf"; opacity: 0
                SequentialAnimation on opacity {
                    running: root.smoking; loops: Animation.Infinite
                    PauseAnimation { duration: index * 180 }
                    NumberAnimation { to: 0.78; duration: 250 }
                    NumberAnimation { to: 0; duration: 650 }
                }
                SequentialAnimation on y {
                    running: root.smoking; loops: Animation.Infinite
                    PauseAnimation { duration: index * 180 }
                    NumberAnimation { to: 4; duration: 900; easing.type: Easing.OutQuad }
                    PropertyAction { value: 50 + index * 8 }
                }
            }
        }
    }
}
