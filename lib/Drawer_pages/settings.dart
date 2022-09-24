import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:travel_app/business_logics/auth.dart';
import 'package:travel_app/theme/app_theme.dart';
import 'package:travel_app/ui/route/route.dart';
import 'package:travel_app/ui/widgets/setting_drawer_item.dart';

class SettingsScreen extends StatefulWidget {

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // RxBool darkMode = false.obs;

  final _themeData = GetStorage();

  bool _isdarkMode = false;

  @override
  void initState() {
    super.initState();
    _themeData.writeIfNull('darkmode', false);
    _isdarkMode = _themeData.read('darkmode');

  }

  // Future logOut(context) async{
  //   return showDialog(
  //       context: context,
  //       builder: (context)=> AlertDialog(
  //         title: Text("Are you sure to logOut ?"),
  //         content: Row(
  //           children: [
  //             ElevatedButton(
  //               onPressed: () {},
  //               child: Text("Yes"),
  //             ),
  //             SizedBox(
  //               width: 10.w,
  //             ),
  //             ElevatedButton(
  //               onPressed: () {},
  //               child: Text("No"),
  //             ),
  //           ],
  //         ),
  //       )
  //   );
  // }

  Future changeLanguge(context) async{
    return showDialog(
        context: context,
        builder: (context)=> AlertDialog(
          title: Text("Select your language!"),
          content: Container(
            height: 150.h,
            child: Column(
              children: [
                TextButton(
                  onPressed: (){
                    Get.updateLocale(
                      const Locale('bn','BD'),
                    );
                    _themeData.write('language', 'bn');
                    _themeData.write('country', 'BD');
                    Get.back();
                  },
                  child: Text("Bangla"),
                ),
                SizedBox(
                  width: 10.w,
                ),
                TextButton(
                  onPressed: () {
                    Get.updateLocale(
                        const Locale('en', 'US')
                    );
                    _themeData.write('language', 'en');
                    _themeData.write('country', 'US');
                    Get.back();
                  },
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
                Text('darkMode'.tr,style: TextStyle(
                  fontSize: 20.w,
                  fontWeight: FontWeight.w400
                ),),
                Switch(
                    value: _isdarkMode,
                    onChanged: (value){
                      setState(() {
                        _isdarkMode = value;
                      });
                      _isdarkMode?Get.changeTheme(AppTheme().darkTheme())
                          :Get.changeTheme(AppTheme().lightTheme());

                      _themeData.write('darkmode', value);

                      // darkMode.value = value;
                      // Get.changeTheme(
                      //     darkMode.value == false
                      //         ?AppTheme().lightTheme(context)
                      //         :AppTheme().darkTheme(context)
                      // );
                      // box.write("themeMode", darkMode.value);
                    }

                ),
              ],
            ),

            settingDrawerItem('logout'.tr, ()=> Auth().logOut(context)),

            settingDrawerItem('Profile'.tr, ()=> Get.toNamed(userProfile)),

            settingDrawerItem('languages'.tr, ()=> changeLanguge(context)),

          ],
        ),
      ),
    );
  }
}