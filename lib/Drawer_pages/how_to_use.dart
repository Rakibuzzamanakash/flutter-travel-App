import 'package:flutter/material.dart';

class HowToUseScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("How to use"),
      ),
      body: Center(
        child: Text("Will show a Video Player"),
      ),
    );
  }
}