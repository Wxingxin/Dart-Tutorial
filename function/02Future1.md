

# 💯💯💯 🌱 一、什么是 Future？

> Future 表示 **“未来会得到的一个值”**。
> 它用来处理 **异步操作**（例如网络请求、文件读取、延时操作等）。

就像你点了外卖后，系统告诉你“订单已提交，稍后送达”，这就是 Future 的概念。

### 📦 例子：

```dart
Future<String> getData() {
  return Future.delayed(Duration(seconds: 2), () {
    return "数据加载完成";
  });
}

void main() {
  print("开始加载");
  getData().then((value) {
    print(value);
  });
  print("加载中...");
}
```

### 🧠 输出结果：

```
开始加载
加载中...
数据加载完成
```

> 因为 `Future.delayed` 是异步的，它不会阻塞后面的代码执行。
> 当 2 秒后任务完成时，才执行 `then` 里的内容。

---

## ⚙️ 二、Future 的三种状态

Future 有三种可能的状态：

| 状态                        | 含义               |
| ------------------------- | ---------------- |
| 未完成（Uncompleted）          | Future 还在执行中     |
| 已完成（Completed with value） | Future 执行成功并返回结果 |
| 已完成（Completed with error） | Future 执行出错      |

例子：

```dart
Future<String> fetchData() {
  return Future.delayed(Duration(seconds: 1), () {
    throw Exception("请求失败");
  });
}

void main() {
  fetchData()
    .then((data) => print("结果：$data"))
    .catchError((e) => print("错误：$e"));
}
```

🧠 输出：

```
错误：Exception: 请求失败
```

---

## 🔄 三、then / catchError / whenComplete 链式调用

`Future` 可以像拼积木一样链式调用。

```dart
Future<int> add(int a, int b) {
  return Future.delayed(Duration(seconds: 1), () => a + b);
}

void main() {
  add(2, 3)
    .then((sum) {
      print("第一次结果：$sum");
      return sum * 2;
    })
    .then((result) {
      print("第二次结果：$result");
    })
    .catchError((error) {
      print("出错了：$error");
    })
    .whenComplete(() {
      print("任务完成");
    });
}
```

🧠 输出：

```
第一次结果：5
第二次结果：10
任务完成
```

---

## 💤 四、async / await（更推荐的写法）

`async` 和 `await` 是 Dart 的语法糖，用起来更像同步代码。

```dart
Future<String> getData() async {
  await Future.delayed(Duration(seconds: 2));
  return "数据加载成功";
}

void main() async {
  print("开始加载");
  String data = await getData();
  print(data);
  print("结束");
}
```

🧠 输出：

```
开始加载
数据加载成功
结束
```

> ✅ `await` 只能用在 `async` 函数中
> ✅ 程序会“等待” Future 执行完再继续执行下一步（但不会阻塞整个程序）

---

## 🪄 五、Future 常见构造方法

| 方法                                   | 作用                      | 示例                                                 |
| ------------------------------------ | ----------------------- | -------------------------------------------------- |
| `Future.delayed(Duration, callback)` | 延迟执行                    | `Future.delayed(Duration(seconds: 2), () => "ok")` |
| `Future.value(value)`                | 立即返回一个结果                | `Future.value(42)`                                 |
| `Future.error(error)`                | 立即返回一个错误                | `Future.error("出错了")`                              |
| `Future.microtask(callback)`         | 立即执行一个异步任务（比 `then` 优先） | `Future.microtask(() => print("task"))`            |
| `Future.wait([...])`                 | 等待多个 Future 全部完成        | `Future.wait([f1, f2])`                            |

### 🌰 `Future.wait` 示例：

```dart
void main() async {
  var result = await Future.wait([
    Future.delayed(Duration(seconds: 1), () => "A"),
    Future.delayed(Duration(seconds: 2), () => "B"),
  ]);
  print(result); // 输出: [A, B]
}
```

---

## 🧩 六、Future 和异步错误处理

在 `async/await` 中可以用 `try...catch` 捕获错误：

```dart
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 1));
  throw Exception("网络错误");
}

void main() async {
  try {
    var data = await fetchData();
    print(data);
  } catch (e) {
    print("出错了：$e");
  } finally {
    print("请求结束");
  }
}
```

---

## 📚 七、Future 的执行顺序（事件循环机制）

Dart 的事件循环中有两类任务：

1. **Microtask（微任务）**
2. **Event（事件任务）**

执行顺序是：

> 微任务（microtask） → 事件任务（event）

例子：

```dart
void main() {
  Future.microtask(() => print("微任务1"));
  Future(() => print("事件任务1"));
  Future.microtask(() => print("微任务2"));
  Future(() => print("事件任务2"));
  print("主任务");
}
```

🧠 输出顺序：

```
主任务
微任务1
微任务2
事件任务1
事件任务2
```

---

## 🧠 八、Future 的应用场景

在 Flutter 开发中，`Future` 常用于：

* 读取网络数据（HTTP 请求）
* 文件操作（读写文件）
* 延时操作（等待动画、过渡）
* 初始化任务（如加载配置）

---

## 🎯 九、经典综合例子

```dart
Future<String> fetchUserOrder() {
  return Future.delayed(Duration(seconds: 2), () => '咖啡订单');
}

void main() async {
  print('等待订单中...');
  String order = await fetchUserOrder();
  print('你的订单是：$order');
}
```

🧠 输出：

```
等待订单中...
你的订单是：咖啡订单
```

---

## ✅ 十、总结速记表

| 概念             | 说明             |
| -------------- | -------------- |
| Future         | 表示未来的一个值（异步结果） |
| then           | 任务成功后执行        |
| catchError     | 捕获异常           |
| whenComplete   | 无论成功失败都会执行     |
| async          | 声明异步函数         |
| await          | 等待 Future 完成   |
| Future.wait    | 等待多个异步任务完成     |
| Future.delayed | 延时执行           |

---

是否希望我接下来帮你出一份 **「Future 练习题 + 答案讲解」**（包括 async/await 和 then 两种写法的对比练习）？
这样你可以边练边理解。
