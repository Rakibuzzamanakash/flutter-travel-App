import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/route/route.dart';

import '../ui/widgets/custom_text_field.dart';
import '../ui/widgets/violetButton.dart';

class NavAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.only(left: 25.w,right: 25.w,top: 10.h),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Text(
                  "If you have any problems, please contact us. We are at your service all the time.",
                  style: TextStyle(
                    fontSize: 24.sp,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField("Owner Name"),
                CustomTextField("Description"),
                CustomTextField("Cost"),
                CustomTextField("Facilities", maxline: 4),
                CustomTextField("Destination",),
                VioletButton("Next", ()=>Get.toNamed(navAddLastStep),),
              ],
            )
        ),
      ),
    );
  }
}
