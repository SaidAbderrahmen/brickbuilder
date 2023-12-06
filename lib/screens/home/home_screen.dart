import 'package:brickbuilder/consts/colors.dart';
import 'package:brickbuilder/consts/text.dart';
import 'package:brickbuilder/screens/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: GetBuilder<HomeController>(
          init: HomeController(),
          initState: (_) {},
          builder: (controller) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 20.w, right: 20.w, bottom: 20.h),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi " + "NAME",
                              style: AppTextStyle.descText,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Let's eat ",
                              style: AppTextStyle.headerText,
                            ),
                          ]),
                      height: 140.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TabBar(
                        controller: controller.tabController,
                        // isScrollable: true,
                        indicatorColor: AppColors.primaryColor,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        labelStyle: AppTextStyle.descText.copyWith(
                          fontSize: 16.sp,
                        ),
                        unselectedLabelStyle: AppTextStyle.descText.copyWith(
                          fontSize: 16.sp,
                        ),
                        labelPadding: EdgeInsets.symmetric(horizontal: 5.w),
                        tabs: [
                          Tab(
                            text: "Breakfast",
                          ),
                          Tab(
                            text: "Lunch",
                          ),
                          Tab(
                            text: "Dinner",
                          ),
                          Tab(
                            text: "Snacks",
                          ),
                        ]),
                    SizedBox(
                      height: 20,
                    ),
                    RecepieWidget(
                      cals: "200",
                      picture: "http://placekitten.com/200/300",
                      title: "coffe",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class RecepieWidget extends StatelessWidget {
  const RecepieWidget({
    super.key,
    required this.picture,
    required this.title,
    required this.cals,
    required this.onTap,
  });
  final String picture;
  final String title;
  final String cals;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      width: 366,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        //bottom shadow
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Row(
        children: [
          Container(
            width: 115,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                image: NetworkImage(picture),
                fit: BoxFit.cover,
              ),
              // Replace the placeholder with your image
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.headerText
                      .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w100),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  cals + " kcal",
                  style: AppTextStyle.descText.copyWith(fontSize: 14.sp),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
