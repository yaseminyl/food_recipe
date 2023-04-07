import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/core/components/global_widgets/custom_textfield.dart';
import 'package:food_recipe/core/models/recipe_search_model.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../core/constants/assets_constants.dart';
import '../../core/constants/color_constants.dart';
import '../../core/cubit/recipe_search/recipe_search_cubit.dart';
import '../filter/filter_view.dart';
import '../recipe_detail/recipe_detail_view.dart';
import '../recipe_detail/recipe_detail_viewmodel.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    required this.textEditingController,
    required this.health,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String health;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 85,
      child: SizedBox(
        height: 50.h,
        child: CustomTextField(
          hintText: "Search",
          suffixIcon: Icon(
            Iconsax.search_normal,
            color: ColorConstants.instance.gray,
          ),
          controller: textEditingController,
          onChanged: (input) {
            if (input.length > 1) {
              Provider.of<RecipeSearchCubit>(context, listen: false).recipeSearch(
                input!,
              );
            } else {
              Provider.of<RecipeSearchCubit>(context, listen: false).recipeSearch(
                null,
                health: health,
                random: true,
              );
            }
          },
        ),
      ),
    );
  }
}

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 15,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const FilterView();
              },
            ),
          );
        },
        child: Container(
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.sp),
            border: Border.all(
              color: ColorConstants.instance.gray,
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 14.h,
          ),
          child: Image.asset(
            AssetPath.filter,
            color: ColorConstants.instance.gray,
          ),
        ),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    List<String> tempRecipe = recipe.uri!.split("#recipe_");
    String recipeId = tempRecipe.last;
    return GestureDetector(
      onTap: () {
        Provider.of<RecipeDetailViewModel>(context, listen: false).recipeId = recipeId;
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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                recipe.image!,
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
                    recipe.label ?? "",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          color: ColorConstants.instance.white,
                          fontSize: 14.sp,
                        ),
                    textAlign: TextAlign.end,
                  ),
                  (recipe.cuisineType != null && recipe.cuisineType!.isNotEmpty)
                      ? Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                AssetPath.food,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                recipe.cuisineType!.first,
                                style: Theme.of(context).textTheme.headline6!.copyWith(
                                      color: ColorConstants.instance.white,
                                    ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  recipe.totalTime != null && recipe.totalTime != 0
                      ? Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                AssetPath.clock,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                "${recipe.totalTime!.toInt()} min",
                                style: Theme.of(context).textTheme.headline6!.copyWith(
                                      color: ColorConstants.instance.white,
                                    ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
