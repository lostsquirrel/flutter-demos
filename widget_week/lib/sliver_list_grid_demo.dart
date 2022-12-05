import 'package:flutter/material.dart';

class SliverListGridDemo extends StatelessWidget {
  const SliverListGridDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var colorSet = [
      Colors.red,
      Colors.blue,
      Colors.orange,
      Colors.green,
    ];
    var colorIndex = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text("SliverList SliverGrid Demo"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              ...List<int>.filled(50, 0)
                  .map((e) => Container(
                        color: colorSet[colorIndex++ % colorSet.length],
                        child: const Text("  x"),
                      ))
                  .toList()
            ]),
          ),
          SliverGrid.count(
            crossAxisCount: 5,
            children: [...List<int>.filled(50, 0)]
                .map<Widget>(
                  (e) => Container(
                    color: colorSet[colorIndex++ % colorSet.length],
                    child: const Text("  x"),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
