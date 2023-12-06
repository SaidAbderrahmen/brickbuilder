import 'package:brickbuilder/consts/colors.dart';
import 'package:brickbuilder/routes/app_pages.dart';
import 'package:brickbuilder/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // await initServices();
  runApp(const MyApp());
}

initServices() async {
  await Future.delayed(const Duration(seconds: 4));

  // FlutterNativeSplash.remove();
//   // await Get.putAsync(() => SharedPreferenceService().init());
//   // await Get.putAsync(() => DbService().init());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.backgroundColor,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.noTransition,
          initialRoute: Routes.welcome,
          getPages: AppPages.pages,
        );
      },
    );
  }
}
