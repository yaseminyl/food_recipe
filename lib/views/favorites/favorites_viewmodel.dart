import 'package:flutter/material.dart';
import 'package:food_recipe/core/constants/hive_box_contants.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import '../../core/base/base_viewmodel.dart';
import '../../core/models/favorite_recipe_model.dart';
import '../recipe_detail/recipe_detail_viewmodel.dart';

class FavoritesViewModel extends BaseViewModel {
  bool isInit = false;
  List favoriteRecipeModelList = [];
  bool? isAdded;

  bool loading = false;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  Future<void> init() async {
    isAdded = false;
    loading = true;
    getList();
    await Future<void>.delayed(const Duration(milliseconds: 100));
    loading = false;

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        notifyListeners();
      },
    );

    if (!isInit) {
      changeStatus();
      isInit = !isInit;
    }
  }

  getList() {
    favoriteRecipeModelList = Hive.box(HiveBoxConstants.favoriteRecipeList).get(
      "favoriteRecipeList",
      defaultValue: <FavoriteRecipeModel>[],
    );
  }

  Future remove(
    BuildContext context,
    FavoriteRecipeModel favoriteRecipeModel,
  ) async {
    changeIsAddedTrue(true);
    loading = true;
    await Provider.of<RecipeDetailViewModel>(context, listen: false).removeFavoriteRecipe(favoriteRecipeModel).whenComplete(() {
      loading = false;
    });

    notifyListeners();
  }

  Future<void> changeIsAddedTrue(bool value) async {
    isAdded = value;
    notifyListeners();
  }
}
