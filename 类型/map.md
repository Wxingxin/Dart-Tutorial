非常棒 👍
你现在已经很熟悉 Dart 的 `List`，接下来学习 `Map` 就会非常轻松。

下面是 Dart 中 **`Map` 的属性与方法大全（含分类 + 示例 + 对比）**，内容超级全，适合系统学习与查阅。

---

## 🌟 一、Map 简介

在 Dart 中，`Map` 是键值对（key-value pair）的集合，类似于 JavaScript 的对象或 Python 的字典。

📘 **定义方式：**

```dart
var person = {
  'name': 'Alice',
  'age': 20,
  'city': 'Shanghai'
};

Map<String, int> scores = {
  'math': 90,
  'english': 88,
  'science': 95,
};
```

或使用构造函数：

```dart
var map = Map(); // 空 Map
map['name'] = 'Bob';
map['age'] = 25;
```

---

## 🧭 二、Map 的属性大全

| 属性            | 类型                        | 说明         | 示例                |
| ------------- | ------------------------- | ---------- | ----------------- |
| `length`      | `int`                     | 键值对数量      | `map.length`      |
| `isEmpty`     | `bool`                    | 是否为空       | `map.isEmpty`     |
| `isNotEmpty`  | `bool`                    | 是否非空       | `map.isNotEmpty`  |
| `keys`        | `Iterable<K>`             | 所有键（可遍历）   | `map.keys`        |
| `values`      | `Iterable<V>`             | 所有值（可遍历）   | `map.values`      |
| `entries`     | `Iterable<MapEntry<K,V>>` | 所有键值对组成的对象 | `map.entries`     |
| `runtimeType` | `Type`                    | 返回类型       | `map.runtimeType` |
| `hashCode`    | `int`                     | 哈希值        | `map.hashCode`    |

📘 **示例：**

```dart
var person = {'name': 'Alice', 'age': 20};

print(person.length);     // 2
print(person.isNotEmpty); // true
print(person.keys);       // (name, age)
print(person.values);     // (Alice, 20)
print(person.entries);    // (MapEntry(name: Alice), MapEntry(age: 20))
```



## 🧩 三、Map 的方法大全（按功能分类）

---

### 🧱 1. 添加与修改元素

| 方法                                    | 说明        | 示例                                          |
| ------------------------------------- | --------- | ------------------------------------------- |
| `operator []=`                        | 通过键设置值    | `map['key'] = 'value'`                      |
| `addAll(Map other)`                   | 合并另一个 Map | `map.addAll({'gender': 'female'})`          |
| `putIfAbsent(key, () => value)`       | 如果键不存在则添加 | `map.putIfAbsent('city', () => 'Shanghai')` |
| `update(key, (value) => newValue)`    | 更新已有键     | `map.update('age', (v) => v + 1)`           |
| `updateAll((key, value) => newValue)` | 更新所有键值对   | `map.updateAll((k, v) => v.toString())`     |

📘 **示例：**

```dart
var map = {'name': 'Alice', 'age': 20};
map['city'] = 'Shanghai';
map.addAll({'gender': 'female'});
map.update('age', (v) => v + 1);
print(map); // {name: Alice, age: 21, city: Shanghai, gender: female}
```

---

### 🧹 2. 删除元素

| 方法                                       | 说明         | 示例                                        |
| ---------------------------------------- | ---------- | ----------------------------------------- |
| `remove(key)`                            | 删除指定键      | `map.remove('age')`                       |
| `clear()`                                | 清空所有键值对    | `map.clear()`                             |
| `removeWhere((key, value) => condition)` | 删除符合条件的键值对 | `map.removeWhere((k, v) => v == 'Alice')` |

📘 **示例：**

```dart
var map = {'a': 1, 'b': 2, 'c': 3};
map.removeWhere((k, v) => v.isEven);
print(map); // {a: 1, c: 3}
```

---

### 🔎 3. 查找与判断

| 方法                     | 说明      | 示例                        |
| ---------------------- | ------- | ------------------------- |
| `containsKey(key)`     | 是否包含某个键 | `map.containsKey('name')` |
| `containsValue(value)` | 是否包含某个值 | `map.containsValue(20)`   |
| `[]`                   | 取值      | `map['name']`             |
| `keys` / `values`      | 获取所有键或值 | `map.keys`, `map.values`  |

📘 **示例：**

```dart
var map = {'name': 'Alice', 'age': 20};
print(map.containsKey('name')); // true
print(map['age']);              // 20
```

---

### 🔁 4. 遍历与转换

| 方法                                                | 说明               | 示例                                          |
| ------------------------------------------------- | ---------------- | ------------------------------------------- |
| `forEach((key, value) => ...)`                    | 遍历每一项            | `map.forEach((k, v) => print('$k: $v'))`    |
| `map((key, value) => MapEntry(newKey, newValue))` | 转换为新 Map         | `map.map((k,v)=>MapEntry(k, v.toString()))` |
| `entries`                                         | 返回 `MapEntry` 集合 | `map.entries.forEach((e)=>print(e.key))`    |

📘 **示例：**

```dart
var map = {'a': 1, 'b': 2};
var newMap = map.map((k, v) => MapEntry(k, v * 10));
print(newMap); // {a: 10, b: 20}
```

---

### ⚙️ 5. 合并与复制

| 方法                     | 说明                | 示例                                     |
| ---------------------- | ----------------- | -------------------------------------- |
| `addAll(other)`        | 添加另一个 Map         | `map.addAll({'c': 3})`                 |
| `addEntries(iterable)` | 从 `MapEntry` 列表添加 | `map.addEntries([MapEntry('d', 4)])`   |
| `from(other)`          | 从另一个 Map 创建新 Map  | `Map.from({'a': 1})`                   |
| `fromEntries(entries)` | 从 entry 列表创建 Map  | `Map.fromEntries([MapEntry('x', 10)])` |
| `of(other)`            | 从另一个 Map 拷贝（类型安全） | `Map.of({'a': 1})`                     |



### 📊 6. 转换与工具

| 方法                                   | 说明               | 示例                                |
| ------------------------------------ | ---------------- | --------------------------------- |
| `cast<K2,V2>()`                      | 转换 Map 的类型       | `map.cast<String, String>()`      |
| `map((key, value) => MapEntry(...))` | 生成新 Map          | `map.map((k,v)=>MapEntry(k,v+1))` |
| `toString()`                         | 转为字符串            | `map.toString()`                  |
| `entries`                            | 获取 `MapEntry` 集合 | `map.entries`                     |

📘 **示例：**

```dart
var map = {'a': 1, 'b': 2};
var str = map.toString();
print(str); // {a: 1, b: 2}
```

---

### 💡 7. 静态构造方法

| 构造函数                              | 说明              | 示例                                    |
| --------------------------------- | --------------- | ------------------------------------- |
| `Map()`                           | 创建空 Map         | `var map = Map();`                    |
| `Map.from(map)`                   | 从现有 Map 复制      | `Map.from({'a': 1})`                  |
| `Map.of(map)`                     | 创建类型安全的拷贝       | `Map.of({'x': 10})`                   |
| `Map.fromEntries(entries)`        | 从 entry 列表创建    | `Map.fromEntries([MapEntry('a', 1)])` |
| `Map.identity()`                  | 使用对象标识比较键       | `Map.identity()`                      |
| `Map.unmodifiable(map)`           | 创建只读 Map        | `Map.unmodifiable({'a': 1})`          |
| `Map.fromIterables(keys, values)` | 从两个 List 创建 Map | `Map.fromIterables(['a','b'],[1,2])`  |

---

## 🧠 八、Map 实战综合案例

```dart
void main() {
  var map = {'name': 'Alice', 'age': 20};

  // 添加
  map['city'] = 'Shanghai';
  map.putIfAbsent('gender', () => 'female');

  // 修改
  map.update('age', (v) => v + 1);

  // 遍历
  map.forEach((k, v) => print('$k: $v'));

  // 转换
  var upper = map.map((k, v) => MapEntry(k.toUpperCase(), v.toString()));
  print(upper); // {NAME: Alice, AGE: 21, CITY: Shanghai, GENDER: female}

  // 删除
  map.removeWhere((k, v) => k == 'city');
  print(map); // {name: Alice, age: 21, gender: female}
}
```

---

## 🧾 九、Map 速查表总结

| 分类 | 常用方法                                                          |
| -- | ------------------------------------------------------------- |
| 添加 | `addAll`, `putIfAbsent`, `addEntries`, `update`               |
| 删除 | `remove`, `removeWhere`, `clear`                              |
| 查找 | `containsKey`, `containsValue`, `[]`                          |
| 遍历 | `forEach`, `entries`, `map()`                                 |
| 转换 | `cast`, `fromEntries`, `toString`                             |
| 构造 | `Map.from`, `Map.of`, `Map.unmodifiable`, `Map.fromIterables` |

---

## ✅ 十、属性 vs 方法 快速对比

| 类型 | 例子                                             | 是否加括号  | 功能      |
| -- | ---------------------------------------------- | ------ | ------- |
| 属性 | `map.length`, `map.keys`, `map.values`         | ❌ 不加括号 | 获取状态或内容 |
| 方法 | `map.addAll()`, `map.remove()`, `map.update()` | ✅ 要加括号 | 执行动作或操作 |

