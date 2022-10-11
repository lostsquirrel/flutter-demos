import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    var listView = ListView(
      children: List.generate(
        100,
        (i) => const Text('This is some text'),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondRoute()));
                },
                child: const Icon(
                  Icons.arrow_right,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: Center(
        child: listView,
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    var listView = ListView(
      children: List.generate(
        100,
        (i) => const Text('This is some text'),
      ),
    );
    var safeListView = SafeArea(
      child: listView,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: safeListView,
      ),
    );
  }
}
