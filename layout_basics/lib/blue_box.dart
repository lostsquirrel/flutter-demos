import 'package:flutter/material.dart';

class BlueBox extends StatelessWidget {
  const BlueBox({Key? key, this.width = 50, this.height = 50})
      : super(key: key);
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(),
      ),
    );
  }
}

List<BlueBox> buildBoxList() =>
    [1, 2, 3].map<BlueBox>((e) => const BlueBox()).toList();
