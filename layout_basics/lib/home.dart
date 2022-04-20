import 'package:flutter/material.dart';
import 'package:layout_basics/main_axis_alignment_demo.dart';

import 'cross_axis_alignment_demo.dart';
import 'main_axis_size_demo.dart';

class RouteItem {
  final String displayName;
  final String routeName;

  RouteItem(this.displayName, this.routeName);
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  static const routeName = "/";

  final List<RouteItem> _routers = [
    RouteItem(MainAxisSizeDemo.displayName, MainAxisSizeDemo.routeName),
    RouteItem(
        MainAxisAlignmentDemo.displayName, MainAxisAlignmentDemo.routeName),
    RouteItem(
        CrossAxisAlignmentDemo.displayName, CrossAxisAlignmentDemo.routeName),
  ];

  List<TextButton> _buildRouters(BuildContext context) {
    return _routers.map<TextButton>((RouteItem item) {
      return TextButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            item.routeName,
          );
        },
        child: Text(item.displayName),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(children: _buildRouters(context)),
      ),
    );
  }
}
