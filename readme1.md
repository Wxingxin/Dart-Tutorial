

## 🧱 阶段 2：面向对象编程（OOP）

### 🎯 学习目标：

理解 Dart 的类、继承、多态、封装和构造函数。

### 📘 学习内容：

1. **类与对象**

   ```dart
   class Person {
     String name;
     int age;
     Person(this.name, this.age);
     void sayHello() => print("Hi, I'm $name");
   }
   ```

2. **继承与多态**

   ```dart
   class Student extends Person {
     Student(String name, int age) : super(name, age);
   }
   ```

3. **抽象类 & 接口**

   * `abstract class`
   * 使用 `implements` 实现接口

4. **Getter / Setter / Factory 构造函数**

   ```dart
   class Circle {
     double radius;
     Circle(this.radius);
     double get area => 3.14 * radius * radius;
   }
   ```

5. **命名构造函数 & 常量构造函数**

### 💪 练习：

* 定义一个 `Animal` 父类，派生出 `Dog`、`Cat`。
* 实现一个 `Shape` 接口，包含 `area()` 与 `perimeter()`。
* 用类封装一个银行账户系统。

---

## ⚙️ 阶段 3：函数式编程与异步编程


## 🧩 阶段 4：Dart 高级特性

### 🎯 学习目标：

掌握 Dart 的高级语言机制和泛型能力。

### 📘 学习内容：

1. **泛型（Generics）**

   ```dart
   class Box<T> {
     T value;
     Box(this.value);
   }
   ```

2. **Mixin 混入**

   ```dart
   mixin Logger {
     void log(String msg) => print("[LOG] $msg");
   }
   class MyService with Logger {}
   ```

3. **Extension 扩展方法**

   ```dart
   extension StringExtension on String {
     String capitalize() => this[0].toUpperCase() + substring(1);
   }
   ```

4. **枚举（enum）**

   ```dart
   enum Status { success, error, loading }
   ```

5. **Isolates（并发编程）**
   用于多线程任务，如图片处理、密集计算。

### 💪 练习：

* 创建一个带泛型的 `Cache<T>` 类；
* 用 mixin 实现一个日志功能；
* 写一个扩展方法让 String 支持 `.isPalindrome()` 判断回文。

---

## 🧱 阶段 5：实战与生态

### 🎯 学习目标：
