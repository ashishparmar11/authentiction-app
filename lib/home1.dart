import 'package:flutter/material.dart';

class Home1 extends StatelessWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('tap me page'),
        backgroundColor: Colors.blue,
      ),
      body: Text("Hello"),

    );
  }
}