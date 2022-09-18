import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_app/const/app_string.dart';

import '../../pages/nav_add.dart';
import '../../pages/nav_favourite.dart';
import '../../pages/nav_home.dart';

class BottomNavController extends StatelessWidget {
  RxInt _currentIndex = 0.obs;
  RxBool _drawer = false.obs;

  final _pages = [
    NavHome(),
    NavAdd(),
    NavFavourite(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedPositioned(
          top: _drawer == false ? 0 : 100.h,
          bottom: _drawer == false ? 0 : 100.h,
          left: _drawer == false ? 0 : 200.w,
          right: _drawer == false ? 0 : -100.w,
          duration: Duration(milliseconds: 500),
          child: Container(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: _drawer.value == false
                    ? IconButton(
                        onPressed: () {
                          _drawer.value = true;
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.black45,
                        ))
                    : IconButton(
                        onPressed: () {
                          _drawer.value = false;
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.black45,
                        )),
                title: Text(AppString.appName),
              ),
              bottomNavigationBar: BottomNavigationBar(
                  onTap: (value) => _currentIndex.value = value,
                  currentIndex: _currentIndex.value,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home_outlined), label: "Home"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.add_outlined), label: "Add"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.favorite_outline), label: "Favorite"),
                  ]),
              body: _pages[_currentIndex.value],
            ),
          ),
        ));
  }
}
