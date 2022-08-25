import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/ui/widgets/violetButton.dart';

class PrivacyPoliacy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.only(left: 30.w,right: 30.w,top: 20.h),
          child: Column(
            children: [
              Expanded(child: Container(color: Colors.green,)),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 10.h),
                child: VioletButton("Agree", (){}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
