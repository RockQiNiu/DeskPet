# 3D to 2D Sprite migration audit

Date: 2026-09-02

## Scope and conclusion

The application business layer is independent of the renderer. Quick3D is only used by the former QML pet presentation and its generated resources. It is safe to remove without rewriting monitors, event delivery, state transitions, window interaction, or test injection.

## Runtime 3D inventory

| Path | Reference / purpose | Action | Business coupling |
| --- | --- | --- | --- |
| `CMakeLists.txt` | `Qt6::Quick3D`, Quick3D package and generated QML resource globs | Remove | None |
| `qml/Pet.qml` | `View3D`, camera, lights, model, materials, rig animations | Replace with `Image`-based sprite presentation | None |
| `qml/assets/cat/generated3d/` | Generated cat mesh, maps and `.qad` animation data | Remove | None |
| `qml/assets/tiger/generated3d/` | Generated tiger mesh, maps and skeleton animation data | Remove | None |
| `qml/assets/mage6/generated3d/` | Generated Mage6 mesh and texture | Remove | None |
| `assets/pets/cat/*.glb` | Former 3D runtime models | Remove | None |
| `assets/pets/mage6.glb` | Former 3D runtime model | Remove | None |
| `assets/pets/cat/generated3d/` | Duplicate generated 3D source assets | Remove | None |

## Retained source archive

`assets/pets/source.zip` contains `Mage6.blend` and is not a runtime dependency. It is moved to `assets/pets/mage2d/source/legacy_mage6_blender_source.zip` as an archive. It is not loaded or packaged by the application.

## Retained core modules

The following remain unchanged in responsibility: `SystemMonitor`, `ActivityMonitor`, `BuildMonitor`, `ProcessMonitor`, `EventBus`, `PetController`, `PetStateMachine`, desktop movement, Windows interaction, dialogue handling, settings, and developer/test controls. They communicate state and events only; no Quick3D API is used by them.

## 2D replacement

`SpriteAnimationController` resolves a `PetState` name to a PNG sequence name and emits a current frame URL. `Pet.qml` renders the formal RGBA character frames using `QtQuick.Image`, with bottom-centre foot anchoring and horizontal mirroring. The official animation set is `idle`, `walk`, `run`, `jump`, `sit`, `wave`, `sleep`, `celebrate`, `dead`, `angry`, and `happy`.
