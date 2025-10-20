class Point {
  int x, y;
  Point(this.x, this.y);

  Point operator +(Point other) => Point(x + other.x, y + other.y);

  @override
  String toString() => "($x, $y)";
}

void main() {
  var p1 = Point(1, 2);
  var p2 = Point(3, 4);
  print(p1 + p2); // (4, 6)
}
