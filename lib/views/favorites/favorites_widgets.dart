import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_recipe/views/favorites/favorites_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../core/constants/color_constants.dart';
import '../recipe_detail/recipe_detail_view.dart';
import '../recipe_detail/recipe_detail_viewmodel.dart';

class FavoritesRecipeCard extends StatefulWidget {
  const FavoritesRecipeCard({
    Key? key,
    required this.viewModel,
    required this.index,
  }) : super(key: key);

  final FavoritesViewModel viewModel;
  final int index;

  @override
  State<FavoritesRecipeCard> createState() => _FavoritesRecipeCardState();
}

class _FavoritesRecipeCardState extends State<FavoritesRecipeCard> {
  @override
  void initState() {
    if (!widget.viewModel.isAdded!) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await _start();
        widget.viewModel.changeIsAddedTrue(true);
      });
    }

    super.initState();
  }

  Future<void> _start() async {
    await Future<void>.delayed(const Duration(milliseconds: 100));
    var slidable = Slidable.of(context);

    slidable?.openEndActionPane(
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
    );

    Future.delayed(const Duration(milliseconds: 1000), () {
      slidable?.close(
        duration: const Duration(milliseconds: 200),
        curve: Curves.bounceInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<RecipeDetailViewModel>(context, listen: false).recipeId = widget.viewModel.favoriteRecipeModelList[widget.index].recipeId ?? "";
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return const RecipeDetailView();
            },
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.sp),
        child: Container(
          height: 155.h,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                widget.viewModel.favoriteRecipeModelList[widget.index].recipeImage!,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.transparent,
                ],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3, right: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.viewModel.favoriteRecipeModelList[widget.index].recipeName ?? "",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          color: ColorConstants.instance.white,
                          fontSize: 14.sp,
                        ),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
