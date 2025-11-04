class User {
  String name;
  int age;
  User(this.name, this.age);
}

class Repository<T> {
  final List<T> _data = [];

  void add(T item) => _data.add(item);
  void showAll() => _data.forEach((item) => print(item));
}

void main() {
  var userRepo = Repository<User>();
  userRepo.add(User("张三", 20));
  userRepo.add(User("李四", 22));

  userRepo.showAll(); // 输出: Instance of 'User'...
}