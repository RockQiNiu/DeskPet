#pragma once
enum class PetEventType { IdleTimeout, UserCoding, UserInactive, BuildStarted, BuildSuccess, BuildFailed,
                      HighCpu, CpuNormal, GitCommit, LateNight, ProgramStarted, ProgramCrash,
                      MouseApproaching, MouseLeaving, UserDraggingPet, JumpRequested, WaveRequested,
                      PerchRequested, WindowDragRequested };
