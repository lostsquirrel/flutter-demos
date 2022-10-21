import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Meow {
  final String file;

  const Meow(this.file);

  factory Meow.fromJson(Map<String, dynamic> json) {
    return Meow(json['file']);
  }
}

class FutureBuilderDemo extends StatelessWidget {
  const FutureBuilderDemo({super.key});
  Future<Meow> meow() async {
    var resp = await http.get(Uri.parse("https://aws.random.cat/meow"));
    return Meow.fromJson(jsonDecode(resp.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuilderDemo'),
      ),
      body: Center(
          child: FutureBuilder(
        future: meow(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }
            return Image.network(
              snapshot.data.file,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return CircularProgressIndicator(
                  color: Colors.orangeAccent,
                  value: loadingProgress!.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!.toInt()
                      : null,
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      )),
    );
  }
}
