import 'dart:io';
import 'package:food_recipe/core/constants/enum/filter_enum/health_type.dart';
import 'package:food_recipe/core/models/favorite_recipe_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../constants/hive_box_contants.dart';

Future hiveInit(Directory appDocumentDirectory) async {
  await Hive.initFlutter(appDocumentDirectory.path);

  Hive.registerAdapter(FavoriteRecipeModelAdapter());
  Hive.registerAdapter(HealthTypeAdapter());

  await Hive.openBox(HiveBoxConstants.firstRun);
  await Hive.openBox(HiveBoxConstants.favoriteRecipeList);

  await Hive.openBox(HiveBoxConstants.healthType);
  await Hive.openBox(HiveBoxConstants.cuisineType);
  await Hive.openBox(HiveBoxConstants.dietType);
  await Hive.openBox(HiveBoxConstants.dishType);
  await Hive.openBox(HiveBoxConstants.mealType);
}
