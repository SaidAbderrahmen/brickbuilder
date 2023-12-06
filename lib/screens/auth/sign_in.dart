import 'package:brickbuilder/consts/colors.dart';
import 'package:brickbuilder/consts/text.dart';
import 'package:brickbuilder/routes/app_routes.dart';
import 'package:brickbuilder/screens/auth/auth_controller.dart';
import 'package:brickbuilder/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInScreen extends GetView<AuthController> {
  const SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.black,
              size: 24.sp,
            ),
            onPressed: () => Get.back(),
          )),
      backgroundColor: AppColors.backgroundColor,
      body: GetBuilder<AuthController>(
          init: AuthController(),
          initState: (_) {},
          builder: (controller) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Text("Sign In", style: AppTextStyle.headerText),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Sign in and get your health personalized with our AI Technology.",
                      style: AppTextStyle.descText,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            style: AppTextStyle.headerText
                                .copyWith(fontSize: 16.sp),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelStyle: AppTextStyle.headerText
                                  .copyWith(fontSize: 16.sp),
                              labelText: "Email Address",
                              hintText: "Enter your email",
                              hintStyle: AppTextStyle.descText,
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.alternate_email_sharp,
                                size: 24.sp,
                                color: Colors.black,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your email address";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            style: AppTextStyle.headerText
                                .copyWith(fontSize: 16.sp),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelStyle: AppTextStyle.headerText
                                  .copyWith(fontSize: 16.sp),
                              labelText: "Password",
                              hintText: "Enter your password",
                              hintStyle: AppTextStyle.descText,
                              prefixIcon: Icon(
                                Icons.lock_sharp,
                                size: 24.sp,
                                color: Colors.black,
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          PrimaryButton(
                              width: 327.w,
                              height: 56.h,
                              text: "Sign In",
                              onTap: () => Get.toNamed(Routes.home),
                              icon: Icons.person_3_sharp),
                          const SizedBox(
                            height: 60,
                          ),
                          InkWell(
                            onTap: () => Get.toNamed(Routes.signUp),
                            child: RichText(
                              text: TextSpan(
                                text: "Don't have an account? ",
                                style: AppTextStyle.infoText,
                                children: [
                                  TextSpan(
                                    text: "Sign Un",
                                    style: AppTextStyle.infoText.copyWith(
                                      color: AppColors.linkColor,
                                      //link
                                      decoration: TextDecoration.underline,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
