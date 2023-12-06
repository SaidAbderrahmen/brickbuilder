import 'package:brickbuilder/consts/assets.dart';
import 'package:brickbuilder/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final List<Map<String, dynamic>> genders = [
    {
      'gender': 'male',
      'text': 'I Am Male',
      'illustration': AppAssets.male,
      'color': AppColors.primaryColor,
      'icon': Icons.male_rounded
    },
    {
      'gender': 'female',
      'text': 'I Am Female',
      'illustration': AppAssets.female,
      'color': AppColors.linkColor,
      'icon': Icons.female_rounded
    },
    {
      'gender': 'other',
      'text': 'I Am Other',
      'illustration': AppAssets.other,
      'color': AppColors.purple,
      'icon': Icons.person_2_sharp,
    },
  ];
  Rx<Map<String, dynamic>> selectedGender = Rx<Map<String, dynamic>>({
    'gender': 'male',
    'text': 'I Am Male',
    'illustration': AppAssets.male,
    'color': AppColors.primaryColor,
    'icon': Icons.male_rounded
  });

  @override
  void onInit() {
    print(selectedGender);
    super.onInit();
  }
}
