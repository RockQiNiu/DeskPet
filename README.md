# DeskPet

Windows 桌面宠物：透明置顶窗口中的 2D 牛来角色。项目使用 Qt Quick/QML 渲染，C++ 负责状态机、窗口/系统事件监测与动作触发。

## 功能

- 108 张 512×512 透明 PNG 动画帧：待机、走路、跑步、跳跃、坐下、挥手、睡觉、庆祝、倒地、生气、开心。
- 鼠标移动追逐、点击躲避、空闲时自主走动/跳跃，以及左键拖动宠物。
- 非最大化窗口会成为虚拟地面；宠物位于当前窗口顶部。Visual Studio、Qt Creator、VS Code 前台编辑时，宠物保持原地 walk 循环。
- 自动响应编译开始/成功/失败、CPU 达到 80%、凌晨 1 点后的持续编程和受监测进程崩溃。
- 对应事件显示中文气泡并播放打包在 `assets/audio/` 中的 MP3；连续 1～5 次编译失败使用不同台词，崩溃播放 `mama.mp3`。
- 系统托盘菜单可显示/隐藏宠物和手动演示部分状态；按 `F12` 打开开发演示面板。

## 编译环境

已在以下 Windows 环境验证：

- Qt 6.9.3，`msvc2022_64` 套件（包含 Quick、Widgets、Svg、Multimedia、Test）
- Visual Studio Community 2026 / MSVC x64 工具链（兼容 Qt 的 MSVC 2022 ABI）
- CMake 3.30.5、Ninja
- Windows 10/11 SDK 10.0.26100.0

请从 **x64 Native Tools Command Prompt for Visual Studio** 或 Qt Creator 配置好的 MSVC Kit 执行：

```powershell
cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Debug -DCMAKE_PREFIX_PATH="C:/opt/Qt/6.9.3/msvc2022_64"
cmake --build build --parallel
ctest --test-dir build --output-on-failure
```

Qt 安装目录不同则替换 `CMAKE_PREFIX_PATH`。若在普通终端运行程序，先把 Qt 的 `bin` 目录加入 `PATH`：

```powershell
$env:PATH = "C:\opt\Qt\6.9.3\msvc2022_64\bin;$env:PATH"
.\build\DeskPet.exe
```

## 资源

- 精灵帧：`assets/pets/mage2d/<action>/`
- 音频：`assets/audio/`
- 音频和精灵帧由 CMake 自动纳入 Qt 资源，发布时不依赖其源文件路径。
