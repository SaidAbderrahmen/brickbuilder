import 'package:brickbuilder/bindings/auth_binding.dart';
import 'package:brickbuilder/bindings/home_binding.dart';
import 'package:brickbuilder/bindings/onboarding_binding.dart';
import 'package:brickbuilder/screens/auth/sign_in.dart';
import 'package:brickbuilder/screens/auth/sign_up.dart';
import 'package:brickbuilder/screens/home/home_screen.dart';
import 'package:brickbuilder/screens/onboarding/diet_goals_screen.dart';
import 'package:brickbuilder/screens/onboarding/gender_screen.dart';
import 'package:brickbuilder/screens/onboarding/weight_height_screen.dart';
import 'package:brickbuilder/screens/onboarding/welcome_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.welcome,
      page: () => const WelcomeScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: Routes.gender,
      page: () => const GenderScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: Routes.weightHeight,
      page: () => const WeightHeightScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: Routes.dietGoals,
      page: () => const DietGoalsScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: Routes.signIn,
      page: () => const SignInScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUp,
      page: () => const SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
