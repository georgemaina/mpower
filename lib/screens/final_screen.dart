import 'package:flutter/material.dart';

class FinalScreen extends StatelessWidget {
  //const FinalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id=ModalRoute.of(context)!.settings.arguments as FinalScreen;
    return Scaffold(
      appBar: AppBar(
        title: Text("Final Defaulter Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text("Hello there"),
      ),
    );
  }
}

