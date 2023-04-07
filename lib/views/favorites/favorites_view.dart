import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_recipe/core/components/global_widgets/custom_appbar.dart';
import 'package:food_recipe/core/constants/app_constants.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../core/base/base_view.dart';
import '../recipe_detail/recipe_detail_viewmodel.dart';
import 'favorites_viewmodel.dart';
import 'favorites_widgets.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<FavoritesViewModel>(
      viewModel: Provider.of<FavoritesViewModel>(context, listen: false),
      onModelReady: (model) async {
        model.setContext(context);
        await model.init();
      },
      pageBuilder: (context, viewModel, _) => Scaffold(
        appBar: const CustomAppBar(
          title: "Favorites",
          showAppBar: false,
          showBackButton: false,
        ),
        body: SafeArea(
          child: viewModel.loading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                )
              : ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(
                    top: 20.h,
                    bottom: 75.h,
                    right: AppConstants.appPagePadding,
                    left: AppConstants.appPagePadding,
                  ),
                  shrinkWrap: true,
                  itemCount: viewModel.favoriteRecipeModelList.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      closeOnScroll: true,
                      key: const ValueKey(1),
                      endActionPane: ActionPane(
                        extentRatio: 0.2,
                        motion: const ScrollMotion(),
                        children: [
                          Expanded(
                            child: SizedBox.expand(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 4.sp, horizontal: 2.sp),
                                child: OutlinedButton(
                                  onPressed: () async {
                                    await viewModel
                                        .remove(
                                      context,
                                      viewModel.favoriteRecipeModelList[index],
                                    )
                                        .whenComplete(() async {
                                      await viewModel.init().whenComplete(() {
                                        setState(() {});
                                      });
                                    });
                                  },
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    primary: Colors.white,
                                    side: BorderSide.none,
                                  ),
                                  child: Icon(
                                    Iconsax.trash,
                                    color: Colors.white,
                                    size: 22.sp,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      child: FavoritesRecipeCard(
                        viewModel: viewModel,
                        index: index,
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 15.h);
                  },
                ),
        ),
      ),
    );
  }
}
