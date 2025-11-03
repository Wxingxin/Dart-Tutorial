
#### 阶段四：进阶主题 (5-7 周)

掌握这些高级主题，你才能真正高效地使用 Dart，尤其是进行 Flutter 开发。

1.  **空安全 (Sound Null Safety) (极其重要)**
    * **核心概念：** 默认情况下，所有变量都不可为 null。
    * **可空类型：** `String?` (表示 `String` 或 `null`)。
    * **空断言：** `!` (告诉编译器 "我确定这个值不为 null")。
    * **`late` 关键字：** 用于延迟初始化非空变量。
    * **类型提升：** 在 `if (variable != null)` 检查后，`variable` 会自动从 `String?` 提升为 `String`。


3.  **泛型 (Generics)**
    * 为什么需要泛型 (类型安全)。
    * 如何使用泛型：`List<int>`, `Map<String, dynamic>`.
    * 如何定义泛型类：`class Cache<T> { ... }`.
    * 如何定义泛型方法。



#### 阶段五：包管理与生态 (7-8 周)

“不要重复造轮子”。本阶段学习如何使用和管理 Dart 生态中的工具和库。

1.  **Dart 包管理器 (Pub)**
    * **`pub.dev`：** Dart/Flutter 的官方包仓库。
    * **`pubspec.yaml` 文件：**
        * 管理项目元数据（名称、描述、版本）。
        * 管理 `dependencies` (项目依赖)。
        * 管理 `dev_dependencies` (开发环境依赖，如测试工具)。
    * **常用命令：**
        * `dart pub get` (获取/更新依赖)。
        * `dart pub add <package>` (添加依赖)。

2.  **库 (Libraries)**
    * **`import`：** 导入库。
    * **`export`：** 导出一个库的部分或全部内容。
    * **`part` / `part of`：** 将一个库拆分为多个文件（现在不常用，但需要了解）。
    * **库前缀：** `import '...' as http;` (避免命名冲突)。
    * **显示/隐藏：** `import '...' show SomeClass;` 或 `hide OtherClass;`.

3.  **核心库 (Core Libraries)**
    * **`dart:core`：** 自动导入 (包含 String, int, List, Map 等)。
    * **`dart:math`：** 数学函数 (`Random`, `pi`, `sin`).
    * **`dart:io`：** I/O 操作 (File, Directory, HttpClient)。
    * **`dart:async`：** (Future, Stream).
    * **`dart:convert`：** 数据转换 (JSON 编码/解码 `jsonEncode`, `jsonDecode`).

4.  **测试 (Testing)**
    * 学习使用 `package:test` 编写单元测试。
    * `test()` 和 `group()` 函数。
    * `expect()` (断言)。

5.  **代码规范 (Linting)**
    * 了解 Effective Dart 风格指南。
    * 配置 `analysis_options.yaml` 文件，使用 `linter` 规则来统一代码风格。

#### 阶段六：实践与下一步 (8 周+)

学习的最终目的是应用。

1.  **构建小型项目**
    * **命令行工具：** 例如一个待办事项 (To-Do List) 管理器，或一个文件处理器。
    * **简单的服务器：** 使用 `dart:io` 或 `package:shelf` / `package:dart_frog` 搭建一个简单的 Web 服务器。
