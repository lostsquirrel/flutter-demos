import 'package:flutter/material.dart';

class SliverListGridDemo extends StatelessWidget {
  const SliverListGridDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var colorSet = [
      Colors.red,
      Colors.orange,
      Colors.blue,
      Colors.green,
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("SliverList SliverGrid Demo"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              ...[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                  .map((e) => Container(
                        color: colorSet[e % 3],
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
                    color: colorSet[e % 3],
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
