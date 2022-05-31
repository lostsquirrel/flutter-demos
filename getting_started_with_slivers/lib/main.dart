import 'package:flutter/material.dart';

import 'scroll_behavior.dart';
import 'weekly_forecast_list.dart';

void main() {
  runApp(const HorizonsApp());
}

class HorizonsApp extends StatelessWidget {
  const HorizonsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horizons Weather',
      theme: ThemeData.dark(),
      scrollBehavior: const ConstantScrollBehavior(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Horizons"),
          backgroundColor: Colors.teal,
        ),
        body: const WeeklyForecastList(),
      ),
    );
  }
}
