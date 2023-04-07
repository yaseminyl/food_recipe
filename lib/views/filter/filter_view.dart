import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import '../../core/base/base_view.dart';
import '../../core/components/global_widgets/custom_appbar.dart';
import '../../core/components/global_widgets/custom_button.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/color_constants.dart';
import '../../core/constants/hive_box_contants.dart';
import '../bottom_navigator/bottom_navigator_view.dart';
import 'filter_viewmodel.dart';
import 'filter_widgets.dart';

class FilterView extends StatelessWidget {
  const FilterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<FilterViewModel>(
      viewModel: Provider.of<FilterViewModel>(context, listen: false),
      onModelReady: (model) async {
        model.setContext(context);
        await model.init();
      },
      pageBuilder: (context, viewModel, _) => Scaffold(
        appBar: const CustomAppBar(
          title: "Filter",
          showAppBar: false,
        ),
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.appPagePadding),
            child: Column(
              children: [
                HealthFilter(viewModel: viewModel),
                CustomButton(
                  width: MediaQuery.of(context).size.width,
                  widget: Text(
                    "Filter",
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
                SizedBox(height: 90.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
