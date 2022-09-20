import 'package:flutter/material.dart';

class FaqScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQ"),
      ),
      body: Center(
        child: Text("We will show a PDF here"),
      ),
    );
  }
}