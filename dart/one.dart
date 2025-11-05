void main() {
  var p1 = One();
}

class Two {
  int x;
  int y;

  Two.origin(): x = 0, y = 0;
}

class One {
  String name = 'gao lixin';
  One() {
    print('this is one class');
  }
}

class Person {
  String name = 'no name';
  int age = 0;

  void sayHello() {
    print('hello I is $name , my age is $age');
  }
}
