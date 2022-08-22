import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_app/const/app_colors.dart';
import 'package:travel_app/ui/style/style.dart';

class OnboardingScreen extends StatelessWidget {
  List<String> _lottieFiles = [
    'assets/files/category.json',
    'assets/files/support.json',
    'assets/files/welcome.json',
  ];

  List<String> _title = [
    'Category',
    'Support',
    'Welcome',
  ];

  List<String> _description = [
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
  ];

  RxInt _currentIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          children: [
            Obx(
              () => Expanded(
                flex: 2,
                child: Lottie.asset(_lottieFiles[_currentIndex.toInt()]),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.scaffoldColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(4.0, 4.0),
                            blurRadius: 10,
                            spreadRadius: 1.0),
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4.0, -4.0),
                            blurRadius: 5,
                            spreadRadius: 1.0),
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(30.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() => Text(
                              "${_title[_currentIndex.toInt()]}",
                              style: AppStyles().myTextStyle,
                            )),
                        Text("${_description[_currentIndex.toInt()]}"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(() => DotsIndicator(
                                  dotsCount: _lottieFiles.length,
                                  position: _currentIndex.toDouble(),
                                  decorator: DotsDecorator(
                                    size: Size(10, 10),
                                    activeSize: Size(13, 13),
                                      color: Colors.grey,
                                      activeColor: Colors.black),
                                )),
                            InkWell(
                              onTap: () {
                                if (_currentIndex == _title.length - 1) {
                                  print("Finshed");
                                }else{
                                  _currentIndex + 1;
                                }
                              },
                              child: Container(
                                height: 37.h,
                                width: 37.w,
                                decoration: BoxDecoration(
                                    color: AppColors.scaffoldColor,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(4.0, 4.0),
                                          blurRadius: 10,
                                          spreadRadius: 1.0),
                                      BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(-4.0, -4.0),
                                          blurRadius: 5,
                                          spreadRadius: 1.0),
                                    ]),
                                    child: Icon(
                                      Icons.arrow_forward
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
