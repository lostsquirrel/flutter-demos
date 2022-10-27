import 'package:flutter/material.dart';

class PageViewDemo extends StatelessWidget {
  const PageViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    int serial = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageViewDemo'),
      ),
      body: PageView(
        controller: controller,
        children: List<int>.filled(5, 0)
            .map<Widget>((e) => Center(
                  child: Text("Page ${serial++}"),
                ))
            .toList(),
      ),
    );
  }
}
