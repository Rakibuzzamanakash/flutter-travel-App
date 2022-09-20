import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/route/route.dart';
import 'package:travel_app/ui/widgets/nav_home_categories.dart';

class NavHome extends StatelessWidget {

  final List _carouselImage = [
    'assets/images/cover-one.jpeg',
    'assets/images/cover-two.jpeg',
    'assets/images/cover-three.jpeg'
  ];

  final RxInt _currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 10.h,),
            AspectRatio(
                aspectRatio: 3.5,
                child: CarouselSlider(
                    items: _carouselImage.map((image){
                      return Container(
                        margin: EdgeInsets.only(left: 10.w),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          image: DecorationImage(image: AssetImage(image),
                          fit: BoxFit.cover
                          )
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 300.h,
                      onPageChanged: (currentIndex,customPageChangedReason){
                        _currentIndex.value = currentIndex;
                      }
                    )
                ),
            ),

            SizedBox(height: 5.h,),

            Obx(() => DotsIndicator(
              dotsCount: _carouselImage.length,
              position: _currentIndex.value.toDouble(),
            )),

            Padding(
              padding:  EdgeInsets.only(left: 20.w,right: 20.w,top: 10.h,bottom: 10.h),
              child: InkWell(
                onTap: ()=>Get.toNamed(searchScreen),
                child: Container(
                  height: 45.h,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(6.r)),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(left: 20.w),
                    child: Row(
                      children: [
                        Icon(Icons.search_outlined,size: 20.w),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text("Search for your next tour",
                    style: TextStyle(fontSize: 15.sp),)
                      ],
                    ),
                  ),
                ),
              ),
            ),

            navHomeCategories('For You', ()=> Get.toNamed(seeAllScreen)),


            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 10.w),
              child: forYou(),
            ),
            SizedBox(
              height: 15.h,
            ),
            navHomeCategories(
              "Recently Added",
                  ()=>Get.toNamed(seeAllScreen),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: recentlyAdded(),
            ),
            SizedBox(
              height: 15.h,
            ),
            navHomeCategories(
              "Top Places",
                  ()=>Get.toNamed(seeAllScreen),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: topPlaces(),
            ),

            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }
}



Widget forYou() {
  return Container(
    height: 180.h,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (_, index) {
        return Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: InkWell(
            onTap: ()=>Get.toNamed(detailsScreen),
            child: Container(
              width: 120.w,
              height: 180.h,
              decoration: BoxDecoration(
                color: Color(0xFfC4C4C4),
                borderRadius: BorderRadius.all(
                  Radius.circular(7.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7.r),
                        topRight: Radius.circular(7.r),
                      ),
                      child: Image.asset(
                        "assets/images/debtakhum.jpeg",
                        height: 115.h,
                        fit: BoxFit.cover,
                      )),
                  Text(
                    "Title",
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  Text(
                    "Cost",
                    style:
                    TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}

Widget recentlyAdded() {
  return Padding(padding: EdgeInsets.only(right: 12.w),
  child: InkWell(
    onTap: ()=>Get.toNamed(detailsScreen),
    child: Container(
      height: 180.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Container(
              width: 120.w,
              height: 180.h,
              decoration: BoxDecoration(
                color: Color(0xFfC4C4C4),
                borderRadius: BorderRadius.all(
                  Radius.circular(7.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7.r),
                        topRight: Radius.circular(7.r),
                      ),
                      child: Image.asset(
                        "assets/images/debtakhum.jpeg",
                        height: 115.h,
                        fit: BoxFit.cover,
                      )),
                  Text(
                    "Title",
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  Text(
                    "Cost",
                    style:
                    TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
  ),
  );
}

Widget topPlaces() {
  return Padding(
    padding:  EdgeInsets.only(right: 12.w),
    child: InkWell(
      onTap: ()=>Get.toNamed(detailsScreen),
      child: Container(
        height: 80.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (_, index) {
            return Padding(
              padding: EdgeInsets.only(right: 5.w),
              child: Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                  color: Color(0xFfC4C4C4),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/images/debtakhum.jpeg"),
                      fit: BoxFit.cover),
                ),
              ),
            );
          },
        ),
      ),
    ),
  );
}
