
import 'package:brickbuilder/consts/colors.dart';
import 'package:brickbuilder/consts/text.dart';
import 'package:brickbuilder/routes/app_routes.dart';
import 'package:brickbuilder/screens/onboarding/onboarding_controller.dart';
import 'package:brickbuilder/widgets/buttons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GenderScreen extends GetView<OnboardingController> {
  const GenderScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: const OnboardingAppBar(),
      ),
      body: GetBuilder<OnboardingController>(
          init: OnboardingController(),
          initState: (_) {},
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      Text(
                        'What is your Gender?',
                        style: AppTextStyle.headerText,
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        'Please select your gender for better personalized meal experience.',
                        style: AppTextStyle.descText,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 60.h),
                    ],
                  ),
                ),
                CarouselSlider.builder(
                    options: CarouselOptions(
                        height: 328.h,
                        viewportFraction: 0.6,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        autoPlay: false,
                        enlargeFactor: 0.2,
                        onPageChanged: (index, reason) => controller
                            .selectedGender.value = controller.genders[index]),
                    itemCount: controller.genders.length,
                    itemBuilder: (context, index, realIndex) {
                      var gender = controller.genders[index];
                      return GenderCard(
                        gender: gender,
                        controller: controller,
                      );
                    }),
                SizedBox(height: 60.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Prefer to skip this',
                            style: AppTextStyle.buttonText.copyWith(
                              color: AppColors.textColor,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Icon(
                            Icons.arrow_right_alt_rounded,
                            size: 24.sp,
                            color: AppColors.textColor,
                          )
                        ],
                      ),
                      SizedBox(height: 20.h),
                      PrimaryButton(
                        width: 327.w,
                        height: 56.h,
                        text: "Continue",
                        icon: Icons.arrow_right_alt_rounded,
                        onTap: () => Get.toNamed(Routes.gender),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    required this.gender,
    required this.controller,
  });
  final OnboardingController controller;
  final Map<String, dynamic> gender;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 328.h,
      width: 257.w,
      decoration: BoxDecoration(
        color: gender['color'],
        borderRadius: BorderRadius.circular(12.r),
        image: DecorationImage(
          image: AssetImage(gender['illustration']),
          fit: BoxFit.scaleDown,
          alignment: Alignment.bottomRight,
        ),
      ),
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              gender['icon'],
              color: AppColors.teritaryColor,
              size: 26.sp,
            ),
            Text(
              gender['text'],
              style: AppTextStyle.descText.copyWith(
                color: AppColors.teritaryColor,
              ),
            ),
            Obx(
              () => Checkbox(
                value: gender == controller.selectedGender.value,
                onChanged: (value) {
                  // controller.isMale = value!;
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.r),
                ),
                // add white border when checked and unchecked with no fill color
                side: BorderSide(
                  color: AppColors.teritaryColor,
                  width: 1.w,
                ),
                activeColor: AppColors.teritaryColor,
                checkColor: gender['color'],
                visualDensity: VisualDensity.compact,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingAppBar extends StatelessWidget {
  const OnboardingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100.h,
        titleSpacing: 0,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: Get.back,
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: AppColors.textColor,
                  size: 24.sp,
                ),
              ),
              SizedBox(
                width: 168.w,
                child: LinearProgressIndicator(
                  value: 0.2,
                  backgroundColor: AppColors.secondaryColor,
                  color: AppColors.textColor,
                  minHeight: 8.h,
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Skip", style: AppTextStyle.descText),
              ),
            ],
          ),
        ));
  }
}
