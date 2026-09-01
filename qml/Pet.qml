import QtQuick
import QtQuick3D
import "assets/tiger/generated3d" as TigerModel

Item {
    id: root
    property string stateName: "Idle"
    property bool walking: stateName === "Walking" || stateName === "Running" || stateName === "ChasingMouse" || stateName === "AvoidingMouse"
    property bool celebrating: stateName === "Celebrating"
    property bool smoking: stateName === "Smoking"
    property bool sleeping: stateName === "Sleeping"
    property bool dead: stateName === "Dead"
    property bool jumping: stateName === "Jumping"
    property bool facingRight: true
    property string animationName: {
        if (dead) return "Dead"
        if (sleeping) return "Sleep"
        if (celebrating) return "Celebrate"
        if (jumping) return "Jump"
        if (walking) return "Walk"
        if (stateName === "Working") return "Idle"
        if (stateName === "Angry") return "Idle"
        return "Idle"
    }

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
            eulerRotation.y: root.facingRight ? -90 : 90
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
                }
            }

            Model { visible: root.smoking; source: "#Sphere"; scale: Qt.vector3d(0.13, 0.13, 0.13); position: Qt.vector3d(-0.15, 1.2, 0); materials: PrincipledMaterial { baseColor: "#b9c1cb"; opacity: 0.6 } }
            Model { visible: root.smoking; source: "#Sphere"; scale: Qt.vector3d(0.19, 0.19, 0.19); position: Qt.vector3d(0.13, 1.45, 0); materials: PrincipledMaterial { baseColor: "#d4d9df"; opacity: 0.42 } }
            Model { visible: root.celebrating; source: "#Cube"; scale: Qt.vector3d(0.07, 0.18, 0.04); position: Qt.vector3d(-1.0, 0.9, 0); eulerRotation.z: 35; materials: PrincipledMaterial { baseColor: "#ffdc4e"; emissiveFactor: Qt.vector3d(0.4,0.3,0) } }
            Model { visible: root.celebrating; source: "#Cube"; scale: Qt.vector3d(0.07, 0.18, 0.04); position: Qt.vector3d(1.0, 0.7, 0); eulerRotation.z: -30; materials: PrincipledMaterial { baseColor: "#7ad7ff"; emissiveFactor: Qt.vector3d(0,0.2,0.4) } }
        }

        SequentialAnimation { running: root.jumping; loops: Animation.Infinite
            NumberAnimation { target: cat; property: "y"; to: 0.48; duration: 280; easing.type: Easing.OutQuad }
            NumberAnimation { target: cat; property: "y"; to: 0; duration: 320; easing.type: Easing.InQuad }
        }
        SequentialAnimation { running: root.walking; loops: Animation.Infinite
            ParallelAnimation {
                NumberAnimation { target: tigerMotion; property: "y"; to: 0.10; duration: 210; easing.type: Easing.OutQuad }
                NumberAnimation { target: tigerMotion; property: "eulerRotation.z"; to: -4; duration: 210; easing.type: Easing.OutQuad }
            }
            ParallelAnimation {
                NumberAnimation { target: tigerMotion; property: "y"; to: 0; duration: 210; easing.type: Easing.InQuad }
                NumberAnimation { target: tigerMotion; property: "eulerRotation.z"; to: 4; duration: 210; easing.type: Easing.InQuad }
            }
        }
    }

}
