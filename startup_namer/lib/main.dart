import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hello world',
      home: MaterialApp(
          title: 'Flutter Demo Home Page',
          home: Scaffold(
            appBar: AppBar(
              title: const Text("Welcome to Flutter"),
            ),
            body: const Center(
              child: Text("Hello Word!"),
            ),
          )),
    );
  }
}
