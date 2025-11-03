class Student {
  final String name;

  // 缓存所有创建的 Student
  static final Map<String, Student> _cache = {};

  // 私有构造函数
  Student._internal(this.name);

  // 工厂构造函数：如果已有缓存，就复用
  factory Student(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name]!;
    } else {
      final newStudent = Student._internal(name);
      _cache[name] = newStudent;
      return newStudent;
    }
  }
}

void main() {
  var s1 = Student('Alice');
  var s2 = Student('Alice');
  var s3 = Student('Bob');

  print(identical(s1, s2)); // true
  print(identical(s1, s3)); // false
}
