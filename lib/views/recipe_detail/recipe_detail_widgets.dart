import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/core/models/favorite_recipe_model.dart';
import 'package:food_recipe/core/models/recipe_search_model.dart';
import 'package:iconsax/iconsax.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/constants/assets_constants.dart';
import '../../core/constants/color_constants.dart';
import 'recipe_detail_viewmodel.dart';

class RecipeHeaderImage extends StatelessWidget {
  const RecipeHeaderImage({
    Key? key,
    required this.recipe,
    required this.viewModel,
  }) : super(key: key);

  final Recipe recipe;
  final RecipeDetailViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    List<String> tempRecipe = recipe.uri!.split("#recipe_");
    String recipeId = tempRecipe.last;
    FavoriteRecipeModel favoriteRecipeModel = FavoriteRecipeModel(
      recipeId,
      recipe.label ?? "",
      recipe.image,
    );
    viewModel.checkFavoriteRecipe(favoriteRecipeModel);
    return Container(
      height: 360.h,
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
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 22.w,
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 50.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Center(
                      child: Icon(
                        Iconsax.arrow_left_2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  recipe.shareAs != null
                      ? InkWell(
                          onTap: () {
                            Share.share(recipe.shareAs ?? "", subject: "Recipe");
                          },
                          child: const Icon(
                            Iconsax.export_1,
                            color: Colors.white,
                          ),
                        )
                      : Container(),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          recipe.label ?? "",
                          style: Theme.of(context).textTheme.headline1!.copyWith(
                                color: ColorConstants.instance.white,
                                fontSize: 24.sp,
                              ),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          maxLines: 2,
                        ),
                      ),
                      ToggleButtons(
                        isSelected: [viewModel.isSelected],
                        renderBorder: false,
                        fillColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: (v) async {
                          if (viewModel.isSelected) {
                            await viewModel.removeFavoriteRecipe(favoriteRecipeModel).whenComplete(() {
                              viewModel.checkFavoriteRecipe(favoriteRecipeModel);
                            });
                          } else {
                            await viewModel.addFavoriteRecipe(favoriteRecipeModel).whenComplete(() {
                              viewModel.checkFavoriteRecipe(favoriteRecipeModel);
                            });
                          }
                        },
                        children: [
                          viewModel.isSelected
                              ? const Icon(
                                  Iconsax.heart5,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Iconsax.heart,
                                  color: Colors.red,
                                )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      (recipe.cuisineType != null && recipe.cuisineType!.isNotEmpty)
                          ? Row(
                              children: [
                                Image.asset(
                                  AssetPath.food,
                                  height: 16.h,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  recipe.cuisineType!.first,
                                  style: Theme.of(context).textTheme.headline1!.copyWith(
                                        color: ColorConstants.instance.white,
                                      ),
                                ),
                              ],
                            )
                          : Container(),
                      recipe.totalTime != null && recipe.totalTime != 0
                          ? Row(
                              children: [
                                Image.asset(
                                  AssetPath.clock,
                                  height: 16.h,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  "${recipe.totalTime!.toInt()} min",
                                  style: Theme.of(context).textTheme.headline1!.copyWith(
                                        color: ColorConstants.instance.white,
                                      ),
                                ),
                              ],
                            )
                          : Container(),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IngredientsList extends StatelessWidget {
  const IngredientsList({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Text(
          "Ingredients",
          style: Theme.of(context).textTheme.headline2!.copyWith(
                color: ColorConstants.instance.thunder,
                fontSize: 20.sp,
              ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: recipe.ingredients!.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                Icon(
                  Icons.circle,
                  color: ColorConstants.instance.tundora,
                  size: 10.sp,
                ),
                SizedBox(width: 5.w),
                Expanded(
                  child: Text(
                    "${recipe.ingredients![index].quantity!} ${recipe.ingredients![index].food!}",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: ColorConstants.instance.tundora,
                          fontSize: 16.sp,
                        ),
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 5.h);
          },
        )
      ],
    );
  }
}

class InstructionsList extends StatelessWidget {
  const InstructionsList({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Text(
          "Instructions",
          style: Theme.of(context).textTheme.headline2!.copyWith(
                color: ColorConstants.instance.thunder,
                fontSize: 20.sp,
              ),
        ),
        SizedBox(height: 20.h),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: recipe.ingredientLines!.length,
          itemBuilder: (BuildContext context, int index) {
            return Text(
              "${index + 1}- ${recipe.ingredientLines![index]}",
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: ColorConstants.instance.tundora,
                    fontSize: 16.sp,
                  ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 5.h);
          },
        )
      ],
    );
  }
}
