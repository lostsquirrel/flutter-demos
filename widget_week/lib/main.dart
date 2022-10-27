import 'package:flutter/material.dart';

import 'items.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Widget of the Week'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildIndexItem(context),
        ),
      ),
    );
  }

  List<Widget> _buildIndexItem(BuildContext context) {
    var serial = items.length;
    var list = items.entries.map<Widget>((entry) {
      return ElevatedButton(
        child: Text("${serial--} ${entry.key}"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => entry.value),
          );
        },
      );
    }).toList();
    return list;
  }
}
