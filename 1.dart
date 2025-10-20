// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// /// 根组件
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter 计数器',
//       theme: ThemeData(
//         primarySwatch: Colors.blue, // 设置主题色
//       ),
//       home: const CounterPage(), // 指定主页
//     );
//   }
// }

// /// 计数器页面（有状态组件）
// class CounterPage extends StatefulWidget {
//   const CounterPage({super.key});

//   @override
//   State<CounterPage> createState() => _CounterPageState();
// }

// class _CounterPageState extends State<CounterPage> {
//   int _count = 0; // 定义状态变量

//   /// 点击按钮时执行的函数
//   void _increment() {
//     setState(() {
//       _count++; // 状态 +1 并触发界面重绘
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('计数器示例'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               '你已经点击按钮的次数：',
//               style: TextStyle(fontSize: 20),
//             ),
//             Text(
//               '$_count', // 展示计数值
//               style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _increment, // 绑定点击事件
//         tooltip: '增加计数',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
