import 'package:flutter/material.dart';

class FloatingActionButtonDemo extends StatefulWidget {
  const FloatingActionButtonDemo({super.key});

  @override
  State<FloatingActionButtonDemo> createState() =>
      _FloatingActionButtonDemoState();
}

class _FloatingActionButtonDemoState extends State<FloatingActionButtonDemo> {
  int currentPageIndex = 0;
  int locationIndex = 0;
  var locations = [
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
    FloatingActionButtonLocation.centerTop,
    FloatingActionButtonLocation.miniCenterDocked,
    FloatingActionButtonLocation.miniCenterFloat,
    FloatingActionButtonLocation.miniCenterTop,
    FloatingActionButtonLocation.endDocked,
    FloatingActionButtonLocation.endFloat,
    FloatingActionButtonLocation.endTop,
    FloatingActionButtonLocation.miniEndDocked,
    FloatingActionButtonLocation.miniEndFloat,
    FloatingActionButtonLocation.miniEndTop,
    FloatingActionButtonLocation.startDocked,
    FloatingActionButtonLocation.startFloat,
    FloatingActionButtonLocation.startTop,
    FloatingActionButtonLocation.miniStartDocked,
    FloatingActionButtonLocation.miniStartFloat,
    FloatingActionButtonLocation.miniStartTop,
  ];
  var buttonLabels = [
    "center",
    "miniCenter",
    "end",
    "miniEnd",
    "start",
    "miniStart",
  ];
  var pageLabels = ["Docked", "Float", "Top"];

  Widget buildBody() {
    return Column(
      children: [
        ...buttonLabels
            .map((e) => ElevatedButton(
                  onPressed: () {
                    var y = buttonLabels.indexOf(e) * 3 + currentPageIndex;
                    setState(() {
                      locationIndex = y;
                    });
                  },
                  child: Text("$e${pageLabels[currentPageIndex]}"),
                ))
            .toList(),
        Text(locations[locationIndex].toString())
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FloatingActionButton Demo'),
      ),
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: locations[locationIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
            locationIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dock),
            label: 'Docked',
          ),
          NavigationDestination(
            icon: Icon(Icons.circle_outlined),
            label: 'Float',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.start),
            icon: Icon(Icons.bookmark_border),
            label: 'Top',
          ),
        ],
      ),
    );
  }
}
