import 'package:flutter/material.dart';

void main() {
  runApp(const ChatScreen());
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FriendlyChat',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("FriendlyChat"),
        ),
      ),
    );
  }
}
