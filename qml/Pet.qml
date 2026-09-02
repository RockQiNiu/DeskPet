import QtQuick
import QtQuick3D
import "assets/tiger/generated3d" as TigerModel

Item {
    id: root
    property string stateName: "Idle"
    property bool dialogueRunning: false
    property bool walking: dialogueRunning || stateName === "Walking" || stateName === "Running" || stateName === "ChasingMouse" || stateName === "AvoidingMouse"
    property bool celebrating: stateName === "Celebrating"
    property bool smoking: stateName === "Smoking"
    property bool sleeping: stateName === "Sleeping"
    property bool dead: stateName === "Dead"
    property bool jumping: stateName === "Jumping"
    property bool perching: stateName === "Perching"
    property bool tailWag: false
    property bool facingRight: true
    // Screen-plane heading in degrees: 0=right, 90=down, 180=left, -90=up.
    property real heading: 0
    // This rig's generated Qt 6.9 Timeline player crashes even on its Idle
    // clip on this machine.  An empty name keeps every imported Timeline
    // disabled while leaving the 3D tiger visible and desktop movement intact.
    property string animationName: ""

    View3D {
        anchors.fill: parent
        renderMode: View3D.Overlay
        environment: SceneEnvironment { backgroundMode: SceneEnvironment.Transparent; antialiasingMode: SceneEnvironment.MSAA }
        PerspectiveCamera {
            position: Qt.vector3d(0, 0.65, 3.0)
            clipNear: 0.01
            clipFar: 100.0
        }
        DirectionalLight { eulerRotation.x: -35; eulerRotation.y: -25; brightness: 0.65 }
        PointLight { position: Qt.vector3d(-1.4, 1.6, 2.2); brightness: 4.0; color: "#fff1dc" }

        Node {
            id: cat
            y: root.dead ? -0.35 : (root.sleeping ? -0.16 : 0)
            // The rig's forward axis is -Z. ±90° maps that direction to the desktop X axis.
            eulerRotation.y: root.heading
            eulerRotation.z: root.dead ? 90 : (root.sleeping ? 12 : 0)
            scale: Qt.vector3d(1.35, 1.35, 1.35)
            Behavior on eulerRotation.y {
                NumberAnimation { duration: 600; easing.type: Easing.InOutSine }
            }

            Node {
                id: tigerMotion
                TigerModel.Tiger_rigged {
                    id: tigerAsset
                    activeAnimation: root.animationName
                    fallbackWalkEnabled: root.walking
                    fallbackJumpEnabled: root.jumping
                }
            }

            Model { visible: root.smoking; source: "#Sphere"; scale: Qt.vector3d(0.13, 0.13, 0.13); position: Qt.vector3d(-0.15, 1.2, 0); materials: PrincipledMaterial { baseColor: "#b9c1cb"; opacity: 0.6 } }
            Model { visible: root.smoking; source: "#Sphere"; scale: Qt.vector3d(0.19, 0.19, 0.19); position: Qt.vector3d(0.13, 1.45, 0); materials: PrincipledMaterial { baseColor: "#d4d9df"; opacity: 0.42 } }
            Model { visible: root.celebrating; source: "#Cube"; scale: Qt.vector3d(0.07, 0.18, 0.04); position: Qt.vector3d(-1.0, 0.9, 0); eulerRotation.z: 35; materials: PrincipledMaterial { baseColor: "#ffdc4e"; emissiveFactor: Qt.vector3d(0.4,0.3,0) } }
            Model { visible: root.celebrating; source: "#Cube"; scale: Qt.vector3d(0.07, 0.18, 0.04); position: Qt.vector3d(1.0, 0.7, 0); eulerRotation.z: -30; materials: PrincipledMaterial { baseColor: "#7ad7ff"; emissiveFactor: Qt.vector3d(0,0.2,0.4) } }
        }

    }

    // A 2D overlay deliberately keeps smoke visible regardless of the imported
    // glTF model's camera framing. It rises from the tiger's head and fades out.
    Item {
        id: smokeOverlay
        anchors.fill: parent
        visible: root.smoking
        z: 10
        Repeater {
            model: 5
            delegate: Item {
                id: puff
                property real baseX: 112 + (index % 3) * 22
                width: 46 + (index % 2) * 12
                height: width
                x: baseX
                y: 66 + (index % 2) * 15
                opacity: 0
                Rectangle {
                    anchors.centerIn: parent
                    width: parent.width
                    height: parent.height
                    radius: width / 2
                    color: index % 2 ? "#9ba6b2" : "#c4ccd4"
                    opacity: 0.78
                    border.width: 1
                    border.color: "#e2e7eb"
                }
                SequentialAnimation on opacity {
                    running: root.smoking
                    loops: Animation.Infinite
                    PauseAnimation { duration: index * 330 }
                    NumberAnimation { to: 0.78; duration: 300 }
                    PauseAnimation { duration: 300 }
                    NumberAnimation { to: 0; duration: 620 }
                }
                SequentialAnimation on y {
                    running: root.smoking
                    loops: Animation.Infinite
                    PauseAnimation { duration: index * 330 }
                    NumberAnimation { to: 8 + index * 4; duration: 1220; easing.type: Easing.OutQuad }
                    PropertyAction { value: 66 + (index % 2) * 15 }
                }
                SequentialAnimation on x {
                    running: root.smoking
                    loops: Animation.Infinite
                    PauseAnimation { duration: index * 330 }
                    NumberAnimation { to: baseX + (index % 2 ? 18 : -16); duration: 640; easing.type: Easing.InOutSine }
                    NumberAnimation { to: baseX; duration: 580; easing.type: Easing.InOutSine }
                }
            }
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            y: 8
            text: "🔥"
            font.pixelSize: 28
            opacity: 0.92
        }

        // Move the outer model node, not an internal imported node. This makes
        // the lift visible regardless of the rig's local coordinate origin.
        SequentialAnimation {
            running: root.jumping
            loops: 1
            NumberAnimation { target: cat; property: "y"; to: 0.62; duration: 280; easing.type: Easing.OutQuad }
            NumberAnimation { target: cat; property: "y"; to: 0; duration: 440; easing.type: Easing.InQuad }
        }
    }

}
