cmake_minimum_required(VERSION 3.21)
project(DeskPet VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick Widgets Svg Test Multimedia)
qt_policy(SET QTP0001 NEW)
qt_policy(SET QTP0004 NEW)

qt_add_executable(DeskPet
    src/main.cpp
    src/app/ApplicationController.cpp
    src/app/ApplicationController.h
    src/pet/PetController.cpp
    src/pet/PetController.h
    src/pet/PetState.h
    src/pet/PetEvent.h
    src/pet/PetStateMachine.cpp
    src/pet/PetStateMachine.h
    src/pet/rendering/SpriteAnimationController.cpp
    src/pet/rendering/SpriteAnimationController.h
    src/interaction/DesktopMovementController.cpp
    src/interaction/DesktopMovementController.h
    src/core/EventBus.h
    src/dialogue/DialogueManager.cpp
    src/dialogue/DialogueManager.h
    src/platform/ISystemProvider.h
    src/platform/windows/WindowsSystemProvider.h
    src/platform/windows/WindowsSystemProvider.cpp
    src/monitor/SystemMonitor.h
    src/monitor/SystemMonitor.cpp
    src/monitor/ActivityMonitor.h
    src/monitor/ActivityMonitor.cpp
    src/monitor/BuildMonitor.h
    src/monitor/BuildMonitor.cpp
    src/monitor/ProcessMonitor.h
    src/monitor/ProcessMonitor.cpp
)

file(GLOB_RECURSE PET_RESOURCES CONFIGURE_DEPENDS
    RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
    "${CMAKE_CURRENT_SOURCE_DIR}/assets/pets/mage2d/*.png"
    "${CMAKE_CURRENT_SOURCE_DIR}/assets/audio/*.mp3")

qt_add_qml_module(DeskPet URI DeskPet VERSION 1.0
    # Complex generated Quick3D rig QML is more stable interpreted than AOT
    # compiled on Qt 6.9.3/MSVC. This avoids Qt6Qmld access violations.
    NO_CACHEGEN
    QML_FILES
        qml/Main.qml
        qml/Pet.qml
        qml/SpeechBubble.qml
    RESOURCES
        ${PET_RESOURCES}
)

target_link_libraries(DeskPet PRIVATE Qt6::Quick Qt6::Widgets Qt6::Svg Qt6::Multimedia)
target_include_directories(DeskPet PRIVATE src)
enable_testing()
add_subdirectory(tests)

if (WIN32)
    set_target_properties(DeskPet PROPERTIES WIN32_EXECUTABLE TRUE)
    # The Windows SDK UCRT library is required by the Quick 3D Debug build.
    target_link_directories(DeskPet PRIVATE
        "C:/Program Files (x86)/Windows Kits/10/Lib/10.0.26100.0/ucrt/x64"
        "C:/Program Files (x86)/Windows Kits/10/Lib/10.0.26100.0/um/x64")
endif()
