import 'package:flutter/material.dart';
import 'package:widget_week/safe_area.dart';

import 'animated_container_demo.dart';
import 'buture_builder_demo.dart';
import 'expanded_demo.dart';
import 'opacity_demo.dart';
import 'wrap_demo.dart';

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
  static const items = {
    "FutureBuilder": FutureBuilderDemo(),
    "Opacity": OpacityDemo(),
    "AnimatedContainer": AnimatedContainerDemo(),
    "Wrap": WrapDemo(),
    "Expanded": ExpandedDemo(),
    "SafeArea": SafeAreaHome(),
  };
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
    var list = items.entries.map<Widget>((entry) {
      return ElevatedButton(
        child: Text(entry.key),
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
