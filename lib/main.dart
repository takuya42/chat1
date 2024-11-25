import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = '';
  String room = '';

  //エラー処理
  void showError(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
        );
      },
    );
  }

  //入室処理
  void enter() {
    if (name.isEmpty) {
      showError('あなたの名前を入力してください。');
      return;
    }
    if (room.isEmpty) {
      showError('ルーム名を入力してください。');
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ChatPage(name: name, room: room);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('チャット'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: TextField(
              decoration: const InputDecoration(hintText: 'あなたの名前'),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
          ),
          ListTile(
            title: TextField(
              decoration: const InputDecoration(hintText: 'ルーム名'),
              onChanged: (value) {
                setState(() {
                  room = value;
                });
              },
            ),
          ),
          ListTile(
            title: ElevatedButton(
              onPressed: enter,
              child: const Text('入室する'),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  const ChatPage({required this.name, required this.room, super.key});

  final String name;
  final String room;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(room),
      ),
      body: Center(
        child: Text(''),
      ),
    );
  }
}
