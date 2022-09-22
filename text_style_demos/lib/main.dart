import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = "TextStyle Demo";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: _title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'default text style',
            ),
            const Text(
              'Color Blue',
              style: TextStyle(color: Colors.blue),
            ),
            Text(
              'Theme.textTheme.headline4',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              "Modify on Theme",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    backgroundColor: Colors.black26,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
