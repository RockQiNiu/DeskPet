import QtQuick
import QtQuick3D

import QtQuick.Timeline

Node {
    id: node
    property string activeAnimation: "Idle"

    // Resources
    property url textureData: "maps/textureData.png"
    property url textureData8: "maps/textureData8.png"
    property url textureData10: "maps/textureData10.png"
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
        id: programmerCat_PBR_material
        objectName: "ProgrammerCat_PBR"
        baseColorMap: _0_texture
        metalnessMap: _1_texture
        roughnessMap: _1_texture
        metalness: 1
        roughness: 1
        normalMap: _2_texture
        normalStrength: 0.1599999964237213
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    Skin {
        id: skin
        joints: [
            root,
            pelvis,
            hindleg_L,
            paw_back_L,
            toe_L,
            hindleg_R,
            paw_back_R,
            toe_R,
            spine,
            chest,
            neck,
            head,
            brow_L,
            brow_R,
            ear_L,
            ear_R,
            eye_L,
            eye_R,
            jaw,
            shoulder_L,
            arm_L,
            foreleg_L,
            paw_front_L,
            shoulder_R,
            arm_R,
            foreleg_R,
            paw_front_R,
            tail_01,
            tail_02,
            tail_03
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, -0.22, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.984604, -0.123076, -0.124033, 0.155075, -0.124036, -0.992278, 1.76949e-07, 0.282799, -0.123077, 0.0153846, -0.992278, -0.0193846, 0, 0, 0, 1),
            Qt.matrix4x4(0.999989, -5.18665e-07, 3.36823e-07, 0.139999, -4.59166e-06, -0.554699, -0.83205, 0.0776573, 2.48194e-06, 0.83205, -0.5547, -0.116487, 0, 0, 0, 1),
            Qt.matrix4x4(0.999989, 6.36639e-12, 0, 0.139998, -2.78058e-06, 4.17232e-07, -1, -0.1, 4.09342e-06, 0.999999, 0, -0.0599994, 0, 0, 0, 1),
            Qt.matrix4x4(0.984604, 0.123076, 0.124033, -0.155075, 0.124036, -0.992278, 1.76949e-07, 0.282799, 0.123077, 0.0153846, -0.992278, -0.0193846, 0, 0, 0, 1),
            Qt.matrix4x4(0.999989, 5.18665e-07, -3.36823e-07, -0.139999, 4.59166e-06, -0.554699, -0.83205, 0.0776573, -2.48194e-06, 0.83205, -0.5547, -0.116487, 0, 0, 0, 1),
            Qt.matrix4x4(0.999989, -6.36639e-12, 0, -0.139998, 2.78058e-06, 4.17232e-07, -1, -0.1, -4.09342e-06, 0.999999, 0, -0.0599994, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, -0.3, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, -0.5, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, -0.68, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, -0.76, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.666206, -0.0370887, 0.744845, 0.240378, 0.744845, 0.0827615, -0.662085, -0.0124151, -0.0370887, 0.995879, 0.0827615, -1.0544, 0, 0, 0, 1),
            Qt.matrix4x4(0.666206, 0.0370887, -0.744845, -0.240378, -0.744845, 0.0827615, -0.662085, -0.0124151, 0.0370887, 0.995879, 0.0827615, -1.0544, 0, 0, 0, 1),
            Qt.matrix4x4(0.924528, 0.264151, -0.274721, -0.0832074, -0.274721, 0.961524, -7.45058e-09, -1.06729, 0.264151, 0.0754716, 0.961524, -0.0237735, 0, 0, 0, 1),
            Qt.matrix4x4(0.924528, -0.264151, 0.274721, 0.0832074, 0.274721, 0.961524, -7.45058e-09, -1.06729, -0.264151, 0.0754716, 0.961524, -0.0237735, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.145, 0, 0, -1, -0.1, 0, 1, 0, -0.955, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.145, 0, 0, -1, -0.1, 0, 1, 0, -0.955, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.05, 0, 1, 0, -0.82, 0, 0, 0, 1),
            Qt.matrix4x4(0.1, -0.3, -0.948683, 0.199, -0.948683, -0.316228, 7.45058e-09, 0.0727326, -0.3, 0.9, -0.316228, -0.597, 0, 0, 0, 1),
            Qt.matrix4x4(0.990099, -0.0990099, -0.0995038, 0.276238, -0.0995037, -0.995037, 9.87202e-08, 0.565181, -0.0990099, 0.00990097, -0.995037, -0.0276238, 0, 0, 0, 1),
            Qt.matrix4x4(1, -3.49246e-10, -7.45058e-09, 0.235, 9.70904e-08, -1, 6.61239e-08, 0.44, 2.98023e-08, 9.31322e-10, -1, 1.10864e-08, 0, 0, 0, 1),
            Qt.matrix4x4(1, 4.44089e-16, -8.88178e-16, 0.235, 8.82661e-08, -0.6, -0.8, 0.192, -5.56e-08, 0.8, -0.6, -0.256, 0, 0, 0, 1),
            Qt.matrix4x4(0.1, 0.3, 0.948683, -0.199, 0.948683, -0.316228, 7.45058e-09, 0.0727326, 0.3, 0.9, -0.316228, -0.597, 0, 0, 0, 1),
            Qt.matrix4x4(0.990099, 0.0990099, 0.0995038, -0.276238, 0.0995037, -0.995037, 9.87202e-08, 0.565181, 0.0990099, 0.00990097, -0.995037, -0.0276238, 0, 0, 0, 1),
            Qt.matrix4x4(1, 3.49246e-10, 7.45058e-09, -0.235, -9.70904e-08, -1, 6.61239e-08, 0.44, -2.98023e-08, 9.31322e-10, -1, 1.10864e-08, 0, 0, 0, 1),
            Qt.matrix4x4(1, -4.44089e-16, 8.88178e-16, -0.235, -8.82661e-08, -0.6, -0.8, 0.192, 5.56e-08, 0.8, -0.6, -0.256, 0, 0, 0, 1),
            Qt.matrix4x4(0.0882904, -0.651221, 0.753735, 0.17209, 0.753735, 0.538382, 0.376867, -0.242272, -0.651221, 0.534842, 0.538382, -0.257078, 0, 0, 0, 1),
            Qt.matrix4x4(0.684764, -0.337753, 0.645772, -0.0435268, 0.645772, 0.691898, -0.322886, -0.367629, -0.337753, 0.638122, 0.691898, -0.376636, 0, 0, 0, 1),
            Qt.matrix4x4(0.99856, -0.0230442, 0.0484501, -0.269924, 0.0484501, 0.775203, -0.629852, -0.438958, -0.0230443, 0.631292, 0.775203, -0.468782, 0, 0, 0, 1)
        ]
    }
    Skin {
        id: skin14
        joints: [
            root,
            pelvis,
            hindleg_L,
            paw_back_L,
            toe_L,
            hindleg_R,
            paw_back_R,
            toe_R,
            spine,
            chest,
            neck,
            head,
            brow_L,
            brow_R,
            ear_L,
            ear_R,
            eye_L,
            eye_R,
            jaw,
            shoulder_L,
            arm_L,
            foreleg_L,
            paw_front_L,
            shoulder_R,
            arm_R,
            foreleg_R,
            paw_front_R,
            tail_01,
            tail_02,
            tail_03
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, -0.22, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.984604, -0.123076, -0.124033, 0.155075, -0.124036, -0.992278, 1.76949e-07, 0.282799, -0.123077, 0.0153846, -0.992278, -0.0193846, 0, 0, 0, 1),
            Qt.matrix4x4(0.999989, -5.18665e-07, 3.36823e-07, 0.139999, -4.59166e-06, -0.554699, -0.83205, 0.0776573, 2.48194e-06, 0.83205, -0.5547, -0.116487, 0, 0, 0, 1),
            Qt.matrix4x4(0.999989, 6.36639e-12, 0, 0.139998, -2.78058e-06, 4.17232e-07, -1, -0.1, 4.09342e-06, 0.999999, 0, -0.0599994, 0, 0, 0, 1),
            Qt.matrix4x4(0.984604, 0.123076, 0.124033, -0.155075, 0.124036, -0.992278, 1.76949e-07, 0.282799, 0.123077, 0.0153846, -0.992278, -0.0193846, 0, 0, 0, 1),
            Qt.matrix4x4(0.999989, 5.18665e-07, -3.36823e-07, -0.139999, 4.59166e-06, -0.554699, -0.83205, 0.0776573, -2.48194e-06, 0.83205, -0.5547, -0.116487, 0, 0, 0, 1),
            Qt.matrix4x4(0.999989, -6.36639e-12, 0, -0.139998, 2.78058e-06, 4.17232e-07, -1, -0.1, -4.09342e-06, 0.999999, 0, -0.0599994, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, -0.3, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, -0.5, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, -0.68, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 1, 0, -0.76, 0, 0, 1, 0, 0, 0, 0, 1),
            Qt.matrix4x4(0.666206, -0.0370887, 0.744845, 0.240378, 0.744845, 0.0827615, -0.662085, -0.0124151, -0.0370887, 0.995879, 0.0827615, -1.0544, 0, 0, 0, 1),
            Qt.matrix4x4(0.666206, 0.0370887, -0.744845, -0.240378, -0.744845, 0.0827615, -0.662085, -0.0124151, 0.0370887, 0.995879, 0.0827615, -1.0544, 0, 0, 0, 1),
            Qt.matrix4x4(0.924528, 0.264151, -0.274721, -0.0832074, -0.274721, 0.961524, -7.45058e-09, -1.06729, 0.264151, 0.0754716, 0.961524, -0.0237735, 0, 0, 0, 1),
            Qt.matrix4x4(0.924528, -0.264151, 0.274721, 0.0832074, 0.274721, 0.961524, -7.45058e-09, -1.06729, -0.264151, 0.0754716, 0.961524, -0.0237735, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.145, 0, 0, -1, -0.1, 0, 1, 0, -0.955, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.145, 0, 0, -1, -0.1, 0, 1, 0, -0.955, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0, 0, 0, -1, -0.05, 0, 1, 0, -0.82, 0, 0, 0, 1),
            Qt.matrix4x4(0.1, -0.3, -0.948683, 0.199, -0.948683, -0.316228, 7.45058e-09, 0.0727326, -0.3, 0.9, -0.316228, -0.597, 0, 0, 0, 1),
            Qt.matrix4x4(0.990099, -0.0990099, -0.0995038, 0.276238, -0.0995037, -0.995037, 9.87202e-08, 0.565181, -0.0990099, 0.00990097, -0.995037, -0.0276238, 0, 0, 0, 1),
            Qt.matrix4x4(1, -3.49246e-10, -7.45058e-09, 0.235, 9.70904e-08, -1, 6.61239e-08, 0.44, 2.98023e-08, 9.31322e-10, -1, 1.10864e-08, 0, 0, 0, 1),
            Qt.matrix4x4(1, 4.44089e-16, -8.88178e-16, 0.235, 8.82661e-08, -0.6, -0.8, 0.192, -5.56e-08, 0.8, -0.6, -0.256, 0, 0, 0, 1),
            Qt.matrix4x4(0.1, 0.3, 0.948683, -0.199, 0.948683, -0.316228, 7.45058e-09, 0.0727326, 0.3, 0.9, -0.316228, -0.597, 0, 0, 0, 1),
            Qt.matrix4x4(0.990099, 0.0990099, 0.0995038, -0.276238, 0.0995037, -0.995037, 9.87202e-08, 0.565181, 0.0990099, 0.00990097, -0.995037, -0.0276238, 0, 0, 0, 1),
            Qt.matrix4x4(1, 3.49246e-10, 7.45058e-09, -0.235, -9.70904e-08, -1, 6.61239e-08, 0.44, -2.98023e-08, 9.31322e-10, -1, 1.10864e-08, 0, 0, 0, 1),
            Qt.matrix4x4(1, -4.44089e-16, 8.88178e-16, -0.235, -8.82661e-08, -0.6, -0.8, 0.192, 5.56e-08, 0.8, -0.6, -0.256, 0, 0, 0, 1),
            Qt.matrix4x4(0.0882904, -0.651221, 0.753735, 0.17209, 0.753735, 0.538382, 0.376867, -0.242272, -0.651221, 0.534842, 0.538382, -0.257078, 0, 0, 0, 1),
            Qt.matrix4x4(0.684764, -0.337753, 0.645772, -0.0435268, 0.645772, 0.691898, -0.322886, -0.367629, -0.337753, 0.638122, 0.691898, -0.376636, 0, 0, 0, 1),
            Qt.matrix4x4(0.99856, -0.0230442, 0.0484501, -0.269924, 0.0484501, 0.775203, -0.629852, -0.438958, -0.0230443, 0.631292, 0.775203, -0.468782, 0, 0, 0, 1)
        ]
    }
    MorphTarget {
        id: morphTarget
        attributes: MorphTarget.Position | MorphTarget.Normal
    }
    MorphTarget {
        id: morphTarget16
        attributes: MorphTarget.Position | MorphTarget.Normal
    }
    MorphTarget {
        id: morphTarget17
        attributes: MorphTarget.Position | MorphTarget.Normal
    }
    MorphTarget {
        id: morphTarget18
        attributes: MorphTarget.Position | MorphTarget.Normal
    }
    MorphTarget {
        id: morphTarget19
        attributes: MorphTarget.Position | MorphTarget.Normal
    }
    MorphTarget {
        id: morphTarget20
        attributes: MorphTarget.Position | MorphTarget.Normal
    }
    MorphTarget {
        id: morphTarget21
        attributes: MorphTarget.Position | MorphTarget.Normal
    }

    // Nodes:
    Node {
        id: cat_Rig
        objectName: "Cat_Rig"
        Model {
            id: cat_Body
            objectName: "Cat_Body"
            source: "meshes/___mesh.mesh"
            skin: skin
            materials: [
                programmerCat_PBR_material
            ]
        }
        Model {
            id: cat_Eyes
            objectName: "Cat_Eyes"
            source: "meshes/___030_mesh.mesh"
            skin: skin14
            materials: [
                programmerCat_PBR_material
            ]
            morphTargets: [
                morphTarget,
                morphTarget16,
                morphTarget17,
                morphTarget18,
                morphTarget19,
                morphTarget20,
                morphTarget21
            ]
        }
        Node {
            id: root
            objectName: "root"
            Node {
                id: pelvis
                objectName: "pelvis"
                position: Qt.vector3d(0, 0.22, 0)
                Node {
                    id: hindleg_L
                    objectName: "hindleg.L"
                    position: Qt.vector3d(-0.12, 0.08, 0)
                    rotation: Qt.quaternion(-0.00386106, 0.996139, -0.0620177, -0.0620174)
                    scale: Qt.vector3d(1.00001, 1, 1)
                    Node {
                        id: paw_back_L
                        objectName: "paw_back.L"
                        position: Qt.vector3d(0, 0.161245, 2.32831e-09)
                        rotation: Qt.quaternion(0.880092, 0.466632, 0.0254157, -0.0839415)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: toe_L
                            objectName: "toe.L"
                            position: Qt.vector3d(-5.19752e-09, 0.127581, -0.011094)
                            rotation: Qt.quaternion(0.957092, 0.289784, -2.97011e-07, 8.60336e-08)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                }
                Node {
                    id: hindleg_R
                    objectName: "hindleg.R"
                    position: Qt.vector3d(0.12, 0.08, 0)
                    rotation: Qt.quaternion(-0.00386106, 0.996139, 0.0620177, 0.0620174)
                    scale: Qt.vector3d(1.00001, 1, 1)
                    Node {
                        id: paw_back_R
                        objectName: "paw_back.R"
                        position: Qt.vector3d(0, 0.161245, 2.32831e-09)
                        rotation: Qt.quaternion(0.880092, 0.466632, -0.0254157, 0.0839415)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: toe_R
                            objectName: "toe.R"
                            position: Qt.vector3d(5.19752e-09, 0.127581, -0.011094)
                            rotation: Qt.quaternion(0.957092, 0.289784, 2.97011e-07, -8.60336e-08)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                }
                Node {
                    id: spine
                    objectName: "spine"
                    position: Qt.vector3d(0, 0.08, 0)
                    Node {
                        id: chest
                        objectName: "chest"
                        position: Qt.vector3d(0, 0.2, 0)
                        Node {
                            id: neck
                            objectName: "neck"
                            position: Qt.vector3d(0, 0.18, 0)
                            Node {
                                id: head
                                objectName: "head"
                                position: Qt.vector3d(0, 0.08, 0)
                                Node {
                                    id: brow_L
                                    objectName: "brow.L"
                                    position: Qt.vector3d(-0.19, 0.3, -0.1)
                                    rotation: Qt.quaternion(0.676707, -0.612512, -0.288875, -0.288875)
                                    scale: Qt.vector3d(1, 1, 1)
                                }
                                Node {
                                    id: brow_R
                                    objectName: "brow.R"
                                    position: Qt.vector3d(0.19, 0.3, -0.1)
                                    rotation: Qt.quaternion(0.676707, -0.612512, 0.288875, 0.288875)
                                    scale: Qt.vector3d(1, 1, 1)
                                }
                                Node {
                                    id: ear_L
                                    objectName: "ear.L"
                                    position: Qt.vector3d(-0.21, 0.29, 0)
                                    rotation: Qt.quaternion(0.980762, -0.019238, 0.137361, 0.13736)
                                    scale: Qt.vector3d(1, 1, 1)
                                }
                                Node {
                                    id: ear_R
                                    objectName: "ear.R"
                                    position: Qt.vector3d(0.21, 0.29, 0)
                                    rotation: Qt.quaternion(0.980762, -0.019238, -0.137361, -0.13736)
                                    scale: Qt.vector3d(1, 1, 1)
                                }
                                Node {
                                    id: eye_L
                                    objectName: "eye.L"
                                    position: Qt.vector3d(-0.145, 0.195, -0.1)
                                    rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
                                    scale: Qt.vector3d(1, 1, 1)
                                }
                                Node {
                                    id: eye_R
                                    objectName: "eye.R"
                                    position: Qt.vector3d(0.145, 0.195, -0.1)
                                    rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
                                    scale: Qt.vector3d(1, 1, 1)
                                }
                                Node {
                                    id: jaw
                                    objectName: "jaw"
                                    position: Qt.vector3d(0, 0.06, -0.05)
                                    rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
                                    scale: Qt.vector3d(1, 1, 1)
                                }
                            }
                        }
                        Node {
                            id: shoulder_L
                            objectName: "shoulder.L"
                            position: Qt.vector3d(-0.13, 0.12, 0)
                            rotation: Qt.quaternion(-0.341886, 0.658114, -0.474342, -0.474342)
                            scale: Qt.vector3d(1, 1, 1)
                            Node {
                                id: arm_L
                                objectName: "arm.L"
                                position: Qt.vector3d(-3.72529e-09, 0.0948684, 6.70552e-08)
                                rotation: Qt.quaternion(0.704528, -0.339405, 0.456255, -0.42459)
                                scale: Qt.vector3d(1, 1, 1)
                                Node {
                                    id: foreleg_L
                                    objectName: "foreleg.L"
                                    position: Qt.vector3d(-1.16229e-08, 0.150748, 2.04891e-09)
                                    rotation: Qt.quaternion(0.997519, -0.00248139, 0.0497519, -0.0497519)
                                    scale: Qt.vector3d(1, 1, 1)
                                    Node {
                                        id: paw_front_L
                                        objectName: "paw_front.L"
                                        position: Qt.vector3d(-1.11759e-10, 0.12, 1.66533e-16)
                                        rotation: Qt.quaternion(0.894427, 0.447214, 3.25391e-09, -1.82219e-09)
                                        scale: Qt.vector3d(1, 1, 1)
                                    }
                                }
                            }
                        }
                        Node {
                            id: shoulder_R
                            objectName: "shoulder.R"
                            position: Qt.vector3d(0.13, 0.12, 0)
                            rotation: Qt.quaternion(-0.341886, 0.658114, 0.474342, 0.474342)
                            scale: Qt.vector3d(1, 1, 1)
                            Node {
                                id: arm_R
                                objectName: "arm.R"
                                position: Qt.vector3d(3.72529e-09, 0.0948684, 6.70552e-08)
                                rotation: Qt.quaternion(0.704528, -0.339405, -0.456255, 0.42459)
                                scale: Qt.vector3d(1, 1, 1)
                                Node {
                                    id: foreleg_R
                                    objectName: "foreleg.R"
                                    position: Qt.vector3d(1.16229e-08, 0.150748, 2.04891e-09)
                                    rotation: Qt.quaternion(0.997519, -0.00248139, -0.0497519, 0.0497519)
                                    scale: Qt.vector3d(1, 1, 1)
                                    Node {
                                        id: paw_front_R
                                        objectName: "paw_front.R"
                                        position: Qt.vector3d(1.11759e-10, 0.12, 1.66533e-16)
                                        rotation: Qt.quaternion(0.894427, 0.447214, -3.25391e-09, 1.82219e-09)
                                        scale: Qt.vector3d(1, 1, 1)
                                    }
                                }
                            }
                        }
                    }
                }
                Node {
                    id: tail_01
                    objectName: "tail.01"
                    position: Qt.vector3d(0, 0.16, 0.1)
                    rotation: Qt.quaternion(0.735706, -0.0536814, -0.477417, -0.477417)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: tail_02
                        objectName: "tail.02"
                        position: Qt.vector3d(2.79397e-08, 0.185742, 1.49012e-08)
                        rotation: Qt.quaternion(0.927155, -0.154788, 0.0957323, 0.327506)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: tail_03
                            objectName: "tail.03"
                            position: Qt.vector3d(-1.49012e-08, 0.216795, -2.23517e-08)
                            rotation: Qt.quaternion(0.927477, -0.0347962, 0.159048, 0.33657)
                            scale: Qt.vector3d(1, 1, 1)
                        }
                    }
                }
            }
        }
    }

    // Animations:
    Timeline {
        id: angry_timeline
        objectName: "Angry"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 1534
        currentFrame: 0
        enabled: node.activeAnimation === "Angry"
        animations: TimelineAnimation { duration: 1534; from: 0; to: 1534; running: angry_timeline.enabled; loops: Animation.Infinite }
        KeyframeGroup {
            target: hindleg_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(0.12, 0.08, 9.24125e-10)
            }
        }
        KeyframeGroup {
            target: hindleg_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.00386106, -0.996139, -0.0620177, -0.0620174)
            }
        }
        KeyframeGroup {
            target: paw_back_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.14059e-08, 0.161245, 2.52454e-08)
            }
        }
        KeyframeGroup {
            target: hindleg_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-0.12, 0.08, 9.24125e-10)
            }
        }
        KeyframeGroup {
            target: hindleg_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.00386106, -0.996139, 0.0620177, 0.0620174)
            }
        }
        KeyframeGroup {
            target: paw_back_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-1.14059e-08, 0.161245, 2.52454e-08)
            }
        }
        KeyframeGroup {
            target: toe_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-5.19714e-09, 0.127581, -0.011094)
            }
        }
        KeyframeGroup {
            target: toe_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(5.19714e-09, 0.127581, -0.011094)
            }
        }
        KeyframeGroup {
            target: ear_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-0.21, 0.29, -1.53513e-09)
            }
        }
        KeyframeGroup {
            target: ear_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.936665, 0.0989764, 0.168471, 0.290654)
            }
        }
        KeyframeGroup {
            target: ear_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(0.21, 0.29, -1.53513e-09)
            }
        }
        KeyframeGroup {
            target: ear_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.936665, 0.0989764, -0.168471, -0.290654)
            }
        }
        KeyframeGroup {
            target: shoulder_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-0.13, 0.12, 2.9451e-09)
            }
        }
        KeyframeGroup {
            target: shoulder_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.341886, -0.658114, 0.474342, 0.474342)
            }
        }
        KeyframeGroup {
            target: arm_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.16458e-08, 0.0948684, 1.03923e-08)
            }
        }
        KeyframeGroup {
            target: arm_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.60054, -0.427059, 0.375479, -0.562128)
            }
        }
        KeyframeGroup {
            target: foreleg_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-1.23995e-08, 0.150748, 2.12657e-09)
            }
        }
        KeyframeGroup {
            target: paw_front_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-4.72472e-09, 0.12, -3.81841e-09)
            }
        }
        KeyframeGroup {
            target: paw_front_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.894427, 0.447214, 1.67902e-08, 2.60313e-09)
            }
        }
        KeyframeGroup {
            target: shoulder_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(0.13, 0.12, 2.9451e-09)
            }
        }
        KeyframeGroup {
            target: shoulder_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.341886, -0.658114, -0.474342, -0.474342)
            }
        }
        KeyframeGroup {
            target: arm_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-1.16458e-08, 0.0948684, 1.03923e-08)
            }
        }
        KeyframeGroup {
            target: arm_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.60054, -0.427059, -0.375479, 0.562128)
            }
        }
        KeyframeGroup {
            target: foreleg_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.23995e-08, 0.150748, 2.12657e-09)
            }
        }
        KeyframeGroup {
            target: paw_front_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(4.72472e-09, 0.12, -3.81841e-09)
            }
        }
        KeyframeGroup {
            target: paw_front_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.894427, 0.447214, -1.67902e-08, -2.60313e-09)
            }
        }
        KeyframeGroup {
            target: tail_01
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-5.1279e-09, 0.16, 0.1)
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
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.50902e-08, 0.185742, 1.66469e-09)
            }
        }
        KeyframeGroup {
            target: tail_02
            property: "rotation"
            keyframeSource: "animations/tail_02_rotation_0.qad"
        }
        KeyframeGroup {
            target: tail_03
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-3.17095e-08, 0.216795, 9.95605e-08)
            }
        }
        KeyframeGroup {
            target: tail_03
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.940194, -0.0411286, 0.157529, 0.299212)
            }
        }
    }
    Timeline {
        id: celebrate_timeline
        objectName: "Celebrate"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 1834
        currentFrame: 0
        enabled: node.activeAnimation === "Celebrate"
        animations: TimelineAnimation { duration: 1834; from: 0; to: 1834; running: celebrate_timeline.enabled; loops: Animation.Infinite }
        KeyframeGroup {
            target: hindleg_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(0.12, 0.08, 9.24125e-10)
            }
        }
        KeyframeGroup {
            target: hindleg_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.00386106, -0.996139, -0.0620177, -0.0620174)
            }
        }
        KeyframeGroup {
            target: paw_back_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.14059e-08, 0.161245, 2.52454e-08)
            }
        }
        KeyframeGroup {
            target: hindleg_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-0.12, 0.08, 9.24125e-10)
            }
        }
        KeyframeGroup {
            target: hindleg_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.00386106, -0.996139, 0.0620177, 0.0620174)
            }
        }
        KeyframeGroup {
            target: paw_back_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-1.14059e-08, 0.161245, 2.52454e-08)
            }
        }
        KeyframeGroup {
            target: toe_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-5.19714e-09, 0.127581, -0.011094)
            }
        }
        KeyframeGroup {
            target: toe_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(5.19714e-09, 0.127581, -0.011094)
            }
        }
        KeyframeGroup {
            target: spine
            property: "position"
            keyframeSource: "animations/spine_position_1.qad"
        }
        KeyframeGroup {
            target: ear_L
            property: "position"
            keyframeSource: "animations/ear_L_position_1.qad"
        }
        KeyframeGroup {
            target: ear_R
            property: "position"
            keyframeSource: "animations/ear_R_position_1.qad"
        }
        KeyframeGroup {
            target: shoulder_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-0.13, 0.12, 2.9451e-09)
            }
        }
        KeyframeGroup {
            target: shoulder_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.341886, -0.658114, 0.474342, 0.474342)
            }
        }
        KeyframeGroup {
            target: arm_L
            property: "position"
            keyframeSource: "animations/arm_L_position_1.qad"
        }
        KeyframeGroup {
            target: arm_L
            property: "rotation"
            keyframeSource: "animations/arm_L_rotation_1.qad"
        }
        KeyframeGroup {
            target: foreleg_L
            property: "position"
            keyframeSource: "animations/foreleg_L_position_1.qad"
        }
        KeyframeGroup {
            target: paw_front_L
            property: "position"
            keyframeSource: "animations/paw_front_L_position_1.qad"
        }
        KeyframeGroup {
            target: paw_front_L
            property: "rotation"
            keyframeSource: "animations/paw_front_L_rotation_1.qad"
        }
        KeyframeGroup {
            target: shoulder_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(0.13, 0.12, 2.9451e-09)
            }
        }
        KeyframeGroup {
            target: shoulder_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.341886, -0.658114, -0.474342, -0.474342)
            }
        }
        KeyframeGroup {
            target: arm_R
            property: "position"
            keyframeSource: "animations/arm_R_position_1.qad"
        }
        KeyframeGroup {
            target: arm_R
            property: "rotation"
            keyframeSource: "animations/arm_R_rotation_1.qad"
        }
        KeyframeGroup {
            target: foreleg_R
            property: "position"
            keyframeSource: "animations/foreleg_R_position_1.qad"
        }
        KeyframeGroup {
            target: paw_front_R
            property: "position"
            keyframeSource: "animations/paw_front_R_position_1.qad"
        }
        KeyframeGroup {
            target: paw_front_R
            property: "rotation"
            keyframeSource: "animations/paw_front_R_rotation_1.qad"
        }
        KeyframeGroup {
            target: tail_01
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-5.1279e-09, 0.16, 0.1)
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
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.50902e-08, 0.185742, 1.66469e-09)
            }
        }
        KeyframeGroup {
            target: tail_02
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.913316, -0.150836, 0.101846, 0.36432)
            }
        }
        KeyframeGroup {
            target: tail_03
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-3.17095e-08, 0.216795, 9.95605e-08)
            }
        }
        KeyframeGroup {
            target: tail_03
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.940194, -0.0411286, 0.157529, 0.299212)
            }
        }
    }
    Timeline {
        id: dead_timeline
        objectName: "Dead"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 1034
        currentFrame: 0
        enabled: node.activeAnimation === "Dead"
        animations: TimelineAnimation { duration: 1034; from: 0; to: 1034; running: dead_timeline.enabled; loops: 1 }
        KeyframeGroup {
            target: hindleg_R
            property: "position"
            keyframeSource: "animations/hindleg_R_position_2.qad"
        }
        KeyframeGroup {
            target: hindleg_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.00386106, -0.996139, -0.0620177, -0.0620174)
            }
        }
        KeyframeGroup {
            target: root
            property: "position"
            keyframeSource: "animations/root_position_2.qad"
        }
        KeyframeGroup {
            target: root
            property: "rotation"
            keyframeSource: "animations/root_rotation_2.qad"
        }
        KeyframeGroup {
            target: paw_back_R
            property: "position"
            keyframeSource: "animations/paw_back_R_position_2.qad"
        }
        KeyframeGroup {
            target: hindleg_L
            property: "position"
            keyframeSource: "animations/hindleg_L_position_2.qad"
        }
        KeyframeGroup {
            target: hindleg_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.00386106, -0.996139, 0.0620177, 0.0620174)
            }
        }
        KeyframeGroup {
            target: paw_back_L
            property: "position"
            keyframeSource: "animations/paw_back_L_position_2.qad"
        }
        KeyframeGroup {
            target: toe_L
            property: "position"
            keyframeSource: "animations/toe_L_position_2.qad"
        }
        KeyframeGroup {
            target: toe_L
            property: "rotation"
            keyframeSource: "animations/toe_L_rotation_2.qad"
        }
        KeyframeGroup {
            target: toe_R
            property: "position"
            keyframeSource: "animations/toe_R_position_2.qad"
        }
        KeyframeGroup {
            target: toe_R
            property: "rotation"
            keyframeSource: "animations/toe_R_rotation_2.qad"
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
            property: "position"
            keyframeSource: "animations/ear_L_position_2.qad"
        }
        KeyframeGroup {
            target: ear_R
            property: "position"
            keyframeSource: "animations/ear_R_position_2.qad"
        }
        KeyframeGroup {
            target: eye_L
            property: "rotation"
            keyframeSource: "animations/eye_L_rotation_2.qad"
        }
        KeyframeGroup {
            target: eye_R
            property: "rotation"
            keyframeSource: "animations/eye_R_rotation_2.qad"
        }
        KeyframeGroup {
            target: jaw
            property: "position"
            keyframeSource: "animations/jaw_position_2.qad"
        }
        KeyframeGroup {
            target: jaw
            property: "rotation"
            keyframeSource: "animations/jaw_rotation_2.qad"
        }
        KeyframeGroup {
            target: shoulder_L
            property: "position"
            keyframeSource: "animations/shoulder_L_position_2.qad"
        }
        KeyframeGroup {
            target: shoulder_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.341886, -0.658114, 0.474342, 0.474342)
            }
        }
        KeyframeGroup {
            target: arm_L
            property: "position"
            keyframeSource: "animations/arm_L_position_2.qad"
        }
        KeyframeGroup {
            target: arm_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.81062, -0.0427744, 0.430269, -0.394884)
            }
        }
        KeyframeGroup {
            target: foreleg_L
            property: "position"
            keyframeSource: "animations/foreleg_L_position_2.qad"
        }
        KeyframeGroup {
            target: paw_front_L
            property: "position"
            keyframeSource: "animations/paw_front_L_position_2.qad"
        }
        KeyframeGroup {
            target: paw_front_L
            property: "rotation"
            keyframeSource: "animations/paw_front_L_rotation_2.qad"
        }
        KeyframeGroup {
            target: shoulder_R
            property: "position"
            keyframeSource: "animations/shoulder_R_position_2.qad"
        }
        KeyframeGroup {
            target: shoulder_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.341886, -0.658114, -0.474342, -0.474342)
            }
        }
        KeyframeGroup {
            target: arm_R
            property: "position"
            keyframeSource: "animations/arm_R_position_2.qad"
        }
        KeyframeGroup {
            target: arm_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.690879, -0.42617, -0.566914, 0.140262)
            }
        }
        KeyframeGroup {
            target: foreleg_R
            property: "position"
            keyframeSource: "animations/foreleg_R_position_2.qad"
        }
        KeyframeGroup {
            target: paw_front_R
            property: "position"
            keyframeSource: "animations/paw_front_R_position_2.qad"
        }
        KeyframeGroup {
            target: paw_front_R
            property: "rotation"
            keyframeSource: "animations/paw_front_R_rotation_2.qad"
        }
        KeyframeGroup {
            target: tail_01
            property: "position"
            keyframeSource: "animations/tail_01_position_2.qad"
        }
        KeyframeGroup {
            target: tail_01
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.710926, -0.0297534, -0.479504, -0.513591)
            }
        }
        KeyframeGroup {
            target: tail_02
            property: "position"
            keyframeSource: "animations/tail_02_position_2.qad"
        }
        KeyframeGroup {
            target: tail_02
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.913316, -0.150836, 0.101846, 0.36432)
            }
        }
        KeyframeGroup {
            target: tail_03
            property: "position"
            keyframeSource: "animations/tail_03_position_2.qad"
        }
        KeyframeGroup {
            target: tail_03
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.940194, -0.0411286, 0.157529, 0.299212)
            }
        }
    }
    Timeline {
        id: idle_timeline
        objectName: "Idle"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 3034
        currentFrame: 0
        enabled: node.activeAnimation === "Idle"
        animations: TimelineAnimation { duration: 3034; from: 0; to: 3034; running: idle_timeline.enabled; loops: Animation.Infinite }
        KeyframeGroup {
            target: hindleg_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(0.12, 0.08, 9.24125e-10)
            }
        }
        KeyframeGroup {
            target: hindleg_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.00386106, -0.996139, -0.0620177, -0.0620174)
            }
        }
        KeyframeGroup {
            target: paw_back_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.14059e-08, 0.161245, 2.52454e-08)
            }
        }
        KeyframeGroup {
            target: hindleg_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-0.12, 0.08, 9.24125e-10)
            }
        }
        KeyframeGroup {
            target: hindleg_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.00386106, -0.996139, 0.0620177, 0.0620174)
            }
        }
        KeyframeGroup {
            target: paw_back_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-1.14059e-08, 0.161245, 2.52454e-08)
            }
        }
        KeyframeGroup {
            target: toe_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-5.19714e-09, 0.127581, -0.011094)
            }
        }
        KeyframeGroup {
            target: toe_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(5.19714e-09, 0.127581, -0.011094)
            }
        }
        KeyframeGroup {
            target: chest
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(0, 0.2, 0.012)
            }
        }
        KeyframeGroup {
            target: head
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.999844, 0.0124987, 0.000156242, 0.0124987)
            }
        }
        KeyframeGroup {
            target: ear_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-0.21, 0.29, -8.5711e-09)
            }
        }
        KeyframeGroup {
            target: ear_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.978739, -0.00249526, 0.139899, 0.149974)
            }
        }
        KeyframeGroup {
            target: ear_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(0.21, 0.29, 5.62879e-09)
            }
        }
        KeyframeGroup {
            target: eye_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.707107, -0.707107, 3.18728e-10, -3.39302e-10)
            }
        }
        KeyframeGroup {
            target: eye_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.707107, -0.707107, 3.18728e-10, -3.39302e-10)
            }
        }
        KeyframeGroup {
            target: jaw
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(3.5137e-10, 0.06, -0.05)
            }
        }
        KeyframeGroup {
            target: jaw
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.707107, -0.707107, 3.18728e-10, -3.39302e-10)
            }
        }
        KeyframeGroup {
            target: shoulder_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-0.13, 0.12, 1.17805e-09)
            }
        }
        KeyframeGroup {
            target: shoulder_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.341886, -0.658114, 0.474342, 0.474342)
            }
        }
        KeyframeGroup {
            target: arm_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.14117e-08, 0.0948683, 7.36971e-08)
            }
        }
        KeyframeGroup {
            target: foreleg_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-1.72231e-09, 0.150748, 1.42243e-09)
            }
        }
        KeyframeGroup {
            target: paw_front_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-1.11759e-10, 0.12, -3.45521e-08)
            }
        }
        KeyframeGroup {
            target: shoulder_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(0.13, 0.12, 1.17805e-09)
            }
        }
        KeyframeGroup {
            target: shoulder_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.341886, -0.658114, -0.474342, -0.474342)
            }
        }
        KeyframeGroup {
            target: arm_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-1.14117e-08, 0.0948683, 7.36971e-08)
            }
        }
        KeyframeGroup {
            target: foreleg_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.72231e-09, 0.150748, 1.42243e-09)
            }
        }
        KeyframeGroup {
            target: paw_front_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.11759e-10, 0.12, -3.45521e-08)
            }
        }
        KeyframeGroup {
            target: tail_01
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-5.1279e-09, 0.16, 0.1)
            }
        }
        KeyframeGroup {
            target: tail_01
            property: "rotation"
            keyframeSource: "animations/tail_01_rotation_3.qad"
        }
        KeyframeGroup {
            target: tail_02
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.50902e-08, 0.185742, 1.66469e-09)
            }
        }
        KeyframeGroup {
            target: tail_02
            property: "rotation"
            keyframeSource: "animations/tail_02_rotation_3.qad"
        }
        KeyframeGroup {
            target: tail_03
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-3.17095e-08, 0.216795, 9.95605e-08)
            }
        }
        KeyframeGroup {
            target: tail_03
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.940194, -0.0411286, 0.157529, 0.299212)
            }
        }
    }
    Timeline {
        id: jump_timeline
        objectName: "Jump"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 834
        currentFrame: 0
        enabled: node.activeAnimation === "Jump"
        animations: TimelineAnimation { duration: 834; from: 0; to: 834; running: jump_timeline.enabled; loops: Animation.Infinite }
        KeyframeGroup {
            target: hindleg_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(0.12, 0.08, 9.24125e-10)
            }
        }
        KeyframeGroup {
            target: hindleg_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.169634, 0.981597, 0.0502728, 0.0718679)
            }
        }
        KeyframeGroup {
            target: paw_back_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.11201e-08, 0.161245, 3.09454e-08)
            }
        }
        KeyframeGroup {
            target: hindleg_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-0.12, 0.08, 9.24125e-10)
            }
        }
        KeyframeGroup {
            target: hindleg_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.169634, 0.981597, -0.0502728, -0.0718679)
            }
        }
        KeyframeGroup {
            target: paw_back_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-1.11201e-08, 0.161245, 3.09454e-08)
            }
        }
        KeyframeGroup {
            target: toe_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.89005e-08, 0.127581, -0.011094)
            }
        }
        KeyframeGroup {
            target: toe_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.957092, 0.289784, -2.96809e-07, 8.53651e-08)
            }
        }
        KeyframeGroup {
            target: toe_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-1.89005e-08, 0.127581, -0.011094)
            }
        }
        KeyframeGroup {
            target: toe_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.957092, 0.289784, 2.96809e-07, -8.53651e-08)
            }
        }
        KeyframeGroup {
            target: spine
            property: "position"
            keyframeSource: "animations/spine_position_4.qad"
        }
        KeyframeGroup {
            target: ear_L
            property: "position"
            keyframeSource: "animations/ear_L_position_4.qad"
        }
        KeyframeGroup {
            target: ear_R
            property: "position"
            keyframeSource: "animations/ear_R_position_4.qad"
        }
        KeyframeGroup {
            target: shoulder_L
            property: "position"
            keyframeSource: "animations/shoulder_L_position_4.qad"
        }
        KeyframeGroup {
            target: shoulder_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.341886, -0.658114, 0.474342, 0.474342)
            }
        }
        KeyframeGroup {
            target: arm_L
            property: "position"
            keyframeSource: "animations/arm_L_position_4.qad"
        }
        KeyframeGroup {
            target: arm_L
            property: "rotation"
            keyframeSource: "animations/arm_L_rotation_4.qad"
        }
        KeyframeGroup {
            target: foreleg_L
            property: "position"
            keyframeSource: "animations/foreleg_L_position_4.qad"
        }
        KeyframeGroup {
            target: paw_front_L
            property: "position"
            keyframeSource: "animations/paw_front_L_position_4.qad"
        }
        KeyframeGroup {
            target: paw_front_L
            property: "rotation"
            keyframeSource: "animations/paw_front_L_rotation_4.qad"
        }
        KeyframeGroup {
            target: shoulder_R
            property: "position"
            keyframeSource: "animations/shoulder_R_position_4.qad"
        }
        KeyframeGroup {
            target: shoulder_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.341886, -0.658114, -0.474342, -0.474342)
            }
        }
        KeyframeGroup {
            target: arm_R
            property: "position"
            keyframeSource: "animations/arm_R_position_4.qad"
        }
        KeyframeGroup {
            target: arm_R
            property: "rotation"
            keyframeSource: "animations/arm_R_rotation_4.qad"
        }
        KeyframeGroup {
            target: foreleg_R
            property: "position"
            keyframeSource: "animations/foreleg_R_position_4.qad"
        }
        KeyframeGroup {
            target: paw_front_R
            property: "position"
            keyframeSource: "animations/paw_front_R_position_4.qad"
        }
        KeyframeGroup {
            target: paw_front_R
            property: "rotation"
            keyframeSource: "animations/paw_front_R_rotation_4.qad"
        }
        KeyframeGroup {
            target: tail_01
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-5.1279e-09, 0.16, 0.1)
            }
        }
        KeyframeGroup {
            target: tail_01
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.710926, -0.0297534, -0.479504, -0.513591)
            }
        }
        KeyframeGroup {
            target: tail_02
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.50902e-08, 0.185742, 1.66469e-09)
            }
        }
        KeyframeGroup {
            target: tail_02
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.913316, -0.150836, 0.101846, 0.36432)
            }
        }
        KeyframeGroup {
            target: tail_03
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-3.17095e-08, 0.216795, 9.95605e-08)
            }
        }
        KeyframeGroup {
            target: tail_03
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.940194, -0.0411286, 0.157529, 0.299212)
            }
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
            target: hindleg_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(0.12, 0.08, 9.24125e-10)
            }
        }
        KeyframeGroup {
            target: hindleg_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.384228, 0.890822, 0.191951, 0.14819)
            }
        }
        KeyframeGroup {
            target: paw_back_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(3.57213e-09, 0.161245, 4.65073e-08)
            }
        }
        KeyframeGroup {
            target: hindleg_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-0.12, 0.08, 9.24125e-10)
            }
        }
        KeyframeGroup {
            target: hindleg_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.384228, 0.890822, -0.191951, -0.14819)
            }
        }
        KeyframeGroup {
            target: paw_back_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-3.57213e-09, 0.161245, 4.65073e-08)
            }
        }
        KeyframeGroup {
            target: toe_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.80856e-08, 0.127581, -0.011094)
            }
        }
        KeyframeGroup {
            target: toe_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.957092, 0.289784, -2.97714e-07, 8.19284e-08)
            }
        }
        KeyframeGroup {
            target: toe_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-1.80856e-08, 0.127581, -0.011094)
            }
        }
        KeyframeGroup {
            target: toe_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.957092, 0.289784, 2.97714e-07, -8.19284e-08)
            }
        }
        KeyframeGroup {
            target: spine
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(0, 0.08, -0.14)
            }
        }
        KeyframeGroup {
            target: spine
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.865324, 0.501213, 0, 0)
            }
        }
        KeyframeGroup {
            target: chest
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(0, 0.2, -7.45058e-09)
            }
        }
        KeyframeGroup {
            target: head
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(0, 0.08, 1.49012e-08)
            }
        }
        KeyframeGroup {
            target: head
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.952334, -0.305059, 0, 0)
            }
        }
        KeyframeGroup {
            target: ear_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-0.21, 0.29, -3.88898e-08)
            }
        }
        KeyframeGroup {
            target: ear_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(0.21, 0.29, -3.88898e-08)
            }
        }
        KeyframeGroup {
            target: shoulder_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-0.13, 0.12, -3.47522e-08)
            }
        }
        KeyframeGroup {
            target: shoulder_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.341886, -0.658114, 0.474342, 0.474342)
            }
        }
        KeyframeGroup {
            target: arm_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(2.07691e-08, 0.0948684, -1.44602e-09)
            }
        }
        KeyframeGroup {
            target: foreleg_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(9.80426e-09, 0.150748, 8.99578e-09)
            }
        }
        KeyframeGroup {
            target: paw_front_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-1.50129e-08, 0.12, -2.41663e-08)
            }
        }
        KeyframeGroup {
            target: shoulder_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(0.13, 0.12, -3.47522e-08)
            }
        }
        KeyframeGroup {
            target: shoulder_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.341886, -0.658114, -0.474342, -0.474342)
            }
        }
        KeyframeGroup {
            target: arm_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-2.07691e-08, 0.0948684, -1.44602e-09)
            }
        }
        KeyframeGroup {
            target: foreleg_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-9.80426e-09, 0.150748, 8.99578e-09)
            }
        }
        KeyframeGroup {
            target: paw_front_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.50129e-08, 0.12, -2.41663e-08)
            }
        }
        KeyframeGroup {
            target: tail_01
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-5.1279e-09, 0.16, 0.1)
            }
        }
        KeyframeGroup {
            target: tail_01
            property: "rotation"
            keyframeSource: "animations/tail_01_rotation_5.qad"
        }
        KeyframeGroup {
            target: tail_02
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.50902e-08, 0.185742, 1.66469e-09)
            }
        }
        KeyframeGroup {
            target: tail_02
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.913316, -0.150836, 0.101846, 0.36432)
            }
        }
        KeyframeGroup {
            target: tail_03
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-3.17095e-08, 0.216795, 9.95605e-08)
            }
        }
        KeyframeGroup {
            target: tail_03
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.940194, -0.0411286, 0.157529, 0.299212)
            }
        }
    }
    Timeline {
        id: walk_timeline
        objectName: "Walk"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 834
        currentFrame: 0
        enabled: node.activeAnimation === "Walk"
        animations: TimelineAnimation { duration: 834; from: 0; to: 834; running: walk_timeline.enabled; loops: Animation.Infinite }
        KeyframeGroup {
            target: hindleg_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(0.12, 0.08, 9.24125e-10)
            }
        }
        KeyframeGroup {
            target: hindleg_R
            property: "rotation"
            keyframeSource: "animations/hindleg_R_rotation_6.qad"
        }
        KeyframeGroup {
            target: paw_back_R
            property: "position"
            keyframeSource: "animations/paw_back_R_position_6.qad"
        }
        KeyframeGroup {
            target: hindleg_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-0.12, 0.08, 9.24125e-10)
            }
        }
        KeyframeGroup {
            target: hindleg_L
            property: "rotation"
            keyframeSource: "animations/hindleg_L_rotation_6.qad"
        }
        KeyframeGroup {
            target: paw_back_L
            property: "position"
            keyframeSource: "animations/paw_back_L_position_6.qad"
        }
        KeyframeGroup {
            target: toe_L
            property: "position"
            keyframeSource: "animations/toe_L_position_6.qad"
        }
        KeyframeGroup {
            target: toe_L
            property: "rotation"
            keyframeSource: "animations/toe_L_rotation_6.qad"
        }
        KeyframeGroup {
            target: toe_R
            property: "position"
            keyframeSource: "animations/toe_R_position_6.qad"
        }
        KeyframeGroup {
            target: toe_R
            property: "rotation"
            keyframeSource: "animations/toe_R_rotation_6.qad"
        }
        KeyframeGroup {
            target: spine
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(0, 0.08, 0.018)
            }
        }
        KeyframeGroup {
            target: ear_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-0.21, 0.29, -2.17476e-09)
            }
        }
        KeyframeGroup {
            target: ear_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(0.21, 0.29, -2.17476e-09)
            }
        }
        KeyframeGroup {
            target: shoulder_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-0.13, 0.12, -2.50334e-09)
            }
        }
        KeyframeGroup {
            target: shoulder_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.341886, -0.658114, 0.474342, 0.474342)
            }
        }
        KeyframeGroup {
            target: arm_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-1.27291e-08, 0.0948683, 6.05492e-08)
            }
        }
        KeyframeGroup {
            target: arm_L
            property: "rotation"
            keyframeSource: "animations/arm_L_rotation_6.qad"
        }
        KeyframeGroup {
            target: foreleg_L
            property: "position"
            keyframeSource: "animations/foreleg_L_position_6.qad"
        }
        KeyframeGroup {
            target: paw_front_L
            property: "position"
            keyframeSource: "animations/paw_front_L_position_6.qad"
        }
        KeyframeGroup {
            target: paw_front_L
            property: "rotation"
            keyframeSource: "animations/paw_front_L_rotation_6.qad"
        }
        KeyframeGroup {
            target: shoulder_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(0.13, 0.12, -2.50334e-09)
            }
        }
        KeyframeGroup {
            target: shoulder_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.341886, -0.658114, -0.474342, -0.474342)
            }
        }
        KeyframeGroup {
            target: arm_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.27291e-08, 0.0948683, 6.05492e-08)
            }
        }
        KeyframeGroup {
            target: arm_R
            property: "rotation"
            keyframeSource: "animations/arm_R_rotation_6.qad"
        }
        KeyframeGroup {
            target: foreleg_R
            property: "position"
            keyframeSource: "animations/foreleg_R_position_6.qad"
        }
        KeyframeGroup {
            target: paw_front_R
            property: "position"
            keyframeSource: "animations/paw_front_R_position_6.qad"
        }
        KeyframeGroup {
            target: paw_front_R
            property: "rotation"
            keyframeSource: "animations/paw_front_R_rotation_6.qad"
        }
        KeyframeGroup {
            target: tail_01
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-5.1279e-09, 0.16, 0.1)
            }
        }
        KeyframeGroup {
            target: tail_01
            property: "rotation"
            keyframeSource: "animations/tail_01_rotation_6.qad"
        }
        KeyframeGroup {
            target: tail_02
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.50902e-08, 0.185742, 1.66469e-09)
            }
        }
        KeyframeGroup {
            target: tail_02
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.913316, -0.150836, 0.101846, 0.36432)
            }
        }
        KeyframeGroup {
            target: tail_03
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-3.17095e-08, 0.216795, 9.95605e-08)
            }
        }
        KeyframeGroup {
            target: tail_03
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.940194, -0.0411286, 0.157529, 0.299212)
            }
        }
    }
    Timeline {
        id: working_timeline
        objectName: "Working"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 2534
        currentFrame: 0
        enabled: node.activeAnimation === "Working"
        animations: TimelineAnimation { duration: 2534; from: 0; to: 2534; running: working_timeline.enabled; loops: Animation.Infinite }
        KeyframeGroup {
            target: hindleg_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(0.12, 0.08, 9.24125e-10)
            }
        }
        KeyframeGroup {
            target: hindleg_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.00386106, -0.996139, -0.0620177, -0.0620174)
            }
        }
        KeyframeGroup {
            target: paw_back_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.14059e-08, 0.161245, 2.52454e-08)
            }
        }
        KeyframeGroup {
            target: hindleg_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-0.12, 0.08, 9.24125e-10)
            }
        }
        KeyframeGroup {
            target: hindleg_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.00386106, -0.996139, 0.0620177, 0.0620174)
            }
        }
        KeyframeGroup {
            target: paw_back_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-1.14059e-08, 0.161245, 2.52454e-08)
            }
        }
        KeyframeGroup {
            target: toe_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-5.19714e-09, 0.127581, -0.011094)
            }
        }
        KeyframeGroup {
            target: toe_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(5.19714e-09, 0.127581, -0.011094)
            }
        }
        KeyframeGroup {
            target: spine
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.998201, -0.059964, 0, 0)
            }
        }
        KeyframeGroup {
            target: chest
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(0, 0.2, 5.58794e-09)
            }
        }
        KeyframeGroup {
            target: head
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(0, 0.08, -3.72529e-09)
            }
        }
        KeyframeGroup {
            target: head
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.9992, 0.0399893, 0, 0)
            }
        }
        KeyframeGroup {
            target: ear_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-0.21, 0.29, 9.97831e-09)
            }
        }
        KeyframeGroup {
            target: ear_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(0.21, 0.29, 9.97831e-09)
            }
        }
        KeyframeGroup {
            target: shoulder_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-0.13, 0.12, -4.71217e-09)
            }
        }
        KeyframeGroup {
            target: shoulder_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.341886, -0.658114, 0.474342, 0.474342)
            }
        }
        KeyframeGroup {
            target: arm_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-3.8996e-09, 0.0948684, -4.85422e-08)
            }
        }
        KeyframeGroup {
            target: arm_L
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.776021, -0.0966749, 0.296795, -0.548049)
            }
        }
        KeyframeGroup {
            target: foreleg_L
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(2.80385e-08, 0.150748, 2.0546e-08)
            }
        }
        KeyframeGroup {
            target: foreleg_L
            property: "rotation"
            keyframeSource: "animations/foreleg_L_rotation_7.qad"
        }
        KeyframeGroup {
            target: paw_front_L
            property: "position"
            keyframeSource: "animations/paw_front_L_position_7.qad"
        }
        KeyframeGroup {
            target: paw_front_L
            property: "rotation"
            keyframeSource: "animations/paw_front_L_rotation_7.qad"
        }
        KeyframeGroup {
            target: shoulder_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(0.13, 0.12, -4.71217e-09)
            }
        }
        KeyframeGroup {
            target: shoulder_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.341886, -0.658114, -0.474342, -0.474342)
            }
        }
        KeyframeGroup {
            target: arm_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(3.8996e-09, 0.0948684, -4.85422e-08)
            }
        }
        KeyframeGroup {
            target: arm_R
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.765012, -0.162208, -0.342251, 0.520873)
            }
        }
        KeyframeGroup {
            target: foreleg_R
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(5.59923e-09, 0.150748, -3.13123e-08)
            }
        }
        KeyframeGroup {
            target: foreleg_R
            property: "rotation"
            keyframeSource: "animations/foreleg_R_rotation_7.qad"
        }
        KeyframeGroup {
            target: paw_front_R
            property: "position"
            keyframeSource: "animations/paw_front_R_position_7.qad"
        }
        KeyframeGroup {
            target: paw_front_R
            property: "rotation"
            keyframeSource: "animations/paw_front_R_rotation_7.qad"
        }
        KeyframeGroup {
            target: tail_01
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-5.1279e-09, 0.16, 0.1)
            }
        }
        KeyframeGroup {
            target: tail_01
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.710926, -0.0297534, -0.479504, -0.513591)
            }
        }
        KeyframeGroup {
            target: tail_02
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(1.50902e-08, 0.185742, 1.66469e-09)
            }
        }
        KeyframeGroup {
            target: tail_02
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.913316, -0.150836, 0.101846, 0.36432)
            }
        }
        KeyframeGroup {
            target: tail_03
            property: "position"
            Keyframe {
                frame: 33.3333
                value: Qt.vector3d(-3.17095e-08, 0.216795, 9.95605e-08)
            }
        }
        KeyframeGroup {
            target: tail_03
            property: "rotation"
            Keyframe {
                frame: 33.3333
                value: Qt.quaternion(0.940194, -0.0411286, 0.157529, 0.299212)
            }
        }
    }

    // An exported mapping of Timelines (--manualAnimations)
    property var timelineMap: {
        "Angry": angry_timeline,
        "Celebrate": celebrate_timeline,
        "Dead": dead_timeline,
        "Idle": idle_timeline,
        "Jump": jump_timeline,
        "Sleep": sleep_timeline,
        "Walk": walk_timeline,
        "Working": working_timeline,
    }
    // A simple list of Timelines (--manualAnimations)
    property var timelineList: [
        angry_timeline,
        celebrate_timeline,
        dead_timeline,
        idle_timeline,
        jump_timeline,
        sleep_timeline,
        walk_timeline,
        working_timeline,
    ]
}
