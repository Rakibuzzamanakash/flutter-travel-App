import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/ui/views/bottom_nav_controller.dart';
import 'package:travel_app/ui/views/drawer_screen.dart';


class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          BottomNavController(),
        ],
      ),
    );
  }
}
