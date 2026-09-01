add_executable(ProgrammerPetTests
    EventBusTest.cpp
    ../src/core/EventBus.h
    ../src/dialogue/DialogueManager.cpp
    ../src/dialogue/DialogueManager.h
)
target_link_libraries(ProgrammerPetTests PRIVATE Qt6::Core Qt6::Test)
target_include_directories(ProgrammerPetTests PRIVATE ../src)
add_test(NAME ProgrammerPetTests COMMAND ProgrammerPetTests)
