import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants/color_constants.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.showAppBar,
    this.showBackButton,
  }) : super(key: key);

  final String? title;
  final bool showAppBar;
  final bool? showBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: title != null ? true : false,
      leading: title != null
          ? showBackButton != null
              ? showBackButton!
                  ? InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: Icon(
                          Iconsax.arrow_left_2,
                          color: ColorConstants.instance.thunder,
                          size: 18.w,
                        ),
                      ),
                    )
                  : const SizedBox()
              : InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Icon(
                      Iconsax.arrow_left_2,
                      color: ColorConstants.instance.thunder,
                      size: 18.w,
                    ),
                  ),
                )
          : const SizedBox(),
      elevation: 0,
      title: title != null
          ? Text(
              title!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 18.sp),
            )
          : const SizedBox(),
      centerTitle: true,
      toolbarHeight: 40.h,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40.h);
}
