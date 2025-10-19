
### Dart 学习路线图

这条路线分为六个阶段，旨在帮助你系统地掌握 Dart 语言，并为使用 Flutter 等框架构建应用打下坚实的基础。

#### 阶段一：入门准备 (0-1 周)

本阶段的目标是搭建开发环境，理解 Dart 的基本概念，并运行你的第一个程序。



3.  **"Hello, World!"**
    * 创建你的第一个 `.dart` 文件。
    * 学习 `void main() { ... }` 主入口函数。
    * 使用 `print()` 函数输出信息。
    * 学习如何通过命令行运行程序：`dart run your_file.dart`。

#### 阶段二：核心基础 (1-3 周)

本阶段深入学习 Dart 的基本语法和编程结构，这是构建一切应用的基础。

1.  **变量与数据类型**
    * **变量声明：** `var` (类型推断), `final` (运行时常量), `const` (编译时常量)。
    * **内置数据类型：**
        * `int`, `double` (统称 `num`)
        * `String` (字符串，学习插值 `$variable` 和 `${expression}`)
        * `bool` (布尔值)
        * `List` (列表/数组)
        * `Set` (集合)
        * `Map` (键值对)
    * **`dynamic` 类型：** 了解其作用和应避免使用的情况。

2.  **运算符 (Operators)**
    * 算术运算符：`+`, `-`, `*`, `/`, `~/` (整除), `%` (取模)。
    * 关系和相等运算符：`==`, `!=`, `>`, `<`, `>=`, `<=`.
    * 逻辑运算符：`!`, `&&`, `||`.
    * **空感知运算符 (重点)：**
        * `?.` (条件成员访问)
        * `??` (null 合并运算符)
        * `??=` (null 赋值运算符)
    * 级联运算符：`..` (用于链式调用)。
    * 类型测试运算符：`is`, `is!`.

3.  **流程控制语句**
    * 条件语句：`if`, `else`, `else if`.
    * `switch`, `case` (Dart 的 switch 支持字符串和对象)。
    * 循环语句：
        * `for` 循环
        * `for...in` 循环 (遍历集合)
        * `while` 和 `do...while` 循环
    * `break` 和 `continue`.

4.  **函数 (Functions)**
    * **函数定义：** 返回类型、函数名、参数列表。
    * **参数类型 (重点)：**
        * 必需的位置参数。
        * 可选的命名参数：`{String? name}`
        * 可选的位置参数：`[String? name]`
        * 使用 `required` 关键字标记必需的命名参数。
        * 参数的默认值。
    * **箭头函数：** `=>` 缩写语法。
    * **匿名函数 (Lambda / 闭包)：** 学习如何将函数作为参数传递。
    * **词法作用域：** 了解变量在何处可见。

#### 阶段三：面向对象编程 (OOP) (3-5 周)

Dart 是一门真正的面向对象语言。本阶段是学习 Dart 的重中之重。

1.  **类与对象 (Classes & Objects)**
    * 使用 `class` 关键字定义类。
    * 属性 (Fields) 和 方法 (Methods)。
    * 创建实例 (对象)。

2.  **构造函数 (Constructors)**
    * 默认构造函数。
    * **命名构造函数：** `ClassName.fromJSON(...)`.
    * **工厂构造函数：** `factory` (例如实现单例模式)。
    * **常量构造函数：** `const` (用于创建编译时常量对象)。
    * 初始化列表 (`:`).

3.  **核心 OOP 概念**
    * **封装 (Encapsulation)：**
        * Dart 没有 `public`, `private` 关键字。
        * 使用下划线 `_` 前缀来标记库私有的属性或方法。
        * Getters 和 Setters (`get`, `set`).
    * **继承 (Inheritance)：**
        * 使用 `extends` 关键字。
        * `super` 关键字 (调用父类构造函数和方法)。
        * 方法重写 (`@override` 注解)。
    * **抽象 (Abstraction)：**
        * `abstract class` (抽象类)。
        * 抽象方法 (没有方法体的方法)。
    * **接口 (Interfaces)：**
        * Dart 没有 `interface` 关键字。
        * 所有类都隐式定义了一个接口。
        * 使用 `implements` 关键字实现一个或多个接口（必须重写所有方法）。

4.  **Dart 特色 OOP**
    * **Mixins (混入) (重点)：**
        * 理解 `mixin` 的概念 (代码复用)。
        * 使用 `with` 关键字。
        * 使用 `on` 关键字限制 Mixin 的使用范围。
    * **枚举 (Enums)：** `enum` (学习 Dart 2.17+ 的增强型枚举)。
    * **扩展方法 (Extension Methods)：** 为现有类（甚至是你无法控制的类）添加新功能。

#### 阶段四：进阶主题 (5-7 周)

掌握这些高级主题，你才能真正高效地使用 Dart，尤其是进行 Flutter 开发。

1.  **空安全 (Sound Null Safety) (极其重要)**
    * **核心概念：** 默认情况下，所有变量都不可为 null。
    * **可空类型：** `String?` (表示 `String` 或 `null`)。
    * **空断言：** `!` (告诉编译器 "我确定这个值不为 null")。
    * **`late` 关键字：** 用于延迟初始化非空变量。
    * **类型提升：** 在 `if (variable != null)` 检查后，`variable` 会自动从 `String?` 提升为 `String`。

2.  **异步编程 (Asynchronous Programming) (极其重要)**
    * **为什么需要异步？** (避免 UI 阻塞，处理 I/O)。
    * **`Future`：**
        * 表示一个未来的值或错误。
        * 使用 `.then()` 和 `.catchError()` 处理结果。
    * **`async` / `await` (重点)：**
        * 使用 `async` 标记异步函数。
        * 使用 `await` "等待" `Future` 完成，使异步代码看起来像同步代码。
    * **`Stream`：**
        * 表示一系列异步事件（数据流）。
        * 使用 `await for` 循环来消费 Stream。
        * `async*` 和 `yield` (用于创建 Stream)。
    * **Isolates：** 了解 Dart 的并发模型（基于 `Isolate`，而不是共享内存的线程）。

3.  **泛型 (Generics)**
    * 为什么需要泛型 (类型安全)。
    * 如何使用泛型：`List<int>`, `Map<String, dynamic>`.
    * 如何定义泛型类：`class Cache<T> { ... }`.
    * 如何定义泛型方法。

4.  **错误与异常 (Errors & Exceptions)**
    * `Exception` vs `Error`.
    * `throw` (抛出异常)。
    * `try` / `catch` / `on` / `finally` (捕获异常)。
    * `rethrow` (重新抛出异常)。

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

2.  **算法练习**
    * 使用 Dart 在 LeetCode 或 Codewars 等平台上解决算法问题，以巩S固语法和集合操作。

3.  **下一步：进入 Flutter**
    * 如果你学习 Dart 的目的是为了移动开发，那么现在是最佳时机。
    * 你已经掌握了 Flutter 框架所依赖的所有核心概念（OOP、空安全、异步编程、包管理）。
    * 开始学习 Flutter 的 Widget、状态管理 (State Management) 等。

---

### 推荐学习资源

* **官方文档 (最权威)：**
    * **Dart 官网：** [dart.dev](https://dart.dev/)
    * **官方文档 (A Tour of the Dart Language)：** [dart.dev/guides/language/language-tour](https://dart.dev/guides/language/language-tour) (必读！)
    * **Effective Dart (代码规范)：** [dart.dev/guides/language/effective-dart](https://dart.dev/guides/language/effective-dart)
* **在线练习：**
    * **DartPad：** [dartpad.dev](https://dartpad.dev/)
* **中文社区与教程：**
    * **Dart 中文网：** [dart.cn](https://dart.cn/)
    * **Flutter 中文网：** [flutter.cn](https://flutter.cn/) (其 Dart 教程也非常棒)

祝你学习顺利！Dart 是一门设计精良且功能强大的语言，掌握它将为你打开应用开发的新大门。