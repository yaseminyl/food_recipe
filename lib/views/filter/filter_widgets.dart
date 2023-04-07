import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/core/constants/enum/filter_enum/health_type.dart';
import 'package:food_recipe/views/filter/filter_viewmodel.dart';

import '../../core/constants/color_constants.dart';

class HealthFilter extends StatelessWidget {
  const HealthFilter({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final FilterViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        spacing: 18.sp,
        runSpacing: 16.sp,
        children: List.generate(
          HealthType.values.length,
          (index) => GestureDetector(
            onTap: () {
              viewModel.selectHealthType(HealthType.values[index]);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: ColorConstants.instance.white,
                border: HealthType.values[index] == viewModel.selectedHealthType
                    ? Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 1.h,
                      )
                    : Border.all(
                        color: Colors.transparent,
                      ),
                boxShadow: HealthType.values[index] == viewModel.selectedHealthType
                    ? []
                    : [
                        BoxShadow(
                          color: const Color.fromRGBO(0, 0, 0, 0.08),
                          offset: Offset(0, 3.sp),
                          blurRadius: 10.sp,
                          spreadRadius: 0,
                        ),
                      ],
              ),
              padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
              child: Text(
                HealthType.values[index].text,
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: HealthType.values[index] == viewModel.selectedHealthType
                          ? Theme.of(context).primaryColor
                          : ColorConstants.instance.tundora.withOpacity(0.5),
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
