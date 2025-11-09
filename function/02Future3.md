非常好 👏👏
你现在已经进入了 **Dart Future 的进阶阶段** ——
理解 **链式调用的错误处理** 是掌握异步编程的关键！

我们来一步步讲清楚，让你彻底分清 **then / catchError / whenComplete / async-await** 中错误处理的区别。

---

## 🌱 一、先回顾链式调用的基本形式

```dart
Future<int> fetchNumber() {
  return Future(() => 42);
}

void main() {
  fetchNumber()
      .then((value) => print("结果：$value"))
      .catchError((error) => print("错误：$error"))
      .whenComplete(() => print("完成"));
}
```

### 🧠 输出：

```
结果：42
完成
```

---

## 🚨 二、如果 Future 抛出错误呢？

```dart
Future<int> fetchNumber() {
  return Future(() => throw Exception("出错啦"));
}

void main() {
  fetchNumber()
      .then((value) => print("结果：$value"))
      .catchError((error) => print("捕获错误：$error"))
      .whenComplete(() => print("任务完成"));
}
```

### 🧠 输出：

```
捕获错误：Exception: 出错啦
任务完成
```

---

## ⚙️ 三、错误传播机制（Error Propagation）

在 `Future` 链中，每一个 `.then()`、`.catchError()`、`.whenComplete()` 都返回一个新的 `Future`。
错误会在链中**向下传播**，直到被某个 `.catchError()` 或 `try...catch` 捕获为止。

---

## 📌 四、常见错误处理的几种方式

### ✅ 1. 使用 `catchError()`

`catchError` 是最直接的错误处理方式。

```dart
Future<int> fetchData() {
  return Future(() => throw Exception("加载失败"));
}

void main() {
  fetchData()
      .then((value) => print("结果：$value"))
      .catchError((e) => print("捕获到错误：$e"));
}
```

🧠 输出：

```
捕获到错误：Exception: 加载失败
```

---

### ✅ 2. 在 `.then()` 里用 `onError` 参数

`then` 本身也可以接收错误处理参数（但不推荐，语义不清晰）。

```dart
fetchData().then(
  (value) => print("成功：$value"),
  onError: (error) => print("错误：$error"),
);
```

🧠 输出：

```
错误：Exception: 加载失败
```

---

### ✅ 3. 使用 `.whenComplete()` 做清理（无论成功失败都会执行）

比如关闭加载动画、释放资源。

```dart
fetchData()
    .then((value) => print("结果：$value"))
    .catchError((e) => print("捕获错误：$e"))
    .whenComplete(() => print("清理资源"));
```

🧠 输出：

```
捕获错误：Exception: 加载失败
清理资源
```

> ⚠️ 注意：`whenComplete()` **不会吞掉错误**。
> 如果上面没有 `catchError`，错误仍会向下传播。

---

### ✅ 4. 链式调用中错误的传播示例

```dart
Future<int> fetchNumber() {
  return Future(() => 1);
}

void main() {
  fetchNumber()
      .then((value) {
        print("第一步：$value");
        throw Exception("第二步出错了");
      })
      .then((value) => print("第二步结果：$value"))
      .catchError((e) => print("捕获错误：$e"));
}
```

🧠 输出：

```
第一步：1
捕获错误：Exception: 第二步出错了
```

> ✅ 即使错误出现在第一个 `then` 里，`catchError` 仍能捕获。

---

## 🧩 五、链式错误恢复（恢复继续执行）

有时候我们不想中断链，而是希望“修复错误”并继续执行。
这时可以在 `catchError` 中**返回一个新的值**。

```dart
Future<int> fetchData() {
  return Future(() => throw Exception("网络错误"));
}

void main() {
  fetchData()
      .catchError((e) {
        print("捕获到错误：$e");
        return 0; // 返回默认值继续执行
      })
      .then((value) => print("继续执行，值是：$value"));
}
```

🧠 输出：

```
捕获到错误：Exception: 网络错误
继续执行，值是：0
```

---

## 💤 六、`async/await` 写法中的错误处理（推荐）

相比 `.then()` 链式写法，`async/await` 更直观，错误可以用 `try...catch` 捕获。

```dart
Future<int> fetchData() async {
  await Future.delayed(Duration(seconds: 1));
  throw Exception("请求失败");
}

void main() async {
  try {
    int data = await fetchData();
    print("结果：$data");
  } catch (e) {
    print("捕获错误：$e");
  } finally {
    print("请求结束");
  }
}
```

🧠 输出：

```
捕获错误：Exception: 请求失败
请求结束
```

---

## 🧠 七、`catchError()` vs `try...catch` 对比

| 特性      | `catchError()`  | `try...catch`      |
| ------- | --------------- | ------------------ |
| 语法风格    | 链式调用            | 同步结构               |
| 适用场景    | 多层 Future 链     | async/await 结构     |
| 捕获范围    | 当前 Future 链中的错误 | try 块内的所有 await 错误 |
| 是否可继续执行 | 可以返回值继续         | 可以继续写代码            |
| 可读性     | 较差（回调地狱）        | 高（推荐）              |

✅ **建议**：

* 如果你的代码用的是 `.then()` 链，就用 `.catchError()`；
* 如果你的代码用 `async/await`，就用 `try...catch`；
* 永远记得加 `.whenComplete()` 或 `finally` 做资源清理。

---

## 🧩 八、综合例子（全模式示范）

```dart
Future<String> fetchData() {
  return Future.delayed(Duration(seconds: 1), () => throw Exception("超时"));
}

void main() {
  fetchData()
      .then((value) => print("结果：$value"))
      .catchError((e) {
        print("catchError 捕获到：$e");
        return "默认值";
      })
      .then((value) => print("继续执行：$value"))
      .whenComplete(() => print("任务结束"));
}
```

🧠 输出：

```
catchError 捕获到：Exception: 超时
继续执行：默认值
任务结束
```

---

## ✅ 九、总结口诀

| 方法                | 作用                      | 是否中断链  | 说明                     |
| ----------------- | ----------------------- | ------ | ---------------------- |
| `.then()`         | 任务成功执行后调用               | 否      | 抛出异常会传递到下一个 catchError |
| `.catchError()`   | 捕获上游 Future 或 then 中的错误 | 否，可恢复链 | 返回值可继续传递               |
| `.whenComplete()` | 无论成功失败都会执行              | 否      | 不影响结果，适合做清理            |
| `try...catch`     | async/await 方式捕获错误      | 否      | 推荐写法，可读性高              |

---

是否希望我帮你出一份 **“Future 错误处理实战练习题 + 答案讲解”**？
例如网络请求错误恢复、链式任务中断恢复等（非常适合小白巩固）。
