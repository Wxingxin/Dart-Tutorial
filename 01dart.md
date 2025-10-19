非常棒 👍
你现在进入的是 Dart 的基础阶段，这一部分是**整个语言学习的核心地基**。

下面我为你整理了 **Dart 基础语法中最详细的知识点大全**，
包括示例讲解、注意事项、常见坑与总结表格。
分为四大块讲：

---

# 🧱 一、变量声明（`var`, `final`, `const`, `late`）

---

## 🧩 1. `var`

表示“自动类型推断”的变量（类似 JS 的 `let`）。
类型在第一次赋值时就确定了，之后不能改为别的类型。

```dart
var name = 'Dart'; // 推断为 String
name = 'Flutter'; // ✅ 可以改值
// name = 123; ❌ 错误，类型已经固定为 String
```

### ✅ 特点：

* 只能声明一次。
* 类型由第一次赋值推断出。
* 属于**可变变量**（可以改值）。

---

## 🧩 2. `final`

表示“只读变量”，值**只能赋值一次**。

```dart
final time = DateTime.now(); // ✅ 运行时可赋值一次
// time = DateTime.now(); ❌ 不允许再次赋值
```

### ✅ 特点：

* **运行时常量**（可以在运行时确定）。
* 程序运行后值固定。
* 内存中只存一个引用。

---

## 🧩 3. `const`

表示**编译时常量**，必须在编译阶段就能确定值。

```dart
const pi = 3.14159; // ✅ 编译时已知
// const time = DateTime.now(); ❌ 错误：运行时值
```

### ✅ 特点：

* **编译时常量**，比 `final` 更严格。
* 可以修饰集合：`const list = [1, 2, 3];`
* 若集合被 const 修饰，则内部也不可修改。

---

## 🧩 4. `late`

表示“延迟初始化变量”，常用于：

* 声明时暂时没法初始化；
* 但保证在使用前一定会被赋值。

```dart
late String username;

void main() {
  username = "Jiaxing";
  print(username);
}
```

### ✅ 特点：

* 延迟赋值；
* 不会占用内存直到第一次使用；
* 与 `final` 可结合：`late final data;`

---

## ✅ 对比总结表：

| 关键字     | 是否可变   | 何时确定值 | 特点     |
| ------- | ------ | ----- | ------ |
| `var`   | ✅ 可变   | 运行时   | 自动类型推断 |
| `final` | ❌ 一次赋值 | 运行时   | 值运行时确定 |
| `const` | ❌ 一次赋值 | 编译时   | 编译期常量  |
| `late`  | ✅ 延迟   | 首次访问前 | 延迟初始化  |

---

# 🔢 二、数据类型（基础 + 集合）

---

## 🧩 1. 数值类型（`int`, `double`）

```dart
int a = 10;
double b = 3.14;
num c = 100; // num 可同时表示 int 和 double
```

### 🧠 常见运算：

```dart
print(a + b); // 加
print(a / 3); // 除（结果是 double）
print(a ~/ 3); // 整除
print(a % 3); // 取余
```

---

## 🧩 2. 布尔类型（`bool`）

```dart
bool isActive = true;
if (isActive) print("Running!");
```

---

## 🧩 3. 字符串（`String`）

```dart
String name = 'Dart';
String lang = "Flutter";
String multiLine = '''
多行字符串
支持换行
''';
```

### 🧠 拼接与插值：

```dart
print('Hello ' + name);
print('Hello $name, length=${name.length}');
```

---

## 🧩 4. 列表（`List`）

```dart
List<int> nums = [1, 2, 3];
nums.add(4);
print(nums[0]); // 访问元素
```

### 🧠 常见操作：

```dart
nums.remove(2);
nums.contains(3);
nums.forEach(print);
var doubled = nums.map((n) => n * 2).toList();
```

### ✅ 不可变列表：

```dart
const fixed = [1, 2, 3];
// fixed.add(4); ❌ 错误
```

---

## 🧩 5. 映射（`Map`）

```dart
Map<String, int> scores = {
  'Tom': 90,
  'Jerry': 85
};
print(scores['Tom']); // 90
```

### 🧠 常见操作：

```dart
scores['Jack'] = 100; // 添加
scores.remove('Jerry'); // 删除
scores.forEach((k, v) => print('$k: $v'));
```

---

## 🧩 6. 集合（`Set`）

```dart
Set<String> fruits = {'apple', 'banana', 'apple'};
print(fruits); // {apple, banana} 去重
```

### 🧠 操作：

```dart
fruits.add('orange');
fruits.remove('apple');
print(fruits.contains('banana'));
```

---

## ✅ 小结表：

| 类型  | 关键类                    | 特点           |
| --- | ---------------------- | ------------ |
| 数值  | `int`, `double`, `num` | 数学运算         |
| 布尔  | `bool`                 | true / false |
| 字符串 | `String`               | 字符串插值、拼接     |
| 列表  | `List`                 | 有序可重复        |
| 映射  | `Map`                  | 键值对结构        |
| 集合  | `Set`                  | 无序不重复        |

---

# ⚙️ 三、运算符大全

---

## 🧩 1. 算术运算符

| 运算符         | 示例           | 说明            |
| ----------- | ------------ | ------------- |
| `+`         | `a + b`      | 加法            |
| `-`         | `a - b`      | 减法            |
| `*`         | `a * b`      | 乘法            |
| `/`         | `a / b`      | 除法（返回 double） |
| `~/`        | `a ~/ b`     | 整除（返回 int）    |
| `%`         | `a % b`      | 取余            |
| `++` / `--` | `a++`, `--a` | 自增、自减         |

---

## 🧩 2. 关系运算符

| 运算符  | 示例       | 含义   |
| ---- | -------- | ---- |
| `==` | `a == b` | 等于   |
| `!=` | `a != b` | 不等于  |
| `>`  | `a > b`  | 大于   |
| `<`  | `a < b`  | 小于   |
| `>=` | `a >= b` | 大于等于 |
| `<=` | `a <= b` | 小于等于 |

---

## 🧩 3. 逻辑运算符

| 运算符  | 示例       | 含义     |    |   |    |         |
| ---- | -------- | ------ | -- | - | -- | ------- |
| `&&` | `a && b` | 与（都为真） |    |   |    |         |
| `    |          | `      | `a |   | b` | 或（任一为真） |
| `!`  | `!a`     | 非（取反）  |    |   |    |         |

---

## 🧩 4. 条件运算符（简写语法糖）

| 运算符   | 示例              | 含义                  |
| ----- | --------------- | ------------------- |
| 三目运算符 | `a > b ? a : b` | 条件判断                |
| 空合并   | `x ?? y`        | 若 `x` 为 null，则取 `y` |
| 级联操作符 | `..`            | 连续调用同一对象方法          |
| ?.    | `obj?.method()` | 若对象为 null，则不调用      |

### 示例：

```dart
var user = User()
  ..name = 'Tom'
  ..age = 18
  ..sayHello();
```

---

## 🧩 5. 类型运算符

| 运算符   | 示例                | 说明      |
| ----- | ----------------- | ------- |
| `is`  | `a is int`        | 判断类型    |
| `is!` | `a is! String`    | 判断不是该类型 |
| `as`  | `(obj as Person)` | 强制类型转换  |

---

# 🌈 四、综合练习示例

```dart
class User {
  String name = '';
  int age = 0;
  void sayHello() => print('Hello, I am $name');
}

void main() {
  // 变量声明
  final time = DateTime.now();
  var user = User()
    ..name = 'Alice'
    ..age = 20
    ..sayHello();

  // 集合
  var scores = {'Alice': 95, 'Bob': 88};
  scores.forEach((k, v) => print('$k 得分: $v'));

  // 条件运算符
  int? value;
  print(value ?? 0); // 空合并

  // 类型判断
  print(user is User); // true
}
```

---

如果你希望我接着讲下一节（比如 **“函数与闭包”** 或 **“控制流语句详解”**），
我可以继续为你整理成同样风格的知识点大全。

你想我接着讲哪一个？
