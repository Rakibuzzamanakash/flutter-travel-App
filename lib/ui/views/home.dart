import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/views/bottom_nav_controller.dart';
import 'package:travel_app/ui/views/drawer_screen.dart';


class HomePage extends StatelessWidget {

  Future _exitDialog(context) {
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title:  Text("Are you sure to close this app"),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: ()=>Get.back(),
                    child: Text("No")
                ),
                ElevatedButton(
                    onPressed: ()=>SystemNavigator.pop(),
                    child: Text("Yes")
                ),
              ],
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        _exitDialog(context);
        return Future.value(false);
      },
      child: Scaffold(
        body: Stack(
          children: [
            DrawerScreen(),
            BottomNavController(),
          ],
        ),
      ),
    );
  }
}
