import 'package:flutter/material.dart';
import 'package:layout_basics/main_axis_alignment_demo.dart';
import 'package:layout_basics/main_axis_size_demo.dart';

import 'cross_axis_alignment_demo.dart';
import 'flexible_demo.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Home.routeName: (context) => Home(),
        MainAxisSizeDemo.routeName: (context) => const MainAxisSizeDemo(),
        MainAxisAlignmentDemo.routeName: (context) =>
            const MainAxisAlignmentDemo(),
        CrossAxisAlignmentDemo.routeName: (context) =>
            const CrossAxisAlignmentDemo(),
        FlexibleDemo.routeName: (context) => const FlexibleDemo()
      },
    );
  }
}
