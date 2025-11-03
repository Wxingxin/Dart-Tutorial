# 💯💯💯 
| 阶段 | 学习内容                   | 目标        |
| -- | ---------------------- | --------- |
| ①  | 函数基础、参数、箭头函数           | 掌握函数定义与调用 |
| ②  | 匿名函数、闭包、函数作为对象         | 理解函数式特性   |
| ③  | async / await / Future | 异步逻辑写出流畅  |
| ④  | Stream、Isolate         | 掌握数据流与并发  |
| ⑤  | 泛型                     | 写出类型安全的代码 |
| ⑥  | 异常处理                   | 让程序更健壮    |




1. **函数 (Functions)**
    * **函数定义：** 返回类型、函数名、参数列表。
    * **参数类型 (重点)：**
        * 必需的位置参数。
        * 可选的命名参数：`{String? name}`
        * 可选的位置参数：`[String? name]`
        * 使用 `required` 关键字标记必需的命名参数。
        * 参数的默认值。
    * **箭头函数：** `=>` 缩写语法。
    * **匿名函数 (Lambda / 闭包)：** 学习如何将函数作为参数传递。
    闭包
    函数作为对象
    * **词法作用域：** 了解变量在何处可见。

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
