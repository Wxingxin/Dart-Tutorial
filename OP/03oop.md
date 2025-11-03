非常好 👍
我们来系统讲解 **Dart 中“对象的使用大全”**，并且配合多个**经典代码案例**（从入门到进阶），帮助你彻底掌握 Dart 的对象。

---

## 🧩 一、什么是对象（Object）

在 Dart 中：

> **一切皆对象（Everything is an Object）**

包括 `int`、`String`、`bool`、`List`、`Map` 等，全部继承自 `Object` 类。
对象就是类（`class`）的实例，通过类来创建。

---

## 🧱 二、对象的基本使用

### ✅ 1. 定义类与创建对象

```dart
// 定义一个类
class Person {
  String name;
  int age;

  // 构造函数
  Person(this.name, this.age);

  // 普通方法
  void sayHello() {
    print("你好，我是$name，今年$age岁。");
  }
}

void main() {
  // 创建对象
  Person p1 = Person("小明", 20);
  p1.sayHello();  // 输出：你好，我是小明，今年20岁。
}
```

🧠 说明：

* Dart 中构造函数可以直接用参数列表简写。
* 通过 `.` 调用属性或方法。

---

### ✅ 2. 命名构造函数

```dart
class Point {
  double x, y;

  // 默认构造函数
  Point(this.x, this.y);

  // 命名构造函数
  Point.origin() {
    x = 0;
    y = 0;
  }

  void show() => print("x=$x, y=$y");
}

void main() {
  var p1 = Point(3, 4);
  var p2 = Point.origin();
  p1.show(); // x=3, y=4
  p2.show(); // x=0, y=0
}
```

💡 用于提供多个方式初始化对象。

---

### ✅ 3. 可选参数与默认值

```dart
class Student {
  String name;
  int age;
  String city;

  Student(this.name, this.age, {this.city = "未知"});

  void info() => print("姓名: $name, 年龄: $age, 城市: $city");
}

void main() {
  Student s1 = Student("小红", 18, city: "上海");
  Student s2 = Student("小刚", 19); // city 未传，使用默认值
  s1.info(); // 姓名: 小红, 年龄: 18, 城市: 上海
  s2.info(); // 姓名: 小刚, 年龄: 19, 城市: 未知
}
```

---

## ⚙️ 三、对象中的常见操作

### ✅ 1. 使用 `toString()` 打印对象信息

```dart
class User {
  String username;
  int id;

  User(this.username, this.id);

  @override
  String toString() {
    return "User(id: $id, username: $username)";
  }
}

void main() {
  var u = User("admin", 1001);
  print(u); // 输出 User(id: 1001, username: admin)
}
```

---

### ✅ 2. 对象比较（== 运算符）

```dart
class Dog {
  String name;

  Dog(this.name);

  @override
  bool operator ==(Object other) {
    return other is Dog && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

void main() {
  var d1 = Dog("旺财");
  var d2 = Dog("旺财");
  print(d1 == d2); // true
}
```

---

### ✅ 3. 级联操作符（`..`）

让代码更简洁：

```dart
class Car {
  String brand = "";
  int speed = 0;

  void start() => print("$brand 启动中...");
  void drive() => print("$brand 以 $speed km/h 行驶中...");
}

void main() {
  Car car = Car()
    ..brand = "Tesla"
    ..speed = 120
    ..start()
    ..drive();
}
```

输出：

```
Tesla 启动中...
Tesla 以 120 km/h 行驶中...
```

---

## 🧮 四、对象的继承与多态

### ✅ 1. 继承

```dart
class Animal {
  void eat() => print("动物在吃东西");
}

class Cat extends Animal {
  @override
  void eat() => print("猫在吃鱼");
}

void main() {
  Cat cat = Cat();
  cat.eat(); // 猫在吃鱼
}
```

---

### ✅ 2. 多态

```dart
class Animal {
  void speak() => print("动物发出声音");
}

class Dog extends Animal {
  @override
  void speak() => print("汪汪汪");
}

class Cat extends Animal {
  @override
  void speak() => print("喵喵喵");
}

void makeSound(Animal animal) {
  animal.speak();
}

void main() {
  makeSound(Dog());
  makeSound(Cat());
}
```

---

## 🧰 五、对象与工厂构造函数（单例）

```dart
class Database {
  static Database? _instance;

  Database._internal(); // 私有构造函数

  factory Database() {
    _instance ??= Database._internal();
    return _instance!;
  }

  void query() => print("查询数据库中...");
}

void main() {
  var db1 = Database();
  var db2 = Database();
  print(db1 == db2); // true，说明是同一个对象
}
```

💡 用于控制对象创建次数（例如：单例模式）。

---

## 📦 六、对象与 JSON（前后端交互常用）

```dart
import 'dart:convert';

class User {
  String name;
  int age;

  User(this.name, this.age);

  // 将对象转为 Map
  Map<String, dynamic> toJson() => {'name': name, 'age': age};

  // 从 Map 创建对象
  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['name'], json['age']);
  }
}

void main() {
  User u = User("小李", 25);
  String jsonStr = jsonEncode(u); // 对象转 JSON
  print(jsonStr); // {"name":"小李","age":25}

  var u2 = User.fromJson(jsonDecode(jsonStr)); // JSON 转 对象
  print(u2.name); // 小李
}
```

---

## 🧠 七、对象与拷贝（深拷贝与浅拷贝）

```dart
class Person {
  String name;
  List<String> hobbies;

  Person(this.name, this.hobbies);

  // 浅拷贝
  Person cloneShallow() => Person(name, hobbies);

  // 深拷贝
  Person cloneDeep() => Person(name, List.from(hobbies));
}

void main() {
  var p1 = Person("小王", ["唱歌", "跳舞"]);
  var p2 = p1.cloneShallow();
  var p3 = p1.cloneDeep();

  p1.hobbies[0] = "画画";

  print(p2.hobbies); // ["画画", "跳舞"]
  print(p3.hobbies); // ["唱歌", "跳舞"]
}
```

---

## ⚡ 八、扩展案例：对象数组与排序

```dart
class Product {
  String name;
  double price;

  Product(this.name, this.price);

  @override
  String toString() => "$name: ￥$price";
}

void main() {
  var products = [
    Product("鼠标", 59.9),
    Product("键盘", 129.0),
    Product("显示器", 999.0),
  ];

  products.sort((a, b) => a.price.compareTo(b.price));

  for (var p in products) {
    print(p);
  }
}
```

输出：

```
鼠标: ￥59.9
键盘: ￥129.0
显示器: ￥999.0
```

---

## 🔥 总结（对象的常见技巧）

| 技巧                       | 说明       |
| ------------------------ | -------- |
| `this.name`              | 访问当前对象属性 |
| `@override`              | 重写父类方法   |
| `..`                     | 级联操作     |
| `factory`                | 工厂构造函数   |
| `toJson / fromJson`      | JSON序列化  |
| `clone / copy`           | 拷贝对象     |
| `==` 与 `hashCode`        | 对象比较     |
| `extends` / `implements` | 继承与接口实现  |

---

是否希望我接下来帮你整理一份 **《Dart对象进阶篇》**（包括抽象类、接口、多继承混入（mixin）、泛型类、操作符重载等）？
这部分是面向 Flutter 实际项目开发的内容，会更贴近实战。
