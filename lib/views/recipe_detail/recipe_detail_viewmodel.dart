import 'package:flutter/material.dart';
import 'package:food_recipe/core/base/base_viewmodel.dart';
import 'package:food_recipe/core/cubit/specific_recipe_info/specific_recipe_info_cubit.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../core/constants/hive_box_contants.dart';
import '../../core/models/favorite_recipe_model.dart';

class RecipeDetailViewModel extends BaseViewModel {
  bool isInit = false;

  String recipeId = "";
  List favoriteRecipeModelList = [];
  bool isSelected = false;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  Future<void> init() async {
    Provider.of<SpecificRecipeInfoCubit>(context!, listen: false).specificRecipeInfo(
      recipeId,
    );

    if (!isInit) {
      changeStatus();
      isInit = !isInit;
    }
  }

  Future<void> addFavoriteRecipe(
    FavoriteRecipeModel favoriteRecipeModel,
  ) async {
    favoriteRecipeModelList = Hive.box(HiveBoxConstants.favoriteRecipeList).get(
      "favoriteRecipeList",
      defaultValue: <FavoriteRecipeModel>[],
    );

    int status = favoriteRecipeModelList.indexWhere(
      (element) => (element.recipeId == favoriteRecipeModel.recipeId),
    );

    if (status == -1) {
      favoriteRecipeModelList.add(favoriteRecipeModel);
      Hive.box(HiveBoxConstants.favoriteRecipeList).put("favoriteRecipeList", favoriteRecipeModelList);
    }
    notifyListeners();
  }

  Future<void> removeFavoriteRecipe(
    FavoriteRecipeModel favoriteRecipeModel,
  ) async {
    favoriteRecipeModelList = Hive.box(HiveBoxConstants.favoriteRecipeList).get(
      "favoriteRecipeList",
      defaultValue: <FavoriteRecipeModel>[],
    );

    int status = favoriteRecipeModelList.indexWhere(
      (element) => (element.recipeId == favoriteRecipeModel.recipeId),
    );

    if (status != -1) {
      favoriteRecipeModelList.removeAt(status);
      Hive.box(HiveBoxConstants.favoriteRecipeList).put("favoriteRecipeList", favoriteRecipeModelList);
    }
    notifyListeners();
  }

  checkFavoriteRecipe(
    FavoriteRecipeModel favoriteRecipeModel,
  ) {
    favoriteRecipeModelList = Hive.box(HiveBoxConstants.favoriteRecipeList).get(
      "favoriteRecipeList",
      defaultValue: <FavoriteRecipeModel>[],
    );

    int status = favoriteRecipeModelList.indexWhere(
      (element) => (element.recipeId == favoriteRecipeModel.recipeId),
    );

    if (status == -1) {
      isSelected = false;
    } else {
      isSelected = true;
    }
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        notifyListeners();
      },
    );
  }
}
