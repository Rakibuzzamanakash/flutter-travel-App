import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_app/const/app_string.dart';
import 'package:travel_app/ui/route/route.dart';
import 'package:travel_app/ui/style/style.dart';

class SplashScreen extends StatefulWidget {
  

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),()=> Get.toNamed(onboarding));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo/logo 1.png",
                height: 300.h,
              ),
              Text(
                AppString.appName,
                style: AppStyles().myTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
