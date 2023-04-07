import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/core/components/global_widgets/custom_button.dart';
import 'package:food_recipe/core/constants/app_constants.dart';
import 'package:food_recipe/core/constants/color_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/constants/hive_box_contants.dart';
import '../bottom_navigator/bottom_navigator_view.dart';
import '../first_run/first_run_view.dart';

class OnWidget extends StatelessWidget {
  const OnWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.appPagePadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Cook Like a Chef",
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  color: ColorConstants.instance.white,
                  fontSize: 35.sp,
                ),
          ),
          SizedBox(height: 16.h),
          Text(
            "De Chef is a user-friendly recipe app designed for those who are new to cooking and want to try new recipes at home",
            style: Theme.of(context).textTheme.headline6!.copyWith(
              color: ColorConstants.instance.white,
              shadows: [
                BoxShadow(
                  color: const Color.fromRGBO(0, 0, 0, 0.2),
                  offset: Offset(0, 3.sp),
                  blurRadius: 3.sp,
                  spreadRadius: 0,
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 70.h),
          CustomButton(
            width: MediaQuery.of(context).size.width,
            widget: Text(
              "Get Started",
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: ColorConstants.instance.white,
                    fontSize: 22.sp,
                  ),
            ),
            onPressed: () {
              bool firstRun = Hive.box(HiveBoxConstants.firstRun).get("firstRun", defaultValue: true);
              if (firstRun) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const FirstRunView();
                    },
                  ),
                );
                Hive.box(HiveBoxConstants.firstRun).put("firstRun", false);
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const BottomNavigatorView();
                    },
                  ),
                );
              }
            },
          ),
          SizedBox(height: 66.h),
        ],
      ),
    );
  }
}
