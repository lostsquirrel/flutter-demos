import 'dart:async';

import 'package:flutter/material.dart';

class StreamBuilderDemo extends StatefulWidget {
  const StreamBuilderDemo({super.key});

  @override
  State<StreamBuilderDemo> createState() => _StreamBuilderDemoState();
}

class _StreamBuilderDemoState extends State<StreamBuilderDemo> {
  final Stream<int> _bids = (() {
    late final StreamController<int> controller;
    const oneSec = Duration(seconds: 1);
    controller = StreamController<int>(
      onListen: () async {
        for (int i = 0; i < 5; i++) {
          await Future.delayed(oneSec);
          controller.add(i);
        }

        await Future.delayed(oneSec);
        controller.add(99);
        await controller.close();
      },
    );
    return controller.stream;
  })();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StreamBuilder Demo')),
      body: DefaultTextStyle(
        style: Theme.of(context).textTheme.displayMedium!,
        textAlign: TextAlign.center,
        child: Container(
          alignment: FractionalOffset.center,
          color: Colors.white,
          child: StreamBuilder<int>(
            stream: _bids,
            builder: ((BuildContext context, AsyncSnapshot<int> snapshot) {
              List<Widget> children;
              if (snapshot.hasError) {
                children = <Widget>[
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text('Stack trace: ${snapshot.stackTrace}'),
                  ),
                ];
              } else {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    children = const <Widget>[
                      Icon(
                        Icons.info,
                        color: Colors.blue,
                        size: 60,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Select a lot'),
                      ),
                    ];
                    break;
                  case ConnectionState.waiting:
                    children = const <Widget>[
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Awaiting bids...'),
                      ),
                    ];
                    break;
                  case ConnectionState.active:
                    children = <Widget>[
                      const Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                        size: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text('\$${snapshot.data}'),
                      ),
                    ];
                    break;
                  case ConnectionState.done:
                    children = <Widget>[
                      const Icon(
                        Icons.info,
                        color: Colors.blue,
                        size: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text('\$${snapshot.data} (closed)'),
                      ),
                    ];
                    break;
                }
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              );
            }),
          ),
        ),
      ),
    );
  }
}
