@echo off
setlocal

rem Start Qt Creator from the Visual Studio x64 developer environment.
rem This makes the MSVC C++ standard library (for example <type_traits>) and
rem Windows SDK headers available to CMake/Ninja builds.
call "C:\Program Files\Microsoft Visual Studio\18\Community\Common7\Tools\VsDevCmd.bat" -arch=x64 -host_arch=x64
if errorlevel 1 (
    echo Failed to initialize the Visual Studio x64 developer environment.
    pause
    exit /b 1
)

start "Qt Creator" "C:\Qt\Tools\QtCreator\bin\qtcreator.exe" "C:\Users\leidi\Documents\src\DeskPet\CMakeLists.txt"
