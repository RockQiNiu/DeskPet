# Changelog

## Unreleased

- 修复 `PetController.cpp` 缺少 `<QHash>` 完整定义导致的 MSVC 编译错误。
- 增加 Qt 系统托盘，统一承载显示/隐藏、状态演示、移动和退出菜单。

## 0.1.0 - 2026-08-31

- 阶段 01：透明、无边框、置顶桌面宠物窗口，支持拖动、右键菜单和退出。
- 阶段 02：引入 C++ PetStateMachine 与 PetEvent，QML 根据状态显示并播放 Idle 动画。
- 阶段 03：引入 DesktopMovementController，按屏幕可用区域随机选择目标位置。
