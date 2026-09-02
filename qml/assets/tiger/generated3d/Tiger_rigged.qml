import QtQuick
import QtQuick3D

import QtQuick.Timeline

Node {
    id: node
    property string activeAnimation: "Idle"
    // Independent of imported glTF timelines. This is used by the desktop pet
    // for a safe procedural gait on Qt Quick 3D 6.9.
    property bool fallbackWalkEnabled: false
    property bool fallbackJumpEnabled: false

    // Resources
    property url textureData: "maps/textureData.jpg"
    property url textureData8: "maps/textureData8.png"
    property url textureData10: "maps/textureData10.jpg"
    Texture {
        id: _0_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData
    }
    Texture {
        id: _1_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData8
    }
    Texture {
        id: _2_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData10
    }
    PrincipledMaterial {
        id: tripo_node_e7126733_eb3e_40c2_a21a_3908cbb51b4e_material_material
        objectName: "tripo_node_e7126733-eb3e-40c2-a21a-3908cbb51b4e_material"
        baseColorMap: _0_texture
        metalnessMap: _1_texture
        roughnessMap: _1_texture
        metalness: 1
        roughness: 1
        normalMap: _2_texture
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    Skin {
        id: skin
        joints: [
            root,
            pelvis,
            leg_back_L,
            leg_back_L_upper,
            leg_back_L_lower,
            leg_back_L_paw,
            leg_back_R,
            leg_back_R_upper,
            leg_back_R_lower,
            leg_back_R_paw,
            spine,
            chest,
            leg_front_L,
            leg_front_L_upper,
            leg_front_L_lower,
            leg_front_L_paw,
            leg_front_R,
            leg_front_R_upper,
            leg_front_R_lower,
            leg_front_R_paw,
            neck,
            head,
            ear_L,
            ear_R,
            tail_01,
            tail_02,
            tail_03
        ]
        inverseBindPoses: [
            Qt.matrix4x4(0, 0, 1, 4.09782e-08, 1, 0, 0, 0.0782904, 0, 1, 0, -0.010497, 0, 0, 0, 1),
            Qt.matrix4x4(0.0160372, -0.125619, 0.991949, 0.0328706, 0.991949, 0.126638, -1.86265e-09, 0.29248, -0.125619, 0.983963, 0.126638, -0.257473, 0, 0, 0, 1),
            Qt.matrix4x4(1, -6.78003e-07, 1.11756e-08, 0.293631, -6.78003e-07, -1, -4.61936e-07, 0.262421, 5.58822e-09, 4.17233e-07, -1, -0.0562761, 0, 0, 0, 1),
            Qt.matrix4x4(0.919091, -0.272696, -0.284446, 0.323996, -0.284446, -0.958692, -2.98023e-08, 0.163027, -0.272696, 0.0809095, -0.958692, -0.154831, 0, 0, 0, 1),
            Qt.matrix4x4(0.752279, 0.431689, 0.497716, 0.213501, 0.497716, -0.86734, 0, 0.286104, 0.431689, 0.247721, -0.86734, 0.0576321, 0, 0, 0, 1),
            Qt.matrix4x4(0.027872, 0.164606, 0.985966, 0.0565088, 0.985965, -0.166949, 9.31323e-08, 0.271955, 0.164606, 0.972128, -0.166949, -0.00335591, 0, 0, 0, 1),
            Qt.matrix4x4(1, -6.78003e-07, 1.11756e-08, 0.293631, -6.78003e-07, -1, -4.61936e-07, 0.262421, 5.58822e-09, 4.17233e-07, -1, 0.0562758, 0, 0, 0, 1),
            Qt.matrix4x4(0.919091, -0.272696, -0.284446, 0.356011, -0.284446, -0.958692, -2.98023e-08, 0.163027, -0.272696, 0.0809095, -0.958692, -0.0469284, 0, 0, 0, 1),
            Qt.matrix4x4(0.752279, 0.431689, 0.497716, 0.157482, 0.497716, -0.86734, 0, 0.286104, 0.431689, 0.247721, -0.86734, 0.155253, 0, 0, 0, 1),
            Qt.matrix4x4(0.027872, 0.164606, 0.985966, -0.0544635, 0.985965, -0.166949, 9.31323e-08, 0.271955, 0.164606, 0.972128, -0.166949, 0.0154345, 0, 0, 0, 1),
            Qt.matrix4x4(0.0220437, -0.146826, 0.988917, 0.0388073, 0.988917, 0.148471, 3.72529e-09, 0.0795173, -0.146826, 0.977956, 0.148471, -0.258482, 0, 0, 0, 1),
            Qt.matrix4x4(0.0125824, -0.111463, 0.993689, 0.0299891, 0.993689, 0.112171, 4.65661e-09, -0.15825, -0.111463, 0.987418, 0.112171, -0.265663, 0, 0, 0, 1),
            Qt.matrix4x4(1, -7.45058e-08, -8.38192e-09, -0.283873, -4.47035e-08, -1, -1.2666e-07, 0.29916, -2.8871e-08, -1.49012e-08, -1, -0.056276, 0, 0, 0, 1),
            Qt.matrix4x4(0.919091, -0.272696, -0.284446, -0.206783, -0.284446, -0.958692, -1.41561e-07, 0.327296, -0.272696, 0.0809094, -0.958692, 0.00265209, 0, 0, 0, 1),
            Qt.matrix4x4(0.752279, 0.431689, 0.497716, -0.220944, 0.497716, -0.867341, -1.04308e-07, -0.00132858, 0.431689, 0.247721, -0.867341, -0.19167, 0, 0, 0, 1),
            Qt.matrix4x4(0.0278721, 0.164606, 0.985966, 0.0404126, 0.985966, -0.166949, -6.70553e-08, -0.297445, 0.164606, 0.972128, -0.166949, -0.0984166, 0, 0, 0, 1),
            Qt.matrix4x4(1, -5.21541e-08, -1.49012e-08, -0.283873, -2.98023e-08, -1, -1.34111e-07, 0.29916, -3.35276e-08, 1.7486e-15, -1, 0.0562759, 0, 0, 0, 1),
            Qt.matrix4x4(0.919091, -0.272696, -0.284446, -0.174768, -0.284446, -0.958692, -1.2666e-07, 0.327296, -0.272696, 0.0809094, -0.958692, 0.110555, 0, 0, 0, 1),
            Qt.matrix4x4(0.752279, 0.431689, 0.497716, -0.276963, 0.497716, -0.867341, -1.63913e-07, -0.00132854, 0.431689, 0.247721, -0.867341, -0.0940493, 0, 0, 0, 1),
            Qt.matrix4x4(0.0278721, 0.164606, 0.985966, -0.0705597, 0.985966, -0.166949, -8.00938e-08, -0.297445, 0.164606, 0.972128, -0.166949, -0.0796262, 0, 0, 0, 1),
            Qt.matrix4x4(0.150737, -0.357793, 0.921555, 0.0616984, 0.921555, 0.388249, -1.49012e-08, -0.406852, -0.357793, 0.849263, 0.388249, -0.146448, 0, 0, 0, 1),
            Qt.matrix4x4(0.00396356, -0.062832, 0.998016, 0.0209694, 0.998016, 0.062957, -2.09548e-08, -0.472179, -0.062832, 0.996036, 0.0629569, -0.332414, 0, 0, 0, 1),
            Qt.matrix4x4(0.704481, -0.435757, 0.560199, -0.153898, 0.560199, 0.826039, -0.0619383, -0.619965, -0.435756, 0.357458, 0.826039, 0.0998078, 0, 0, 0, 1),
            Qt.matrix4x4(0.665455, -0.493301, 0.560199, -0.149659, 0.560199, 0.826039, 0.0619383, -0.619965, -0.493301, 0.272606, 0.826039, 0.106057, 0, 0, 0, 1),
            Qt.matrix4x4(0.00079579, 0.0281985, -0.999602, -0.00669888, -0.999602, 0.0282115, 2.876e-07, -0.329826, 0.0281981, 0.999192, 0.0282062, -0.237368, 0, 0, 0, 1),
            Qt.matrix4x4(0.030956, -0.173197, -0.984399, 0.0593882, -0.9844, -0.175938, 1.06356e-06, -0.456709, -0.173198, 0.969033, -0.175948, -0.332275, 0, 0, 0, 1),
            Qt.matrix4x4(0.0598581, -0.237223, -0.969607, 0.0933043, -0.969609, -0.244652, 1.31874e-06, -0.610407, -0.237222, 0.940131, -0.244665, -0.369771, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Node {
        id: tiger_Armature
        objectName: "Tiger_Armature"
        Model {
            id: tripo_node_e7126733_eb3e_40c2_a21a_3908cbb51b4e
            objectName: "tripo_node_e7126733-eb3e-40c2-a21a-3908cbb51b4e"
            source: "meshes/meshes_0__mesh.mesh"
            skin: skin
            materials: [
                tripo_node_e7126733_eb3e_40c2_a21a_3908cbb51b4e_material_material
            ]
        }
        Node {
            id: root
            objectName: "root"
            position: Qt.vector3d(-0.0782904, 0.010497, -4.09782e-08)
            rotation: Qt.quaternion(-0.5, 0.5, 0.5, 0.5)
            Node {
                id: pelvis
                objectName: "pelvis"
                position: Qt.vector3d(0, -0.244705, 0.209936)
                rotation: Qt.quaternion(0.995975, 0.0633191, 0.0633191, 0.00402552)
                scale: Qt.vector3d(1, 1, 1)
                Node {
                    id: leg_back_L
                    objectName: "leg_back_L"
                    position: Qt.vector3d(-0.0606263, 0.0344454, 0.0304985)
                    rotation: Qt.quaternion(-0.436681, 0.563319, 0.495974, -0.495975)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: leg_back_L_upper
                        objectName: "leg_back_L_upper"
                        position: Qt.vector3d(3.82137e-09, 0.00524838, 1.35172e-09)
                        rotation: Qt.quaternion(0.979346, 0.0206537, -0.142223, 0.142223)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: leg_back_L_lower
                            objectName: "leg_back_L_lower"
                            position: Qt.vector3d(-2.04891e-08, 0.12044, -1.86265e-09)
                            rotation: Qt.quaternion(0.844969, 0.045676, 0.361934, -0.391081)
                            scale: Qt.vector3d(1, 1, 1)
                            Node {
                                id: leg_back_L_paw
                                objectName: "leg_back_L_paw"
                                position: Qt.vector3d(-2.23517e-08, 0.117998, -1.86265e-09)
                                rotation: Qt.quaternion(0.817766, 0.350196, 0.386037, -0.244125)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                        }
                    }
                }
                Node {
                    id: leg_back_R
                    objectName: "leg_back_R"
                    position: Qt.vector3d(0.0510194, 0.0344454, 0.0447518)
                    rotation: Qt.quaternion(-0.436681, 0.563319, 0.495974, -0.495975)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: leg_back_R_upper
                        objectName: "leg_back_R_upper"
                        position: Qt.vector3d(5.0792e-09, 0.00524839, 1.35172e-09)
                        rotation: Qt.quaternion(0.979346, 0.0206537, -0.142223, 0.142223)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: leg_back_R_lower
                            objectName: "leg_back_R_lower"
                            position: Qt.vector3d(-4.47035e-08, 0.12044, -1.86265e-09)
                            rotation: Qt.quaternion(0.844969, 0.045676, 0.361934, -0.391081)
                            scale: Qt.vector3d(1, 1, 1)
                            Node {
                                id: leg_back_R_paw
                                objectName: "leg_back_R_paw"
                                position: Qt.vector3d(-1.67638e-08, 0.117998, -5.58794e-09)
                                rotation: Qt.quaternion(0.817766, 0.350196, 0.386037, -0.244125)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                        }
                    }
                }
                Node {
                    id: spine
                    objectName: "spine"
                    position: Qt.vector3d(2.39177e-09, 0.207221, -3.50406e-08)
                    rotation: Qt.quaternion(0.999879, 0.0109165, 0.0110206, 0.00151613)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: chest
                        objectName: "chest"
                        position: Qt.vector3d(2.33531e-10, 0.247448, 2.18924e-08)
                        rotation: Qt.quaternion(0.999665, -0.01815, -0.0183031, -0.00238609)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: leg_front_L
                            objectName: "leg_front_L"
                            position: Qt.vector3d(-0.0557053, 0.157389, -0.00822186)
                            rotation: Qt.quaternion(-0.443914, 0.556086, 0.496844, -0.496844)
                            Node {
                                id: leg_front_L_upper
                                objectName: "leg_front_L_upper"
                                position: Qt.vector3d(1.11132e-08, 0.0419873, 6.59857e-09)
                                rotation: Qt.quaternion(0.979346, 0.0206539, -0.142223, 0.142223)
                                scale: Qt.vector3d(1, 1, 1)
                                Node {
                                    id: leg_front_L_lower
                                    objectName: "leg_front_L_lower"
                                    position: Qt.vector3d(9.31323e-09, 0.12044, -1.11759e-08)
                                    rotation: Qt.quaternion(0.84497, 0.0456759, 0.361934, -0.391081)
                                    scale: Qt.vector3d(1, 1, 1)
                                    Node {
                                        id: leg_front_L_paw
                                        objectName: "leg_front_L_paw"
                                        position: Qt.vector3d(-1.11759e-08, 0.117998, -1.11759e-08)
                                        rotation: Qt.quaternion(0.817766, 0.350196, 0.386037, -0.244125)
                                        scale: Qt.vector3d(1, 1, 1)
                                    }
                                }
                            }
                        }
                        Node {
                            id: leg_front_R
                            objectName: "leg_front_R"
                            position: Qt.vector3d(0.0561363, 0.157389, 0.00440323)
                            rotation: Qt.quaternion(-0.443914, 0.556086, 0.496844, -0.496844)
                            Node {
                                id: leg_front_R_upper
                                objectName: "leg_front_R_upper"
                                position: Qt.vector3d(1.55512e-08, 0.0419873, -5.79231e-09)
                                rotation: Qt.quaternion(0.979346, 0.0206539, -0.142223, 0.142223)
                                scale: Qt.vector3d(1, 1, 1)
                                Node {
                                    id: leg_front_R_lower
                                    objectName: "leg_front_R_lower"
                                    position: Qt.vector3d(-2.04891e-08, 0.12044, 5.58794e-09)
                                    rotation: Qt.quaternion(0.84497, 0.0456759, 0.361934, -0.391081)
                                    scale: Qt.vector3d(1, 1, 1)
                                    Node {
                                        id: leg_front_R_paw
                                        objectName: "leg_front_R_paw"
                                        position: Qt.vector3d(-1.11759e-08, 0.117998, -2.79397e-09)
                                        rotation: Qt.quaternion(0.817766, 0.350196, 0.386037, -0.244125)
                                        scale: Qt.vector3d(1, 1, 1)
                                    }
                                }
                            }
                        }
                        Node {
                            id: neck
                            objectName: "neck"
                            position: Qt.vector3d(1.23029e-09, 0.187157, -8.26475e-09)
                            rotation: Qt.quaternion(0.979644, 0.138039, 0.141213, 0.0360672)
                            scale: Qt.vector3d(1, 1, 1)
                            Node {
                                id: head
                                objectName: "head"
                                position: Qt.vector3d(9.79533e-10, 0.1487, -1.52819e-08)
                                rotation: Qt.quaternion(0.972085, -0.162646, -0.16473, -0.0382309)
                                scale: Qt.vector3d(1, 1, 1)
                                Node {
                                    id: ear_L
                                    objectName: "ear_L"
                                    position: Qt.vector3d(-0.0373366, 0.0518178, 0.0417931)
                                    rotation: Qt.quaternion(0.811754, 0.368355, 0.382886, 0.242421)
                                    scale: Qt.vector3d(1, 1, 1)
                                }
                                Node {
                                    id: ear_R
                                    objectName: "ear_R"
                                    position: Qt.vector3d(0.0317887, 0.0518178, 0.0461537)
                                    rotation: Qt.quaternion(0.79974, 0.395949, 0.407384, 0.194108)
                                    scale: Qt.vector3d(1, 1, 1)
                                }
                            }
                        }
                    }
                }
                Node {
                    id: tail_01
                    objectName: "tail_01"
                    position: Qt.vector3d(-0.00329649, 0.00332323, 0.0258212)
                    rotation: Qt.quaternion(0.00600893, -0.049215, 0.0772857, 0.995775)
                    scale: Qt.vector3d(1, 1, 1.00001)
                    Node {
                        id: tail_02
                        objectName: "tail_02"
                        position: Qt.vector3d(-2.84025e-10, 0.18605, -1.98084e-08)
                        rotation: Qt.quaternion(0.989523, -0.102076, 0.101822, -0.00760083)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: tail_03
                            objectName: "tail_03"
                            position: Qt.vector3d(-2.63267e-09, 0.17898, 1.49701e-08)
                            rotation: Qt.quaternion(0.998765, -0.0343574, 0.035124, -0.00739552)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                }
            }
        }
    }

    // Animations:
    Timeline {
        id: celebrate_timeline
        objectName: "Celebrate"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 2034
        currentFrame: 0
        enabled: node.activeAnimation === "Celebrate"
        animations: TimelineAnimation { duration: 2034; from: 0; to: 2034; running: celebrate_timeline.enabled; loops: Animation.Infinite }
        KeyframeGroup {
            target: leg_back_L_upper
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-1.89135e-08, 0.00524839, -6.79185e-09)
            }
        }
        KeyframeGroup {
            target: root
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.5, -0.5, -0.5, -0.5)
            }
        }
        KeyframeGroup {
            target: leg_back_L_lower
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-3.74614e-08, 0.12044, -1.48702e-08)
            }
        }
        KeyframeGroup {
            target: pelvis
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.9895e-09, -0.244705, 0.209936)
            }
        }
        KeyframeGroup {
            target: leg_back_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.436681, -0.563319, -0.495974, 0.495975)
            }
        }
        KeyframeGroup {
            target: leg_back_L_paw
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-3.3048e-08, 0.117998, 6.15477e-09)
            }
        }
        KeyframeGroup {
            target: leg_back_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.436681, -0.563319, -0.495974, 0.495975)
            }
        }
        KeyframeGroup {
            target: leg_back_R_upper
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-7.93543e-09, 0.00524839, -4.14274e-09)
            }
        }
        KeyframeGroup {
            target: leg_back_R_lower
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-2.77581e-08, 0.12044, 2.22509e-09)
            }
        }
        KeyframeGroup {
            target: leg_back_R_paw
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.52402e-08, 0.117998, 1.18202e-09)
            }
        }
        KeyframeGroup {
            target: spine
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(6.34628e-09, 0.207221, -3.30063e-08)
            }
        }
        KeyframeGroup {
            target: chest
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-3.35218e-09, 0.247448, 3.92906e-08)
            }
        }
        KeyframeGroup {
            target: leg_front_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.443914, -0.556086, -0.496844, 0.496845)
            }
        }
        KeyframeGroup {
            target: leg_front_L_upper
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(2.08407e-08, 0.0419873, 8.24446e-09)
            }
        }
        KeyframeGroup {
            target: leg_front_L_upper
            property: "rotation"
            keyframeSource: "animations/leg_front_L_upper_rotation_0.qad"
        }
        KeyframeGroup {
            target: leg_front_L_lower
            property: "position"
            keyframeSource: "animations/leg_front_L_lower_position_0.qad"
        }
        KeyframeGroup {
            target: leg_front_L_paw
            property: "position"
            keyframeSource: "animations/leg_front_L_paw_position_0.qad"
        }
        KeyframeGroup {
            target: leg_front_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.443914, -0.556086, -0.496844, 0.496845)
            }
        }
        KeyframeGroup {
            target: leg_front_R_upper
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(2.38999e-08, 0.0419873, -6.31437e-10)
            }
        }
        KeyframeGroup {
            target: leg_front_R_upper
            property: "rotation"
            keyframeSource: "animations/leg_front_R_upper_rotation_0.qad"
        }
        KeyframeGroup {
            target: leg_front_R_lower
            property: "position"
            keyframeSource: "animations/leg_front_R_lower_position_0.qad"
        }
        KeyframeGroup {
            target: leg_front_R_paw
            property: "position"
            keyframeSource: "animations/leg_front_R_paw_position_0.qad"
        }
        KeyframeGroup {
            target: neck
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(3.54413e-09, 0.187157, -1.05915e-08)
            }
        }
        KeyframeGroup {
            target: neck
            property: "rotation"
            keyframeSource: "animations/neck_rotation_0.qad"
        }
        KeyframeGroup {
            target: head
            property: "position"
            keyframeSource: "animations/head_position_0.qad"
        }
        KeyframeGroup {
            target: head
            property: "rotation"
            keyframeSource: "animations/head_rotation_0.qad"
        }
        KeyframeGroup {
            target: tail_01
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-0.00329649, 0.00332327, 0.0258212)
            }
        }
        KeyframeGroup {
            target: tail_01
            property: "rotation"
            keyframeSource: "animations/tail_01_rotation_0.qad"
        }
        KeyframeGroup {
            target: tail_02
            property: "position"
            keyframeSource: "animations/tail_02_position_0.qad"
        }
        KeyframeGroup {
            target: tail_03
            property: "position"
            keyframeSource: "animations/tail_03_position_0.qad"
        }
    }
    Timeline {
        id: dead_timeline
        objectName: "Dead"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 1234
        currentFrame: 0
        enabled: node.activeAnimation === "Dead"
        animations: TimelineAnimation { duration: 1234; from: 0; to: 1234; running: dead_timeline.enabled; loops: 1 }
        KeyframeGroup {
            target: leg_back_L_upper
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-1.89135e-08, 0.00524839, -6.79185e-09)
            }
        }
        KeyframeGroup {
            target: leg_back_L_upper
            property: "rotation"
            keyframeSource: "animations/leg_back_L_upper_rotation_1.qad"
        }
        KeyframeGroup {
            target: root
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.5, -0.5, -0.5, -0.5)
            }
        }
        KeyframeGroup {
            target: leg_back_L_lower
            property: "position"
            keyframeSource: "animations/leg_back_L_lower_position_1.qad"
        }
        KeyframeGroup {
            target: pelvis
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.9895e-09, -0.244705, 0.209936)
            }
        }
        KeyframeGroup {
            target: leg_back_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.436681, -0.563319, -0.495974, 0.495975)
            }
        }
        KeyframeGroup {
            target: leg_back_L_paw
            property: "position"
            keyframeSource: "animations/leg_back_L_paw_position_1.qad"
        }
        KeyframeGroup {
            target: leg_back_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.436681, -0.563319, -0.495974, 0.495975)
            }
        }
        KeyframeGroup {
            target: leg_back_R_upper
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-7.93543e-09, 0.00524839, -4.14274e-09)
            }
        }
        KeyframeGroup {
            target: leg_back_R_upper
            property: "rotation"
            keyframeSource: "animations/leg_back_R_upper_rotation_1.qad"
        }
        KeyframeGroup {
            target: leg_back_R_lower
            property: "position"
            keyframeSource: "animations/leg_back_R_lower_position_1.qad"
        }
        KeyframeGroup {
            target: leg_back_R_paw
            property: "position"
            keyframeSource: "animations/leg_back_R_paw_position_1.qad"
        }
        KeyframeGroup {
            target: spine
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(6.34628e-09, 0.207221, -3.30063e-08)
            }
        }
        KeyframeGroup {
            target: spine
            property: "rotation"
            keyframeSource: "animations/spine_rotation_1.qad"
        }
        KeyframeGroup {
            target: chest
            property: "position"
            keyframeSource: "animations/chest_position_1.qad"
        }
        KeyframeGroup {
            target: chest
            property: "rotation"
            keyframeSource: "animations/chest_rotation_1.qad"
        }
        KeyframeGroup {
            target: leg_front_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.443914, -0.556086, -0.496844, 0.496845)
            }
        }
        KeyframeGroup {
            target: leg_front_L_upper
            property: "position"
            keyframeSource: "animations/leg_front_L_upper_position_1.qad"
        }
        KeyframeGroup {
            target: leg_front_L_upper
            property: "rotation"
            keyframeSource: "animations/leg_front_L_upper_rotation_1.qad"
        }
        KeyframeGroup {
            target: leg_front_L_lower
            property: "position"
            keyframeSource: "animations/leg_front_L_lower_position_1.qad"
        }
        KeyframeGroup {
            target: leg_front_L_paw
            property: "position"
            keyframeSource: "animations/leg_front_L_paw_position_1.qad"
        }
        KeyframeGroup {
            target: leg_front_R
            property: "position"
            keyframeSource: "animations/leg_front_R_position_1.qad"
        }
        KeyframeGroup {
            target: leg_front_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.443914, -0.556086, -0.496844, 0.496845)
            }
        }
        KeyframeGroup {
            target: leg_front_R_upper
            property: "position"
            keyframeSource: "animations/leg_front_R_upper_position_1.qad"
        }
        KeyframeGroup {
            target: leg_front_R_upper
            property: "rotation"
            keyframeSource: "animations/leg_front_R_upper_rotation_1.qad"
        }
        KeyframeGroup {
            target: leg_front_R_lower
            property: "position"
            keyframeSource: "animations/leg_front_R_lower_position_1.qad"
        }
        KeyframeGroup {
            target: leg_front_R_paw
            property: "position"
            keyframeSource: "animations/leg_front_R_paw_position_1.qad"
        }
        KeyframeGroup {
            target: neck
            property: "position"
            keyframeSource: "animations/neck_position_1.qad"
        }
        KeyframeGroup {
            target: neck
            property: "rotation"
            keyframeSource: "animations/neck_rotation_1.qad"
        }
        KeyframeGroup {
            target: head
            property: "position"
            keyframeSource: "animations/head_position_1.qad"
        }
        KeyframeGroup {
            target: head
            property: "rotation"
            keyframeSource: "animations/head_rotation_1.qad"
        }
        KeyframeGroup {
            target: tail_01
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-0.00329649, 0.00332327, 0.0258212)
            }
        }
        KeyframeGroup {
            target: tail_01
            property: "rotation"
            keyframeSource: "animations/tail_01_rotation_1.qad"
        }
        KeyframeGroup {
            target: tail_02
            property: "position"
            keyframeSource: "animations/tail_02_position_1.qad"
        }
        KeyframeGroup {
            target: tail_03
            property: "position"
            keyframeSource: "animations/tail_03_position_1.qad"
        }
    }
    Timeline {
        id: idle_timeline
        objectName: "Idle"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 4034
        currentFrame: 0
        enabled: node.activeAnimation === "Idle"
        animations: TimelineAnimation { duration: 4034; from: 0; to: 4034; running: idle_timeline.enabled; loops: Animation.Infinite }
        KeyframeGroup {
            target: leg_back_L_upper
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-1.89135e-08, 0.00524839, -6.79185e-09)
            }
        }
        KeyframeGroup {
            target: root
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.5, -0.5, -0.5, -0.5)
            }
        }
        KeyframeGroup {
            target: leg_back_L_lower
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-3.74614e-08, 0.12044, -1.48702e-08)
            }
        }
        KeyframeGroup {
            target: pelvis
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.9895e-09, -0.244705, 0.209936)
            }
        }
        KeyframeGroup {
            target: leg_back_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.436681, -0.563319, -0.495974, 0.495975)
            }
        }
        KeyframeGroup {
            target: leg_back_L_paw
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-3.3048e-08, 0.117998, 6.15477e-09)
            }
        }
        KeyframeGroup {
            target: leg_back_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.436681, -0.563319, -0.495974, 0.495975)
            }
        }
        KeyframeGroup {
            target: leg_back_R_upper
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-7.93543e-09, 0.00524839, -4.14274e-09)
            }
        }
        KeyframeGroup {
            target: leg_back_R_lower
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-2.77581e-08, 0.12044, 2.22509e-09)
            }
        }
        KeyframeGroup {
            target: leg_back_R_paw
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.52402e-08, 0.117998, 1.18202e-09)
            }
        }
        KeyframeGroup {
            target: spine
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(6.34628e-09, 0.207221, -3.30063e-08)
            }
        }
        KeyframeGroup {
            target: spine
            property: "rotation"
            keyframeSource: "animations/spine_rotation_2.qad"
        }
        KeyframeGroup {
            target: chest
            property: "position"
            keyframeSource: "animations/chest_position_2.qad"
        }
        KeyframeGroup {
            target: chest
            property: "rotation"
            keyframeSource: "animations/chest_rotation_2.qad"
        }
        KeyframeGroup {
            target: leg_front_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.443914, -0.556086, -0.496844, 0.496845)
            }
        }
        KeyframeGroup {
            target: leg_front_L_upper
            property: "position"
            keyframeSource: "animations/leg_front_L_upper_position_2.qad"
        }
        KeyframeGroup {
            target: leg_front_L_lower
            property: "position"
            keyframeSource: "animations/leg_front_L_lower_position_2.qad"
        }
        KeyframeGroup {
            target: leg_front_L_paw
            property: "position"
            keyframeSource: "animations/leg_front_L_paw_position_2.qad"
        }
        KeyframeGroup {
            target: leg_front_R
            property: "position"
            keyframeSource: "animations/leg_front_R_position_2.qad"
        }
        KeyframeGroup {
            target: leg_front_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.443914, -0.556086, -0.496844, 0.496845)
            }
        }
        KeyframeGroup {
            target: leg_front_R_upper
            property: "position"
            keyframeSource: "animations/leg_front_R_upper_position_2.qad"
        }
        KeyframeGroup {
            target: leg_front_R_lower
            property: "position"
            keyframeSource: "animations/leg_front_R_lower_position_2.qad"
        }
        KeyframeGroup {
            target: leg_front_R_paw
            property: "position"
            keyframeSource: "animations/leg_front_R_paw_position_2.qad"
        }
        KeyframeGroup {
            target: neck
            property: "position"
            keyframeSource: "animations/neck_position_2.qad"
        }
        KeyframeGroup {
            target: neck
            property: "rotation"
            keyframeSource: "animations/neck_rotation_2.qad"
        }
        KeyframeGroup {
            target: head
            property: "position"
            keyframeSource: "animations/head_position_2.qad"
        }
        KeyframeGroup {
            target: head
            property: "rotation"
            keyframeSource: "animations/head_rotation_2.qad"
        }
        KeyframeGroup {
            target: ear_L
            property: "rotation"
            keyframeSource: "animations/ear_L_rotation_2.qad"
        }
        KeyframeGroup {
            target: ear_R
            property: "rotation"
            keyframeSource: "animations/ear_R_rotation_2.qad"
        }
        KeyframeGroup {
            target: tail_01
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-0.00329649, 0.00332327, 0.0258212)
            }
        }
        KeyframeGroup {
            target: tail_01
            property: "rotation"
            keyframeSource: "animations/tail_01_rotation_2.qad"
        }
        KeyframeGroup {
            target: tail_02
            property: "position"
            keyframeSource: "animations/tail_02_position_2.qad"
        }
        KeyframeGroup {
            target: tail_02
            property: "rotation"
            keyframeSource: "animations/tail_02_rotation_2.qad"
        }
        KeyframeGroup {
            target: tail_03
            property: "position"
            keyframeSource: "animations/tail_03_position_2.qad"
        }
    }
    Timeline {
        id: jump_timeline
        objectName: "Jump"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 934
        currentFrame: 0
        enabled: node.activeAnimation === "Jump"
        animations: TimelineAnimation { duration: 934; from: 0; to: 934; running: jump_timeline.enabled; loops: Animation.Infinite }
        KeyframeGroup {
            target: leg_back_L_upper
            property: "position"
            keyframeSource: "animations/leg_back_L_upper_position_3.qad"
        }
        KeyframeGroup {
            target: leg_back_L_upper
            property: "rotation"
            keyframeSource: "animations/leg_back_L_upper_rotation_3.qad"
        }
        KeyframeGroup {
            target: root
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.5, -0.5, -0.5, -0.5)
            }
        }
        KeyframeGroup {
            target: leg_back_L_lower
            property: "position"
            keyframeSource: "animations/leg_back_L_lower_position_3.qad"
        }
        KeyframeGroup {
            target: pelvis
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.9895e-09, -0.244705, 0.209936)
            }
        }
        KeyframeGroup {
            target: pelvis
            property: "rotation"
            keyframeSource: "animations/pelvis_rotation_3.qad"
        }
        KeyframeGroup {
            target: leg_back_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.436681, -0.563319, -0.495974, 0.495975)
            }
        }
        KeyframeGroup {
            target: leg_back_L_paw
            property: "position"
            keyframeSource: "animations/leg_back_L_paw_position_3.qad"
        }
        KeyframeGroup {
            target: leg_back_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.436681, -0.563319, -0.495974, 0.495975)
            }
        }
        KeyframeGroup {
            target: leg_back_R_upper
            property: "position"
            keyframeSource: "animations/leg_back_R_upper_position_3.qad"
        }
        KeyframeGroup {
            target: leg_back_R_upper
            property: "rotation"
            keyframeSource: "animations/leg_back_R_upper_rotation_3.qad"
        }
        KeyframeGroup {
            target: leg_back_R_lower
            property: "position"
            keyframeSource: "animations/leg_back_R_lower_position_3.qad"
        }
        KeyframeGroup {
            target: leg_back_R_paw
            property: "position"
            keyframeSource: "animations/leg_back_R_paw_position_3.qad"
        }
        KeyframeGroup {
            target: spine
            property: "position"
            keyframeSource: "animations/spine_position_3.qad"
        }
        KeyframeGroup {
            target: spine
            property: "rotation"
            keyframeSource: "animations/spine_rotation_3.qad"
        }
        KeyframeGroup {
            target: chest
            property: "position"
            keyframeSource: "animations/chest_position_3.qad"
        }
        KeyframeGroup {
            target: leg_front_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.443914, -0.556086, -0.496844, 0.496845)
            }
        }
        KeyframeGroup {
            target: leg_front_L_upper
            property: "position"
            keyframeSource: "animations/leg_front_L_upper_position_3.qad"
        }
        KeyframeGroup {
            target: leg_front_L_upper
            property: "rotation"
            keyframeSource: "animations/leg_front_L_upper_rotation_3.qad"
        }
        KeyframeGroup {
            target: leg_front_L_lower
            property: "position"
            keyframeSource: "animations/leg_front_L_lower_position_3.qad"
        }
        KeyframeGroup {
            target: leg_front_L_lower
            property: "rotation"
            keyframeSource: "animations/leg_front_L_lower_rotation_3.qad"
        }
        KeyframeGroup {
            target: leg_front_L_paw
            property: "position"
            keyframeSource: "animations/leg_front_L_paw_position_3.qad"
        }
        KeyframeGroup {
            target: leg_front_R
            property: "position"
            keyframeSource: "animations/leg_front_R_position_3.qad"
        }
        KeyframeGroup {
            target: leg_front_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.443914, -0.556086, -0.496844, 0.496845)
            }
        }
        KeyframeGroup {
            target: leg_front_R_upper
            property: "position"
            keyframeSource: "animations/leg_front_R_upper_position_3.qad"
        }
        KeyframeGroup {
            target: leg_front_R_upper
            property: "rotation"
            keyframeSource: "animations/leg_front_R_upper_rotation_3.qad"
        }
        KeyframeGroup {
            target: leg_front_R_lower
            property: "position"
            keyframeSource: "animations/leg_front_R_lower_position_3.qad"
        }
        KeyframeGroup {
            target: leg_front_R_lower
            property: "rotation"
            keyframeSource: "animations/leg_front_R_lower_rotation_3.qad"
        }
        KeyframeGroup {
            target: leg_front_R_paw
            property: "position"
            keyframeSource: "animations/leg_front_R_paw_position_3.qad"
        }
        KeyframeGroup {
            target: neck
            property: "position"
            keyframeSource: "animations/neck_position_3.qad"
        }
        KeyframeGroup {
            target: head
            property: "position"
            keyframeSource: "animations/head_position_3.qad"
        }
        KeyframeGroup {
            target: tail_01
            property: "position"
            keyframeSource: "animations/tail_01_position_3.qad"
        }
        KeyframeGroup {
            target: tail_01
            property: "rotation"
            keyframeSource: "animations/tail_01_rotation_3.qad"
        }
        KeyframeGroup {
            target: tail_02
            property: "position"
            keyframeSource: "animations/tail_02_position_3.qad"
        }
        KeyframeGroup {
            target: tail_03
            property: "position"
            keyframeSource: "animations/tail_03_position_3.qad"
        }
    }
    Timeline {
        id: run_timeline
        objectName: "Run"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 667
        currentFrame: 0
        enabled: node.activeAnimation === "Run"
        animations: TimelineAnimation { duration: 667; from: 0; to: 667; running: run_timeline.enabled; loops: Animation.Infinite }
        KeyframeGroup {
            target: leg_back_L_upper
            property: "position"
            keyframeSource: "animations/leg_back_L_upper_position_4.qad"
        }
        KeyframeGroup {
            target: leg_back_L_upper
            property: "rotation"
            keyframeSource: "animations/leg_back_L_upper_rotation_4.qad"
        }
        KeyframeGroup {
            target: root
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.5, -0.5, -0.5, -0.5)
            }
        }
        KeyframeGroup {
            target: leg_back_L_lower
            property: "position"
            keyframeSource: "animations/leg_back_L_lower_position_4.qad"
        }
        KeyframeGroup {
            target: leg_back_L_lower
            property: "rotation"
            keyframeSource: "animations/leg_back_L_lower_rotation_4.qad"
        }
        KeyframeGroup {
            target: pelvis
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.9895e-09, -0.244705, 0.209936)
            }
        }
        KeyframeGroup {
            target: pelvis
            property: "rotation"
            keyframeSource: "animations/pelvis_rotation_4.qad"
        }
        KeyframeGroup {
            target: leg_back_L
            property: "rotation"
            keyframeSource: "animations/leg_back_L_rotation_4.qad"
        }
        KeyframeGroup {
            target: leg_back_L_paw
            property: "position"
            keyframeSource: "animations/leg_back_L_paw_position_4.qad"
        }
        KeyframeGroup {
            target: leg_back_L_paw
            property: "rotation"
            keyframeSource: "animations/leg_back_L_paw_rotation_4.qad"
        }
        KeyframeGroup {
            target: leg_back_R
            property: "rotation"
            keyframeSource: "animations/leg_back_R_rotation_4.qad"
        }
        KeyframeGroup {
            target: leg_back_R_upper
            property: "position"
            keyframeSource: "animations/leg_back_R_upper_position_4.qad"
        }
        KeyframeGroup {
            target: leg_back_R_upper
            property: "rotation"
            keyframeSource: "animations/leg_back_R_upper_rotation_4.qad"
        }
        KeyframeGroup {
            target: leg_back_R_lower
            property: "position"
            keyframeSource: "animations/leg_back_R_lower_position_4.qad"
        }
        KeyframeGroup {
            target: leg_back_R_lower
            property: "rotation"
            keyframeSource: "animations/leg_back_R_lower_rotation_4.qad"
        }
        KeyframeGroup {
            target: leg_back_R_paw
            property: "position"
            keyframeSource: "animations/leg_back_R_paw_position_4.qad"
        }
        KeyframeGroup {
            target: leg_back_R_paw
            property: "rotation"
            keyframeSource: "animations/leg_back_R_paw_rotation_4.qad"
        }
        KeyframeGroup {
            target: spine
            property: "position"
            keyframeSource: "animations/spine_position_4.qad"
        }
        KeyframeGroup {
            target: spine
            property: "rotation"
            keyframeSource: "animations/spine_rotation_4.qad"
        }
        KeyframeGroup {
            target: chest
            property: "position"
            keyframeSource: "animations/chest_position_4.qad"
        }
        KeyframeGroup {
            target: chest
            property: "rotation"
            keyframeSource: "animations/chest_rotation_4.qad"
        }
        KeyframeGroup {
            target: leg_front_L
            property: "rotation"
            keyframeSource: "animations/leg_front_L_rotation_4.qad"
        }
        KeyframeGroup {
            target: leg_front_L_upper
            property: "position"
            keyframeSource: "animations/leg_front_L_upper_position_4.qad"
        }
        KeyframeGroup {
            target: leg_front_L_upper
            property: "rotation"
            keyframeSource: "animations/leg_front_L_upper_rotation_4.qad"
        }
        KeyframeGroup {
            target: leg_front_L_lower
            property: "position"
            keyframeSource: "animations/leg_front_L_lower_position_4.qad"
        }
        KeyframeGroup {
            target: leg_front_L_lower
            property: "rotation"
            keyframeSource: "animations/leg_front_L_lower_rotation_4.qad"
        }
        KeyframeGroup {
            target: leg_front_L_paw
            property: "position"
            keyframeSource: "animations/leg_front_L_paw_position_4.qad"
        }
        KeyframeGroup {
            target: leg_front_L_paw
            property: "rotation"
            keyframeSource: "animations/leg_front_L_paw_rotation_4.qad"
        }
        KeyframeGroup {
            target: leg_front_R
            property: "position"
            keyframeSource: "animations/leg_front_R_position_4.qad"
        }
        KeyframeGroup {
            target: leg_front_R
            property: "rotation"
            keyframeSource: "animations/leg_front_R_rotation_4.qad"
        }
        KeyframeGroup {
            target: leg_front_R_upper
            property: "position"
            keyframeSource: "animations/leg_front_R_upper_position_4.qad"
        }
        KeyframeGroup {
            target: leg_front_R_upper
            property: "rotation"
            keyframeSource: "animations/leg_front_R_upper_rotation_4.qad"
        }
        KeyframeGroup {
            target: leg_front_R_lower
            property: "position"
            keyframeSource: "animations/leg_front_R_lower_position_4.qad"
        }
        KeyframeGroup {
            target: leg_front_R_lower
            property: "rotation"
            keyframeSource: "animations/leg_front_R_lower_rotation_4.qad"
        }
        KeyframeGroup {
            target: leg_front_R_paw
            property: "position"
            keyframeSource: "animations/leg_front_R_paw_position_4.qad"
        }
        KeyframeGroup {
            target: leg_front_R_paw
            property: "rotation"
            keyframeSource: "animations/leg_front_R_paw_rotation_4.qad"
        }
        KeyframeGroup {
            target: neck
            property: "position"
            keyframeSource: "animations/neck_position_4.qad"
        }
        KeyframeGroup {
            target: head
            property: "position"
            keyframeSource: "animations/head_position_4.qad"
        }
        KeyframeGroup {
            target: tail_01
            property: "position"
            keyframeSource: "animations/tail_01_position_4.qad"
        }
        KeyframeGroup {
            target: tail_01
            property: "rotation"
            keyframeSource: "animations/tail_01_rotation_4.qad"
        }
        KeyframeGroup {
            target: tail_02
            property: "position"
            keyframeSource: "animations/tail_02_position_4.qad"
        }
        KeyframeGroup {
            target: tail_02
            property: "rotation"
            keyframeSource: "animations/tail_02_rotation_4.qad"
        }
        KeyframeGroup {
            target: tail_03
            property: "position"
            keyframeSource: "animations/tail_03_position_4.qad"
        }
        KeyframeGroup {
            target: tail_03
            property: "rotation"
            keyframeSource: "animations/tail_03_rotation_4.qad"
        }
    }
    Timeline {
        id: sleep_timeline
        objectName: "Sleep"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 4034
        currentFrame: 0
        enabled: node.activeAnimation === "Sleep"
        animations: TimelineAnimation { duration: 4034; from: 0; to: 4034; running: sleep_timeline.enabled; loops: Animation.Infinite }
        KeyframeGroup {
            target: leg_back_L_upper
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-1.89135e-08, 0.00524839, -6.79185e-09)
            }
        }
        KeyframeGroup {
            target: root
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.5, -0.5, -0.5, -0.5)
            }
        }
        KeyframeGroup {
            target: leg_back_L_lower
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-3.74614e-08, 0.12044, -1.48702e-08)
            }
        }
        KeyframeGroup {
            target: pelvis
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.9895e-09, -0.244705, 0.209936)
            }
        }
        KeyframeGroup {
            target: leg_back_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.436681, -0.563319, -0.495974, 0.495975)
            }
        }
        KeyframeGroup {
            target: leg_back_L_paw
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-3.3048e-08, 0.117998, 6.15477e-09)
            }
        }
        KeyframeGroup {
            target: leg_back_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.436681, -0.563319, -0.495974, 0.495975)
            }
        }
        KeyframeGroup {
            target: leg_back_R_upper
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-7.93543e-09, 0.00524839, -4.14274e-09)
            }
        }
        KeyframeGroup {
            target: leg_back_R_lower
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-2.77581e-08, 0.12044, 2.22509e-09)
            }
        }
        KeyframeGroup {
            target: leg_back_R_paw
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.52402e-08, 0.117998, 1.18202e-09)
            }
        }
        KeyframeGroup {
            target: spine
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(6.34628e-09, 0.207221, -3.30063e-08)
            }
        }
        KeyframeGroup {
            target: spine
            property: "rotation"
            keyframeSource: "animations/spine_rotation_5.qad"
        }
        KeyframeGroup {
            target: chest
            property: "position"
            keyframeSource: "animations/chest_position_5.qad"
        }
        KeyframeGroup {
            target: leg_front_L
            property: "position"
            keyframeSource: "animations/leg_front_L_position_5.qad"
        }
        KeyframeGroup {
            target: leg_front_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.443914, -0.556086, -0.496844, 0.496845)
            }
        }
        KeyframeGroup {
            target: leg_front_L_upper
            property: "position"
            keyframeSource: "animations/leg_front_L_upper_position_5.qad"
        }
        KeyframeGroup {
            target: leg_front_L_upper
            property: "rotation"
            keyframeSource: "animations/leg_front_L_upper_rotation_5.qad"
        }
        KeyframeGroup {
            target: leg_front_L_lower
            property: "position"
            keyframeSource: "animations/leg_front_L_lower_position_5.qad"
        }
        KeyframeGroup {
            target: leg_front_L_paw
            property: "position"
            keyframeSource: "animations/leg_front_L_paw_position_5.qad"
        }
        KeyframeGroup {
            target: leg_front_R
            property: "position"
            keyframeSource: "animations/leg_front_R_position_5.qad"
        }
        KeyframeGroup {
            target: leg_front_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.443914, -0.556086, -0.496844, 0.496845)
            }
        }
        KeyframeGroup {
            target: leg_front_R_upper
            property: "position"
            keyframeSource: "animations/leg_front_R_upper_position_5.qad"
        }
        KeyframeGroup {
            target: leg_front_R_upper
            property: "rotation"
            keyframeSource: "animations/leg_front_R_upper_rotation_5.qad"
        }
        KeyframeGroup {
            target: leg_front_R_lower
            property: "position"
            keyframeSource: "animations/leg_front_R_lower_position_5.qad"
        }
        KeyframeGroup {
            target: leg_front_R_paw
            property: "position"
            keyframeSource: "animations/leg_front_R_paw_position_5.qad"
        }
        KeyframeGroup {
            target: neck
            property: "position"
            keyframeSource: "animations/neck_position_5.qad"
        }
        KeyframeGroup {
            target: neck
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.989747, 0.141879, -0.0067685, 0.0150339)
            }
        }
        KeyframeGroup {
            target: head
            property: "position"
            keyframeSource: "animations/head_position_5.qad"
        }
        KeyframeGroup {
            target: head
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.928557, -0.166818, -0.331462, -0.00932897)
            }
        }
        KeyframeGroup {
            target: tail_01
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-0.00329649, 0.00332327, 0.0258212)
            }
        }
        KeyframeGroup {
            target: tail_02
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(5.61432e-09, 0.18605, -1.2783e-08)
            }
        }
        KeyframeGroup {
            target: tail_03
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(2.30769e-10, 0.17898, -4.57206e-09)
            }
        }
        KeyframeGroup {
            target: tail_03
            property: "rotation"
            keyframeSource: "animations/tail_03_rotation_5.qad"
        }
    }
    Timeline {
        id: walk_timeline
        objectName: "Walk"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 1034
        currentFrame: 0
        // The glTF keyframe timeline and the fallback gait used to run at the
        // same time and write the same skeleton transforms. Qt 6.9's Quick3D
        // renderer can crash in that situation. The fallback below is the
        // single owner of walking bone transforms.
        enabled: false
        animations: TimelineAnimation {
            id: walkPlayer
            // One gait cycle lasts 1.4 seconds; desktop movement lasts exactly two cycles.
            duration: 1400
            from: 0
            to: 1034
            running: false
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: leg_back_L_upper
            property: "position"
            keyframeSource: "animations/leg_back_L_upper_position_6.qad"
        }
        KeyframeGroup {
            target: leg_back_L_upper
            property: "rotation"
            keyframeSource: "animations/leg_back_L_upper_rotation_6.qad"
        }
        KeyframeGroup {
            target: root
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.5, -0.5, -0.5, -0.5)
            }
        }
        KeyframeGroup {
            target: leg_back_L_lower
            property: "position"
            keyframeSource: "animations/leg_back_L_lower_position_6.qad"
        }
        KeyframeGroup {
            target: leg_back_L_lower
            property: "rotation"
            keyframeSource: "animations/leg_back_L_lower_rotation_6.qad"
        }
        KeyframeGroup {
            target: pelvis
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.9895e-09, -0.244705, 0.209936)
            }
        }
        KeyframeGroup {
            target: pelvis
            property: "rotation"
            keyframeSource: "animations/pelvis_rotation_6.qad"
        }
        KeyframeGroup {
            target: leg_back_L
            property: "rotation"
            keyframeSource: "animations/leg_back_L_rotation_6.qad"
        }
        KeyframeGroup {
            target: leg_back_L_paw
            property: "position"
            keyframeSource: "animations/leg_back_L_paw_position_6.qad"
        }
        KeyframeGroup {
            target: leg_back_L_paw
            property: "rotation"
            keyframeSource: "animations/leg_back_L_paw_rotation_6.qad"
        }
        KeyframeGroup {
            target: leg_back_R
            property: "rotation"
            keyframeSource: "animations/leg_back_R_rotation_6.qad"
        }
        KeyframeGroup {
            target: leg_back_R_upper
            property: "position"
            keyframeSource: "animations/leg_back_R_upper_position_6.qad"
        }
        KeyframeGroup {
            target: leg_back_R_upper
            property: "rotation"
            keyframeSource: "animations/leg_back_R_upper_rotation_6.qad"
        }
        KeyframeGroup {
            target: leg_back_R_lower
            property: "position"
            keyframeSource: "animations/leg_back_R_lower_position_6.qad"
        }
        KeyframeGroup {
            target: leg_back_R_lower
            property: "rotation"
            keyframeSource: "animations/leg_back_R_lower_rotation_6.qad"
        }
        KeyframeGroup {
            target: leg_back_R_paw
            property: "position"
            keyframeSource: "animations/leg_back_R_paw_position_6.qad"
        }
        KeyframeGroup {
            target: leg_back_R_paw
            property: "rotation"
            keyframeSource: "animations/leg_back_R_paw_rotation_6.qad"
        }
        KeyframeGroup {
            target: spine
            property: "position"
            keyframeSource: "animations/spine_position_6.qad"
        }
        KeyframeGroup {
            target: spine
            property: "rotation"
            keyframeSource: "animations/spine_rotation_6.qad"
        }
        KeyframeGroup {
            target: chest
            property: "position"
            keyframeSource: "animations/chest_position_6.qad"
        }
        KeyframeGroup {
            target: chest
            property: "rotation"
            keyframeSource: "animations/chest_rotation_6.qad"
        }
        KeyframeGroup {
            target: leg_front_L
            property: "rotation"
            keyframeSource: "animations/leg_front_L_rotation_6.qad"
        }
        KeyframeGroup {
            target: leg_front_L_upper
            property: "position"
            keyframeSource: "animations/leg_front_L_upper_position_6.qad"
        }
        KeyframeGroup {
            target: leg_front_L_upper
            property: "rotation"
            keyframeSource: "animations/leg_front_L_upper_rotation_6.qad"
        }
        KeyframeGroup {
            target: leg_front_L_lower
            property: "position"
            keyframeSource: "animations/leg_front_L_lower_position_6.qad"
        }
        KeyframeGroup {
            target: leg_front_L_lower
            property: "rotation"
            keyframeSource: "animations/leg_front_L_lower_rotation_6.qad"
        }
        KeyframeGroup {
            target: leg_front_L_paw
            property: "position"
            keyframeSource: "animations/leg_front_L_paw_position_6.qad"
        }
        KeyframeGroup {
            target: leg_front_L_paw
            property: "rotation"
            keyframeSource: "animations/leg_front_L_paw_rotation_6.qad"
        }
        KeyframeGroup {
            target: leg_front_R
            property: "position"
            keyframeSource: "animations/leg_front_R_position_6.qad"
        }
        KeyframeGroup {
            target: leg_front_R
            property: "rotation"
            keyframeSource: "animations/leg_front_R_rotation_6.qad"
        }
        KeyframeGroup {
            target: leg_front_R_upper
            property: "position"
            keyframeSource: "animations/leg_front_R_upper_position_6.qad"
        }
        KeyframeGroup {
            target: leg_front_R_upper
            property: "rotation"
            keyframeSource: "animations/leg_front_R_upper_rotation_6.qad"
        }
        KeyframeGroup {
            target: leg_front_R_lower
            property: "position"
            keyframeSource: "animations/leg_front_R_lower_position_6.qad"
        }
        KeyframeGroup {
            target: leg_front_R_lower
            property: "rotation"
            keyframeSource: "animations/leg_front_R_lower_rotation_6.qad"
        }
        KeyframeGroup {
            target: leg_front_R_paw
            property: "position"
            keyframeSource: "animations/leg_front_R_paw_position_6.qad"
        }
        KeyframeGroup {
            target: leg_front_R_paw
            property: "rotation"
            keyframeSource: "animations/leg_front_R_paw_rotation_6.qad"
        }
        KeyframeGroup {
            target: neck
            property: "position"
            keyframeSource: "animations/neck_position_6.qad"
        }
        KeyframeGroup {
            target: head
            property: "position"
            keyframeSource: "animations/head_position_6.qad"
        }
        KeyframeGroup {
            target: tail_01
            property: "position"
            keyframeSource: "animations/tail_01_position_6.qad"
        }
        KeyframeGroup {
            target: tail_01
            property: "rotation"
            keyframeSource: "animations/tail_01_rotation_6.qad"
        }
        KeyframeGroup {
            target: tail_02
            property: "position"
            keyframeSource: "animations/tail_02_position_6.qad"
        }
        KeyframeGroup {
            target: tail_02
            property: "rotation"
            keyframeSource: "animations/tail_02_rotation_6.qad"
        }
        KeyframeGroup {
            target: tail_03
            property: "position"
            keyframeSource: "animations/tail_03_position_6.qad"
        }
        KeyframeGroup {
            target: tail_03
            property: "rotation"
            keyframeSource: "animations/tail_03_rotation_6.qad"
        }
    }

    // Fallback gait for render backends that do not advance imported Timeline keyframes.
    // This still drives the rig's individual leg and tail bones, never the whole model.
    ParallelAnimation {
        id: fallbackWalkGait
        running: node.fallbackWalkEnabled
        loops: Animation.Infinite

        SequentialAnimation {
            NumberAnimation { target: leg_front_L_upper; property: "eulerRotation.z"; to: 34; duration: 350; easing.type: Easing.InOutSine }
            NumberAnimation { target: leg_front_L_upper; property: "eulerRotation.z"; to: -34; duration: 700; easing.type: Easing.InOutSine }
            NumberAnimation { target: leg_front_L_upper; property: "eulerRotation.z"; to: 34; duration: 350; easing.type: Easing.InOutSine }
        }
        SequentialAnimation {
            NumberAnimation { target: leg_front_R_upper; property: "eulerRotation.z"; to: -34; duration: 350; easing.type: Easing.InOutSine }
            NumberAnimation { target: leg_front_R_upper; property: "eulerRotation.z"; to: 34; duration: 700; easing.type: Easing.InOutSine }
            NumberAnimation { target: leg_front_R_upper; property: "eulerRotation.z"; to: -34; duration: 350; easing.type: Easing.InOutSine }
        }
        SequentialAnimation {
            NumberAnimation { target: leg_back_L_upper; property: "eulerRotation.z"; to: -27; duration: 350; easing.type: Easing.InOutSine }
            NumberAnimation { target: leg_back_L_upper; property: "eulerRotation.z"; to: 27; duration: 700; easing.type: Easing.InOutSine }
            NumberAnimation { target: leg_back_L_upper; property: "eulerRotation.z"; to: -27; duration: 350; easing.type: Easing.InOutSine }
        }
        SequentialAnimation {
            NumberAnimation { target: leg_back_R_upper; property: "eulerRotation.z"; to: 27; duration: 350; easing.type: Easing.InOutSine }
            NumberAnimation { target: leg_back_R_upper; property: "eulerRotation.z"; to: -27; duration: 700; easing.type: Easing.InOutSine }
            NumberAnimation { target: leg_back_R_upper; property: "eulerRotation.z"; to: 27; duration: 350; easing.type: Easing.InOutSine }
        }
        SequentialAnimation {
            NumberAnimation { target: tail_01; property: "eulerRotation.y"; to: 14; duration: 700; easing.type: Easing.InOutSine }
            NumberAnimation { target: tail_01; property: "eulerRotation.y"; to: -14; duration: 700; easing.type: Easing.InOutSine }
        }
    }

    // Safe procedural jump: the legs tuck while rising and extend at the apex.
    // It never runs with the walk gait because Pet.qml enables one state at a time.
    ParallelAnimation {
        id: fallbackJumpGait
        running: node.fallbackJumpEnabled
        loops: 1
        SequentialAnimation {
            NumberAnimation { target: leg_front_L_upper; property: "eulerRotation.z"; to: -55; duration: 220; easing.type: Easing.OutQuad }
            NumberAnimation { target: leg_front_L_upper; property: "eulerRotation.z"; to: 42; duration: 250; easing.type: Easing.OutQuad }
            NumberAnimation { target: leg_front_L_upper; property: "eulerRotation.z"; to: 0; duration: 250; easing.type: Easing.InOutSine }
        }
        SequentialAnimation {
            NumberAnimation { target: leg_front_R_upper; property: "eulerRotation.z"; to: -55; duration: 220; easing.type: Easing.OutQuad }
            NumberAnimation { target: leg_front_R_upper; property: "eulerRotation.z"; to: 42; duration: 250; easing.type: Easing.OutQuad }
            NumberAnimation { target: leg_front_R_upper; property: "eulerRotation.z"; to: 0; duration: 250; easing.type: Easing.InOutSine }
        }
        SequentialAnimation {
            NumberAnimation { target: leg_back_L_upper; property: "eulerRotation.z"; to: 48; duration: 220; easing.type: Easing.OutQuad }
            NumberAnimation { target: leg_back_L_upper; property: "eulerRotation.z"; to: -38; duration: 250; easing.type: Easing.OutQuad }
            NumberAnimation { target: leg_back_L_upper; property: "eulerRotation.z"; to: 0; duration: 250; easing.type: Easing.InOutSine }
        }
        SequentialAnimation {
            NumberAnimation { target: leg_back_R_upper; property: "eulerRotation.z"; to: 48; duration: 220; easing.type: Easing.OutQuad }
            NumberAnimation { target: leg_back_R_upper; property: "eulerRotation.z"; to: -38; duration: 250; easing.type: Easing.OutQuad }
            NumberAnimation { target: leg_back_R_upper; property: "eulerRotation.z"; to: 0; duration: 250; easing.type: Easing.InOutSine }
        }
        SequentialAnimation {
            NumberAnimation { target: leg_front_L_lower; property: "eulerRotation.z"; to: 58; duration: 220; easing.type: Easing.OutQuad }
            NumberAnimation { target: leg_front_L_lower; property: "eulerRotation.z"; to: -42; duration: 250; easing.type: Easing.OutQuad }
            NumberAnimation { target: leg_front_L_lower; property: "eulerRotation.z"; to: 0; duration: 250; easing.type: Easing.InOutSine }
        }
        SequentialAnimation {
            NumberAnimation { target: leg_front_R_lower; property: "eulerRotation.z"; to: 58; duration: 220; easing.type: Easing.OutQuad }
            NumberAnimation { target: leg_front_R_lower; property: "eulerRotation.z"; to: -42; duration: 250; easing.type: Easing.OutQuad }
            NumberAnimation { target: leg_front_R_lower; property: "eulerRotation.z"; to: 0; duration: 250; easing.type: Easing.InOutSine }
        }
        SequentialAnimation {
            NumberAnimation { target: leg_back_L_lower; property: "eulerRotation.z"; to: -52; duration: 220; easing.type: Easing.OutQuad }
            NumberAnimation { target: leg_back_L_lower; property: "eulerRotation.z"; to: 38; duration: 250; easing.type: Easing.OutQuad }
            NumberAnimation { target: leg_back_L_lower; property: "eulerRotation.z"; to: 0; duration: 250; easing.type: Easing.InOutSine }
        }
        SequentialAnimation {
            NumberAnimation { target: leg_back_R_lower; property: "eulerRotation.z"; to: -52; duration: 220; easing.type: Easing.OutQuad }
            NumberAnimation { target: leg_back_R_lower; property: "eulerRotation.z"; to: 38; duration: 250; easing.type: Easing.OutQuad }
            NumberAnimation { target: leg_back_R_lower; property: "eulerRotation.z"; to: 0; duration: 250; easing.type: Easing.InOutSine }
        }
    }

    // An exported mapping of Timelines (--manualAnimations)
    property var timelineMap: {
        "Celebrate": celebrate_timeline,
        "Dead": dead_timeline,
        "Idle": idle_timeline,
        "Jump": jump_timeline,
        "Run": run_timeline,
        "Sleep": sleep_timeline,
        "Walk": walk_timeline,
    }
    // A simple list of Timelines (--manualAnimations)
    property var timelineList: [
        celebrate_timeline,
        dead_timeline,
        idle_timeline,
        jump_timeline,
        run_timeline,
        sleep_timeline,
        walk_timeline,
    ]
}
