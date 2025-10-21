import 'dart:isolate';

void backgroundTask(SendPort sendPort) async {
  int counter = 0;
  while (true) {
    await Future.delayed(Duration(seconds: 1));
    counter++;
    sendPort.send("后台运行 $counter 秒");
    if (counter >= 5) break;
  }
}

void main() async {
  ReceivePort receivePort = ReceivePort();
  await Isolate.spawn(backgroundTask, receivePort.sendPort);

  await for (var msg in receivePort) {
    print(msg);
  }
}
