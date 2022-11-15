import 'package:flutter/material.dart';

import 'common.dart';

class TableDemo extends StatefulWidget {
  const TableDemo({super.key});

  @override
  State<TableDemo> createState() => _TableDemoState();
}

class _TableDemoState extends State<TableDemo> {
  TableCellVerticalAlignment verticalAlign = TableCellVerticalAlignment.top;
  TableColumnWidth columnWidth = const FlexColumnWidth(1.0);
  static const columnWidths = [
    FlexColumnWidth(1.0),
    FractionColumnWidth(.25),
    FixedColumnWidth(30.0),
    IntrinsicColumnWidth(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Table demo'),
      ),
      body: Table(
          border: TableBorder.all(),
          textBaseline: TextBaseline.ideographic,
          defaultVerticalAlignment: verticalAlign,
          defaultColumnWidth: columnWidth,
          columnWidths: {
            1: FixedColumnWidth(150)
          },
          children: [
            const TableRow(children: [
              MySizedBox(width: 100, height: 100),
              MySizedBox(
                width: 100,
                height: 50,
              ),
              MySizedBox(
                width: 100,
                height: 50,
              ),
            ]),
            const TableRow(children: [
              MySizedBox(
                width: 50,
                height: 50,
              ),
              MySizedBox(
                width: 25,
                height: 50,
              ),
              MySizedBox(
                width: 50,
                height: 50,
              ),
            ]),
            TableRow(children: [
              Column(
                children: TableCellVerticalAlignment.values.map<Widget>((e) {
                  return ElevatedButton(
                    onPressed: () {
                      setState(() {
                        verticalAlign = e;
                      });
                    },
                    child: Text(e.name),
                  );
                }).toList(),
              ),
              Column(
                children: columnWidths.map((e) {
                  return ElevatedButton(
                    onPressed: () {
                      setState(() {
                        columnWidth = e;
                      });
                    },
                    child: Text(e.toString()),
                  );
                }).toList(),
              ),
              Column(),
            ]),
          ]),
    );
  }
}
