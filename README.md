# DeskPet

第一轮版本（阶段 01-03）：Qt 6 + Qt Quick/QML 的透明桌面宠物窗口、C++ 状态机和桌面随机移动。

宠物外观使用 SVG：默认资源为 `assets/pets/cat/cat.svg`，替换同名文件即可更新角色。进入 Walking/Running 状态时，QML 会让两条腿交替摆动。

所有菜单均位于系统托盘图标：可显示/隐藏宠物、切换演示状态、随机移动和退出程序。托盘图标复用当前宠物 SVG；宠物窗口本身不再提供右键菜单。

## 编译

```powershell
cmake -S . -B build -DCMAKE_PREFIX_PATH="C:/Qt/6.x.x/msvc2022_64"
cmake --build build --config Release
```

## 运行

```powershell
build/Release/DeskPet.exe
```

左键拖动宠物；右键打开菜单。当前状态机可通过代码触发，演示界面每 7 秒请求一次随机移动。
