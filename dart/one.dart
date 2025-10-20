mixin Fly {
  void fly() {
    print("我会飞！");
  }
}

mixin Swim {
  void swim() {
    print("我会游泳！");
  }
}

class Duck with Fly, Swim {
  void show() {
    print("我是鸭子");
  }
}

void main() {
  var duck = Duck();
  duck.show();
  duck.fly();
  duck.swim();
}
