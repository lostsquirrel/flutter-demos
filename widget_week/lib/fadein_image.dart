import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'image.dart';

class FadeInImageDemo extends StatelessWidget {
  const FadeInImageDemo({super.key});
  static const url = "https://w.wallhaven.cc/full/zy/wallhaven-zyxvqy.jpg";
  @override
  Widget build(BuildContext context) {
    Uint8List bytes = const Base64Decoder().convert(ship);
    return Scaffold(
      appBar: AppBar(
        title: const Text("FadeInImageDemo"),
      ),
      body: FadeInImage(
          placeholder: MemoryImage(bytes), image: const NetworkImage(url)),
    );
  }
}
