// import 'package:flutter/material.dart';
// import 'dart:io';

// void main() {
//   runApp(const ChatApp());
// }

// /// Flutter 聊天室客户端
// class ChatApp extends StatelessWidget {
//   const ChatApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: ChatPage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// /// 聊天主界面
// class ChatPage extends StatefulWidget {
//   const ChatPage({super.key});

//   @override
//   State<ChatPage> createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   late WebSocket _socket;
//   final List<String> _messages = []; // 聊天消息列表
//   final TextEditingController _controller = TextEditingController();

//   bool _isConnected = false;

//   @override
//   void initState() {
//     super.initState();
//     _connectToServer();
//   }

//   /// 连接 WebSocket 服务器
//   Future<void> _connectToServer() async {
//     try {
//       _socket = await WebSocket.connect('ws://localhost:8080');
//       setState(() {
//         _isConnected = true;
//       });
//       print('✅ 已连接 WebSocket 服务器');

//       // 监听服务器消息
//       _socket.listen((data) {
//         setState(() {
//           _messages.add("👤 对方: $data");
//         });
//       }, onDone: () {
//         print('⚠️ 服务器关闭');
//         setState(() {
//           _isConnected = false;
//         });
//       });
//     } catch (e) {
//       print('❌ 连接失败: $e');
//     }
//   }

//   /// 发送消息
//   void _sendMessage() {
//     if (_controller.text.isNotEmpty && _isConnected) {
//       final text = _controller.text.trim();
//       _socket.add(text);
//       setState(() {
//         _messages.add("😊 我: $text");
//         _controller.clear();
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _socket.close();
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("💬 Dart 聊天室")),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               padding: const EdgeInsets.all(10),
//               itemCount: _messages.length,
//               itemBuilder: (context, index) => Align(
//                 alignment: _messages[index].startsWith("😊")
//                     ? Alignment.centerRight
//                     : Alignment.centerLeft,
//                 child: Container(
//                   padding: const EdgeInsets.all(10),
//                   margin: const EdgeInsets.symmetric(vertical: 4),
//                   decoration: BoxDecoration(
//                     color: _messages[index].startsWith("😊")
//                         ? Colors.blue[200]
//                         : Colors.grey[300],
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Text(_messages[index]),
//                 ),
//               ),
//             ),
//           ),
//           const Divider(height: 1),
//           Row(
//             children: [
//               Expanded(
//                 child: TextField(
//                   controller: _controller,
//                   decoration: const InputDecoration(
//                     hintText: "输入消息...",
//                     contentPadding: EdgeInsets.symmetric(horizontal: 12),
//                   ),
//                   onSubmitted: (_) => _sendMessage(),
//                 ),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.send),
//                 onPressed: _sendMessage,
//                 color: Colors.blue,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
