import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:travel_app/business_logics/form.dart';
import 'package:travel_app/ui/route/route.dart';
import 'package:travel_app/ui/widgets/custom_form_field.dart';
import 'package:travel_app/ui/widgets/violetButton.dart';

import '../../const/app_colors.dart';

class UserForm extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  Rx<TextEditingController> _dobController = TextEditingController().obs;
  String? dob;
  String gender = 'Male';
  Rx<DateTime> selectedDate = DateTime.now().obs;

  _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
        context: context,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2025));

    if (selected != null && selected != selectedDate) {
      dob = "${selected.day} - ${selected.month} - ${selected.year}";
      _dobController.value.text = dob!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 80.h),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tell Us More About You.',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 31.sp,
                      color: AppColors.violetColor,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'We will not share your information outside this application.',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                  CustomFormField(
                      _nameController, TextInputType.name, "Full Name",
                      (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'[a-zA-Z]').hasMatch(value)) {
                      return "Enter correct name";
                    } else {
                      return null;
                    }
                  }
                  ),

                  CustomFormField(
                      _phoneController, TextInputType.phone, "Phone Number",
                      (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')
                            .hasMatch(value)) {
                      return "Enter correct phone";
                    } else {
                      return null;
                    }
                  }
                  ),
                  CustomFormField(
                    _addressController,
                      TextInputType.streetAddress, "Address",
                          (value) {
                    if (value!.isEmpty) {
                      return "Enter correct address";
                    } else {
                      return null;
                    }
                  }
                  ),
                  Obx(() => TextFormField(
                        controller: _dobController.value,
                        readOnly: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter date of birth";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Date of Birth",
                          hintStyle: TextStyle(
                            fontSize: 15.sp,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () => _selectDate(context),
                              icon: Icon(Icons.calendar_today)),
                        ),
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  ToggleSwitch(
                    initialLabelIndex: 0,
                    totalSwitches: 2,
                    labels: [
                      'Male',
                      'Female',
                    ],
                    onToggle: (index) {
                      if (index == 0) {
                        gender = 'Male';
                      } else {
                        gender = 'Female';
                      }
                      print('switched to: $index');
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  VioletButton("Submit", () {
                    if (formKey.currentState!.validate()) {
                      return UserInfo().sendFormDataToDB(
                          _nameController.text,
                          int.parse(_phoneController.text),
                          _addressController.text,
                          dob!,
                          gender);

                      // return Get.toNamed(homePage);
                    }
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
