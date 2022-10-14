import 'package:flutter/material.dart';

ListView _buildListView() {
  return ListView(
    children: List.generate(
      100,
      (i) => const Text('This is some text'),
    ),
  );
}

class SafeAreaHome extends StatelessWidget {
  const SafeAreaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SafeArea Demo"),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SafeAreaPage()));
                },
                child: const Icon(
                  Icons.arrow_right,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: Center(
        child: _buildListView(),
      ),
    );
  }
}

class SafeAreaPage extends StatelessWidget {
  const SafeAreaPage({super.key});

  @override
  Widget build(BuildContext context) {
    var safeListView = SafeArea(
      child: _buildListView(),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wraped with SafeArea'),
      ),
      body: Center(
        child: safeListView,
      ),
    );
  }
}
