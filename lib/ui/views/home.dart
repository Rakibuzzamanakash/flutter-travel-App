import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("home page"),
            ElevatedButton(
                onPressed: () {
                  print('hjjk');
                  //check();
                },
                child: Text("tap"))
          ],
        ),
      ),
    );
  }
}
