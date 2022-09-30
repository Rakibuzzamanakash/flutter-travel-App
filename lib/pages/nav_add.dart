import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_app/pages/nav_add_last_step.dart';
import 'package:travel_app/ui/route/route.dart';

import '../ui/widgets/custom_text_field.dart';
import '../ui/widgets/violetButton.dart';

class NavAdd extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _facilityController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h),
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
                CustomTextField("Owner Name", _nameController),
                CustomTextField("Description", _descriptionController),
                CustomTextField("Cost", _costController),
                CustomTextField("Facilities", _facilityController, maxline: 4),
                CustomTextField(
                  "Destination",
                  _destinationController,
                ),
                VioletButton(
                  "Next",
                  () => Get.toNamed(navAddLastStep,
                      arguments: NavAddLastStep(
                          name: _nameController.text,
                          description: _descriptionController.text,
                          cost: _costController.text,
                          facility: _facilityController.text,
                          destination: _destinationController.text)),
                ),
              ],
            )),
      ),
    );
  }
}
