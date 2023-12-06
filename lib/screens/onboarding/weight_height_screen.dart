import 'package:brickbuilder/screens/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeightHeightScreen extends GetView<OnboardingController> {
  const WeightHeightScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OnboardingController>(
          init: OnboardingController(),
          initState: (_) {},
          builder: (controller) {
            return Container();
          }),
    );
  }
}