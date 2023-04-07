import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'package:food_recipe/core/components/global_widgets/custom_appbar.dart';
import 'package:food_recipe/core/components/global_widgets/custom_button.dart';
import 'package:food_recipe/core/constants/app_constants.dart';
import 'package:food_recipe/core/constants/color_constants.dart';
import 'package:food_recipe/views/bottom_navigator/bottom_navigator_view.dart';
import 'package:food_recipe/views/first_run/first_run_widgets.dart';

import '../../core/base/base_view.dart';
import '../../core/constants/hive_box_contants.dart';
import 'first_run_viewmodel.dart';

class FirstRunView extends StatelessWidget {
  const FirstRunView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<FirstRunViewModel>(
      viewModel: Provider.of<FirstRunViewModel>(context, listen: false),
      onModelReady: (model) async {
        model.setContext(context);
        await model.init();
      },
      pageBuilder: (context, viewModel, _) => Scaffold(
        appBar: const CustomAppBar(
          title: "Select Interest",
          showAppBar: false,
        ),
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.appPagePadding),
            child: Column(
              children: [
                HealthTypeWidget(viewModel: viewModel),
                CustomButton(
                  width: MediaQuery.of(context).size.width,
                  widget: Text(
                    "Continue",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          color: ColorConstants.instance.white,
                          fontSize: 22.sp,
                        ),
                  ),
                  isActive: viewModel.selectedHealthType != null,
                  onPressed: () {
                    Hive.box(HiveBoxConstants.healthType)
                        .put(
                      "healthType",
                      viewModel.selectedHealthType,
                    )
                        .whenComplete(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const BottomNavigatorView();
                          },
                        ),
                      );
                    });
                  },
                ),
                SizedBox(height: 66.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
