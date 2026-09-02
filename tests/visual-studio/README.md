# DeskPet Visual Studio trigger projects

Open `PetTriggerProjects.sln` in Visual Studio and select `x64`.

- **BuildFailureTrigger**: select `FailBuild | x64`, then Build Solution. The compile error is deliberate and should make DeskPet emit `BuildFailed`. Select Debug or Release for a successful build.
- **CpuStressTrigger**: run the project. It saturates all logical CPU cores for 30 seconds (or pass a duration in seconds as the first argument). DeskPet should enter Smoking after its configured threshold is sustained.
- **CrashTrigger**: run it with either `F5` or `Ctrl+F5`. It terminates itself after two seconds with the abnormal exit code `0xE000DEAD`, which is intended for the observed-process crash test.

These projects have no Qt dependency and do not participate in CTest.
