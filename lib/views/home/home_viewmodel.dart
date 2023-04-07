import 'package:flutter/material.dart';
import 'package:food_recipe/core/constants/enum/filter_enum/health_type.dart';
import 'package:food_recipe/core/cubit/recipe_search/recipe_search_cubit.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import '../../core/base/base_viewmodel.dart';
import '../../core/constants/hive_box_contants.dart';

class HomeViewModel extends BaseViewModel {
  bool isInit = false;
  TextEditingController textEditingController = TextEditingController();
  HealthType healthType = Hive.box(HiveBoxConstants.healthType).get(
    "healthType",
  );

  String? health;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  Future<void> init() async {
    healthType = Hive.box(HiveBoxConstants.healthType).get(
      "healthType",
    );

    health = healthType.text.replaceAll(" ", "-");
    health = health!.toLowerCase();

    Provider.of<RecipeSearchCubit>(context!, listen: false).recipeSearch(
      null,
      health: health,
      random: true,
    );

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
}
