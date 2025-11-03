太好了 👏，你现在已经学到了 Dart 类与继承的核心知识，
接下来我们要讲的—— **Getter / Setter（取值器/赋值器）** 和 **私有成员（Private Members）**，
是 Dart 面向对象编程中 **“封装” 的关键部分**。

我会用最直观的语言 + 经典代码案例，让你彻底学懂它们。
（非常适合 Dart 小白 🌱）

---

# 🧱 一、封装（Encapsulation）是什么？

> “封装” 就是把数据（属性）和行为（方法）打包在类中，
> 并控制外界是否能访问这些数据。

简单来说：

> 就像“房间的门”，你可以决定哪些能进，哪些不能进。

---

# 🧩 二、私有成员（Private Members）

## 💡 定义：

> 在 Dart 中，**下划线 `_` 开头的变量或方法就是私有的（private）**。

🔒 私有成员只能在 **同一个文件（library）** 中访问，
在文件外部是**不可见的**。

---

### 🌟 案例1：私有变量的使用

```dart
// person.dart
class Person {
  String _name = "张三"; // 私有属性
  int _age = 18;        // 私有属性

  void showInfo() {
    print("姓名：$_name, 年龄：$_age");
  }
}
```

```dart
// main.dart
import 'person.dart';

void main() {
  var p = Person();
  // ❌ 不能访问私有属性
  // print(p._name); // 报错：'_name' isn't defined for class 'Person'.
  
  p.showInfo(); // ✅ 通过公有方法访问
}
```

🧠 说明：

* `_name` 和 `_age` 只能在 `person.dart` 文件中使用；
* 其他文件访问会报错；
* 这是 Dart 的 **文件级私有机制**。

---

# 🧠 三、Getter / Setter 是什么？

## 💡 定义：

> `getter` 和 `setter` 是**访问私有属性的安全通道**。
> 你可以在它们中添加逻辑，而不是直接暴露属性。

---

### 🌟 案例2：简单 Getter / Setter

```dart
class Person {
  String _name = "";
  int _age = 0;

  // getter：获取 _name
  String get name => _name;

  // setter：设置 _name
  set name(String value) {
    _name = value;
  }

  // getter + setter 组合
  int get age => _age;
  set age(int value) {
    if (value >= 0 && value <= 150) {
      _age = value;
    } else {
      print("年龄不合法");
    }
  }
}

void main() {
  var p = Person();
  p.name = "小明";   // 调用 setter
  p.age = 20;        // 调用 setter
  print(p.name);     // 调用 getter
  print(p.age);
}
```

🟢 输出：

```
小明
20
```

🧠 说明：

* `get name => _name;` 是 getter；
* `set name(String value)` 是 setter；
* 外部访问看起来像直接操作属性，但其实在走函数逻辑。

---

# 🧩 四、Getter/Setter 的访问形式

| 类型     | 声明方式                 | 调用方式             |
| ------ | -------------------- | ---------------- |
| Getter | `get name => _name;` | `p.name`         |
| Setter | `set name(value)`    | `p.name = "xxx"` |

> 注意：Getter 调用时**没有括号**，看起来像属性一样。

---

# 🌟 案例3：只读属性（只有 getter）

```dart
class Circle {
  final double radius;

  Circle(this.radius);

  // 只读属性
  double get area => 3.14 * radius * radius;
}

void main() {
  var c = Circle(5);
  print("半径: ${c.radius}");
  print("面积: ${c.area}");
  // ❌ c.area = 100; // 报错：不能给只读属性赋值
}
```

🧠 说明：

* 定义了只读属性 `area`；
* 没有 `setter`，只能读取不能修改。

---

# 🌟 案例4：getter/setter 封装私有属性

```dart
class BankAccount {
  double _balance = 0;

  double get balance => _balance;

  set balance(double amount) {
    if (amount >= 0) {
      _balance = amount;
    } else {
      print("存款不能为负数！");
    }
  }

  void deposit(double amount) {
    _balance += amount;
  }
}

void main() {
  var acc = BankAccount();
  acc.balance = 100;  // ✅ setter
  print(acc.balance); // ✅ getter

  acc.balance = -50;  // ❌ setter 内部校验
}
```

🟢 输出：

```
100.0
存款不能为负数！
```

🧠 说明：

* `_balance` 是私有；
* 外部不能直接访问；
* 通过 getter/setter 间接访问并校验数据。

---

# 🧬 五、私有成员与 Getter/Setter 的关系

| 概念          | 作用            |
| ----------- | ------------- |
| 私有成员 `_xxx` | 封装数据，不让外部直接访问 |
| getter      | 用来安全地“读取”数据   |
| setter      | 用来安全地“修改”数据   |
| 封装目的        | 防止外部随意篡改属性值   |

---

# 🌟 案例5：综合使用（完整示例）

```dart
class Student {
  String _name = "";
  int _score = 0;

  // name getter & setter
  String get name => _name;
  set name(String value) {
    if (value.isNotEmpty) {
      _name = value;
    } else {
      print("姓名不能为空");
    }
  }

  // score getter & setter
  int get score => _score;
  set score(int value) {
    if (value >= 0 && value <= 100) {
      _score = value;
    } else {
      print("分数不合法");
    }
  }

  void show() {
    print("学生: $_name, 成绩: $_score 分");
  }
}

void main() {
  var s = Student();
  s.name = "小华";
  s.score = 95;
  s.show();

  s.score = 150; // ❌ 不合法
}
```

🟢 输出：

```
学生: 小华, 成绩: 95 分
分数不合法
```

---

# 🧠 六、Getter/Setter 的实际用途（非常重要）

在实际开发中，比如 Flutter 项目：

* 控制输入数据合法性；
* 动态计算属性值；
* 提供安全访问私有数据的方式；
* 提高代码的可维护性和安全性。

---

# ✅ 七、总结记忆表

| 知识点    | 说明                  | 示例                                 |
| ------ | ------------------- | ---------------------------------- |
| 私有属性   | 以 `_` 开头，只能文件内访问    | `_name`                            |
| getter | 定义访问器，用于读取          | `String get name => _name;`        |
| setter | 定义修改器，用于设置          | `set name(String v) => _name = v;` |
| 只读属性   | 只有 getter 没有 setter | `double get area => ...`           |
| 封装目的   | 防止外部滥用或破坏对象数据       | 校验逻辑、保护数据                          |

---

💡 **一句话总结：**

> Dart 用 `_` 实现私有化，
> 用 `getter` 和 `setter` 实现“安全的访问与修改”。

---

如果你愿意，我可以帮你写一份
📘《Dart Getter/Setter + 私有成员实战大全》
包括：

* 自动生成 getter/setter 的技巧
* Flutter 中常见用法（如 State 管理）
* 面试题 + 源码剖析

要我帮你写这一份进阶版吗？


太棒了 🎯！
这份你要的《**Dart Getter/Setter + 私有成员实战大全**》我会给你完整写出来：
✅ 从入门讲清楚概念
✅ 到实战案例（经典 + Flutter风格）
✅ 最后附带面试题与技巧总结

## 非常适合你这样的 Dart 小白，一步到位地学透 Getter / Setter 与私有成员。

# 🧱 一、前置知识：为什么要用 Getter / Setter？

在 Dart 中，类的属性默认是**公开（public）**的：

```dart
class Person {
  String name = "小明";
}

void main() {
  var p = Person();
  print(p.name); // ✅ 可直接访问
  p.name = "小红"; // ✅ 可直接修改
}
```

虽然方便，但这样做存在问题：

* 无法限制外部随意修改；
* 无法校验值是否合理；
* 无法在属性访问时动态计算。

这时，我们就需要：

> **私有属性 + Getter / Setter 封装访问逻辑**

---

# 🧩 二、私有成员（Private Members）

## 1️⃣ 基本语法

> 在 Dart 中，**以下划线 `_` 开头的属性或方法就是私有的**。
> 它只在当前文件（library）内可访问。

```dart
class Person {
  String _name = "小明"; // 私有
  int _age = 18;        // 私有

  void showInfo() {
    print("姓名：$_name, 年龄：$_age");
  }
}

void main() {
  var p = Person();
  // ❌ print(p._name); // 报错：私有变量不可访问
  p.showInfo(); // ✅ 只能通过公共方法间接访问
}
```

---

# ⚙️ 三、Getter / Setter 的基本用法

Getter / Setter 就是**属性访问器**：

* `get` 用于**读取属性**；
* `set` 用于**修改属性**。

---

## 🌟 案例1：完整的 Getter / Setter 示例

```dart
class Person {
  String _name = "";
  int _age = 0;

  // getter
  String get name => _name;

  // setter
  set name(String value) {
    if (value.isNotEmpty) {
      _name = value;
    } else {
      print("姓名不能为空！");
    }
  }

  int get age => _age;
  set age(int value) {
    if (value > 0 && value < 120) {
      _age = value;
    } else {
      print("年龄不合法！");
    }
  }
}

void main() {
  var p = Person();
  p.name = "小李";   // ✅ 调用 setter
  p.age = 20;       // ✅ 调用 setter
  print(p.name);    // ✅ 调用 getter
  print(p.age);
}
```

🧠 **注意：**

* `get` / `set` 不需要括号；
* 外部访问时看起来就像操作属性一样；
* setter 可以添加校验逻辑。

---

# 🧮 四、只读属性（Getter 无 Setter）

当某个属性的值是**计算得来的**或**不应被外部修改**时，
就可以只写 `getter`。

---

## 🌟 案例2：计算型只读属性

```dart
class Circle {
  final double radius;

  Circle(this.radius);

  // 只读属性
  double get area => 3.14 * radius * radius;
}

void main() {
  var c = Circle(5);
  print("半径: ${c.radius}");
  print("面积: ${c.area}");
}
```

🧠 **说明：**

* `area` 没有存储在内存中；
* 每次访问时都会自动计算；
* 外部不能 `c.area = xxx`，因为没有 setter。

---

# 🧩 五、Getter / Setter 实战案例大全

---

## 🌟 案例3：封装银行账户（BankAccount）

```dart
class BankAccount {
  double _balance = 0;

  double get balance => _balance;

  set balance(double amount) {
    if (amount >= 0) {
      _balance = amount;
    } else {
      print("余额不能为负数！");
    }
  }

  void deposit(double amount) {
    if (amount > 0) _balance += amount;
  }

  void withdraw(double amount) {
    if (amount > _balance) {
      print("余额不足！");
    } else {
      _balance -= amount;
    }
  }
}

void main() {
  var acc = BankAccount();
  acc.balance = 100; // ✅ 调用 setter
  print(acc.balance); // ✅ 调用 getter
  acc.withdraw(50);
  print(acc.balance);
}
```

🧠 **说明：**

* `_balance` 是私有的；
* getter/setter 封装访问；
* 加入逻辑保护资金安全。

---

## 🌟 案例4：学生成绩管理（校验 + 只读）

```dart
class Student {
  String _name = "";
  int _score = 0;

  String get name => _name;
  set name(String value) => _name = value;

  int get score => _score;
  set score(int value) {
    if (value >= 0 && value <= 100) {
      _score = value;
    } else {
      print("成绩不合法！");
    }
  }

  String get grade {
    if (_score >= 90) return "优秀";
    if (_score >= 60) return "及格";
    return "不及格";
  }
}

void main() {
  var stu = Student();
  stu.name = "小华";
  stu.score = 85;
  print("${stu.name}：${stu.grade}");
}
```

🧠 说明：

* 读写属性都有保护；
* `grade` 是计算型只读属性；
* 体现了“封装 + 校验 + 推导”的完整逻辑。

---

## 🌟 案例5（Flutter风格）：Model + UI 动态绑定

在 Flutter 项目中，getter/setter 常用于 **状态管理（State）**。

```dart
class Counter {
  int _count = 0;

  int get count => _count;

  set count(int value) {
    if (value >= 0) {
      _count = value;
      print("计数器已更新：$value");
    }
  }

  void increment() {
    count = count + 1; // 调用 setter
  }
}

void main() {
  var counter = Counter();
  counter.increment(); // 计数器已更新：1
  counter.increment(); // 计数器已更新：2
}
```

在 Flutter 中这类模型会配合：

* `setState()`
* `Provider` / `Riverpod`
* `ChangeNotifier`

实现数据驱动 UI。

---

# 🧱 六、Getter / Setter 小技巧大全

| 技巧     | 说明                            | 示例                               |
| ------ | ----------------------------- | -------------------------------- |
| ✅ 自动生成 | VSCode 输入 `get` / `set` 可自动补全 | `prop + tab`                     |
| ✅ 只读属性 | 仅写 `get`                      | `double get area => ...`         |
| ✅ 数据校验 | 在 setter 内做判断                 | `if (value > 0)`                 |
| ✅ 计算属性 | getter 动态返回                   | `get fullName => "$first $last"` |
| ✅ 延迟加载 | 在 getter 内首次计算                | 类似 lazy load                     |
| ✅ 代码规范 | 私有属性用 `_` 开头                  | `_name`, `_age`                  |

---

# 🧩 七、Getter / Setter + 私有成员面试题 💡

### 🧠 问题1：Dart 如何实现属性私有？

> ✅ 通过 `_` 前缀实现，作用范围是文件（library）。

---

### 🧠 问题2：getter/setter 与普通方法的区别？

| 对比项  | getter/setter               | 普通方法          |
| ---- | --------------------------- | ------------- |
| 调用方式 | `p.name` / `p.name = value` | `p.getName()` |
| 意义   | 用于封装属性访问                    | 执行操作逻辑        |
| 使用场景 | 数据校验、计算属性                   | 业务逻辑函数        |

---

### 🧠 问题3：getter 可以有参数吗？

> ❌ 不可以。
> getter 只能**返回值**，不能传参。

---

### 🧠 问题4：Dart 中 `_` 是类私有还是文件私有？

> 文件私有（library private）。
> 也就是说：
>
> * 同一个文件的类能互相访问 `_xxx`；
> * 不同文件之间不能访问 `_xxx`。

---

# 🧩 八、进阶实战案例：Getter + 工厂构造函数 + 缓存对象

```dart
class Config {
  static final Map<String, Config> _cache = {};

  final String name;

  factory Config(String name) {
    return _cache.putIfAbsent(name, () => Config._internal(name));
  }

  Config._internal(this.name);

  String get upperName => name.toUpperCase();
}

void main() {
  var c1 = Config("dev");
  var c2 = Config("dev");
  print(c1 == c2); // true ✅ 同一对象缓存
  print(c1.upperName); // DEV
}
```

🧠 说明：

* getter 用于返回计算值；
* 私有构造函数 `_internal`；
* 工厂函数 + getter 实现缓存读取；
* 实际上这是一种常见的“单例缓存模式”。

---

# 🧭 九、总结表

| 知识点    | 说明                | 示例                                 |
| ------ | ----------------- | ---------------------------------- |
| 私有属性   | `_` 开头，只在当前文件可访问  | `_name`                            |
| getter | 定义读取逻辑            | `String get name => _name;`        |
| setter | 定义修改逻辑            | `set name(String v) => _name = v;` |
| 只读属性   | 仅 getter，无 setter | `double get area => ...`           |
| 校验属性   | setter 内添加判断      | `if (value > 0)`                   |
| 文件私有   | Dart 没有类级私有，只有文件级 | `_balance`                         |
| 计算属性   | getter 返回动态值      | `get fullName => "$first $last";`  |

---

# 💬 十、结语（送给 Dart 小白）

> Dart 的封装机制很“优雅”，
> 你只需：
>
> * 用 `_` 保证数据安全；
> * 用 `getter/setter` 实现控制；
> * 用 `final` / `const` 确保不可变；
> * 用 “命名 + 工厂构造” 实现灵活对象创建。

---

如果你愿意，我可以帮你写一份
📘《Dart Getter/Setter + 私有成员项目实战篇》
内容包括：

* 模拟学生成绩管理系统
* Flutter中 Provider 模式下 getter/setter 状态刷新
* getter/setter 性能对比实测

要我帮你继续写这一份实战篇吗？
