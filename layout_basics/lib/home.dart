import 'package:flutter/material.dart';

class RouteItem {
  final String displayName;
  final String routeName;

  RouteItem(this.displayName, this.routeName);
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  static const routeName = "/";

  final List<RouteItem> _routers = [
    RouteItem('MainAxisSize', '/main-axis-size'),
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
        child: Row(children: _buildRouters(context)),
      ),
    );
  }
}
