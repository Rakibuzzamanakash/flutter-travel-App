import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:travel_app/const/app_colors.dart';

class VioletButton extends StatelessWidget {
  String title;
  final Function onAction;
  VioletButton(this.title, this.onAction);
  RxBool _value = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
          onTap: () {
            _value.value = true;
            onAction();
          },
          child: Container(
            height: 45.h,
            decoration: BoxDecoration(
              color: AppColors.violetColor,
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
            ),
            child: _value == false
                ? Center(
                    child: Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 17.sp),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Please Wait",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 17.sp),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Transform.scale(
                          scale: .5,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          )),
                    ],
                  ),
          ),
        ));
  }
}
