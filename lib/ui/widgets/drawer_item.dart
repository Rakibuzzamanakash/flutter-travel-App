import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget DrawerItem(String itemName,onClick){
return InkWell(
  onTap: onClick,
  child:   Text(itemName,style: TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400
  ),),
);
}