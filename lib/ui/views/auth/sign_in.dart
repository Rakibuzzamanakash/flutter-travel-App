import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_app/business_logics/auth.dart';
import 'package:travel_app/const/app_colors.dart';
import 'package:travel_app/ui/route/route.dart';
import 'package:travel_app/ui/style/style.dart';
import 'package:travel_app/ui/widgets/violetButton.dart';

class SignIn extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
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
                    'Login\nTo Your Account',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 36.sp,
                      color: AppColors.violetColor,
                    ),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: AppStyles().textFieldDecoration("E-mail Address"),
                    validator: (value){
                      if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)){
                           return "Enter correct email";
                      }else{
                        return  null;
                      }
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: AppStyles().textFieldDecoration("Enter Password"),
                    validator: (value){
                      if(value!.isEmpty ){
                        if(value!.length<= 6){
                          return "Your password is too short";
                        }
                        return "Please enter valid password";
                      }else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  VioletButton("Login",()=> Auth().
                  logIn(_emailController.text, _passwordController.text, context)),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Text(
                      '--OR--',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset("assets/icons/googleicon.png")),
                      SizedBox(
                        height: 10.h,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset("assets/icons/facebook 1.png")),
                    ],
                  ),
                  SizedBox(
                        height: 10.h,
                      ),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Don’t have registered yet?  ",
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              TextSpan(
                                text: "Sign Up",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.violetColor
                                ),
                                recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(signup) ,
                              ),
                            ]
                            ),
                        ),
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
