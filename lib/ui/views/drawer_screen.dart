import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';
import 'package:travel_app/const/app_string.dart';
import 'package:travel_app/ui/route/route.dart';

import '../widgets/drawer_item.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, top: 50.h, bottom: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppString.appName,
              style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w500),
            ),
            Text(
              'Travel Agency',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 20.h,
            ),
            DrawerItem('Support', () => Get.toNamed(supportScreen)),
            DrawerItem('privacy', () => Get.toNamed(privacyScreen)),
            DrawerItem('FAQ', () => Get.toNamed(faqScreen)),
            DrawerItem(
                'Rate US',
                () => LaunchReview.launch(
                      androidAppId: "com.example.travel_app",
                      iOSAppId: "585027354",
                      writeReview: false,
                      isiOSBeta: true,
                    )),
            DrawerItem('How to use', () => Get.toNamed(howtouseScreen)),
            Expanded(child: SizedBox()),
            InkWell(
              onTap: () => Get.toNamed(settingsScreen),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
