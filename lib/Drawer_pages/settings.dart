import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/route/route.dart';
import 'package:travel_app/ui/widgets/setting_drawer_item.dart';

class SettingsScreen extends StatelessWidget {

  RxBool darkMode = false.obs;

  Future logOut(context) async{
    return showDialog(
        context: context,
        builder: (context)=> AlertDialog(
          title: Text("Are you sure to logOut ?"),
          content: Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text("Yes"),
              ),
              SizedBox(
                width: 10.w,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("No"),
              ),
            ],
          ),
        )
    );
  }

  Future changeLanguge(context) async{
    return showDialog(
        context: context,
        builder: (context)=> AlertDialog(
          title: Text("Select your language!"),
          content: Container(
            height: 200.h,
            child: Column(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text("Bangla"),
                ),
                SizedBox(
                  width: 10.w,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("English"),
                ),
              ],
            ),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding:  EdgeInsets.only(left: 25.w,right: 25.w,top: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dark Mode',style: TextStyle(
                  fontSize: 20.w,
                  fontWeight: FontWeight.w400
                ),),
                Obx(() => Switch(
                    value: darkMode.value,
                    onChanged: (bool value)
                  => darkMode.value = value,
                )),
              ],
            ),

            settingDrawerItem('Logout', ()=> logOut(context)),

            settingDrawerItem('Profile', ()=> Get.toNamed(userProfile)),

            settingDrawerItem('Languages', ()=> logOut(context)),

          ],
        ),
      ),
    );
  }
}