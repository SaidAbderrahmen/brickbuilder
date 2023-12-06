import 'package:brickbuilder/consts/assets.dart';
import 'package:brickbuilder/consts/colors.dart';
import 'package:brickbuilder/consts/text.dart';
import 'package:brickbuilder/routes/app_routes.dart';
import 'package:brickbuilder/screens/onboarding/onboarding_controller.dart';
import 'package:brickbuilder/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class WelcomeScreen extends GetView<OnboardingController> {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: GetBuilder<OnboardingController>(
          init: OnboardingController(),
          initState: (_) {},
          builder: (controller) {
            return Stack(children: [
              Positioned(
                top: 290.h,
                left: 0,
                child: SvgPicture.asset(
                  AppAssets.background,
                ),
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.logo,
                      width: 164.w,
                      height: 132.h,
                    ),
                    SizedBox(height: 32.h),
                    Text.rich(
                      TextSpan(
                        text: "Welcome to \n",
                        style: AppTextStyle.headerText,
                        children: [
                          TextSpan(
                            text: "Brick",
                            style: AppTextStyle.headerText.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          TextSpan(
                            text: "Builder",
                            style: AppTextStyle.headerText,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Building Flavor, One Brik at a Time.",
                      style: AppTextStyle.descText,
                    ),
                    SizedBox(height: 32.h),
                    Image.asset(
                      AppAssets.welcome,
                      width: 282.w,
                      height: 255.h,
                    ),
                    SizedBox(height: 32.h),
                    PrimaryButton(
                      width: 250.w,
                      height: 56.h,
                      text: "Get Started",
                      icon: Icons.arrow_right_alt_rounded,
                      onTap: () => Get.toNamed(Routes.signUp),
                    ),
                    SizedBox(height: 32.h),
                    InkWell(
                      onTap: () => Get.toNamed(Routes.signIn),
                      child: Text.rich(
                        TextSpan(
                          text: "Already have an account? ",
                          style: AppTextStyle.infoText,
                          children: [
                            TextSpan(
                              text: "Sign In",
                              style: AppTextStyle.infoText.copyWith(
                                color: AppColors.linkColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]);
          }),
    );
  }
}
