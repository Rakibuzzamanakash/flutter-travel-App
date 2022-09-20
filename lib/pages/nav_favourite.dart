import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavFavourite extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (_, index) {
            return Card(
              elevation: 3,
              child: Stack(
                children: [
                  Container(
                    height: 200.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/debtakhum.jpeg"),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 5,
                    child: CircleAvatar(
                      radius: 25.r,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.remove_circle,),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),

    );
  }
}
