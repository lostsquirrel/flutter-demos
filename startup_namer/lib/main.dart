import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

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
              child: RandomWords(),
            ),
          )),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Container(
      child: Text(wordPair.asPascalCase),
    );
  }
}
