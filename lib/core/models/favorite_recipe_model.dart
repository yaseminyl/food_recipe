import 'package:hive_flutter/hive_flutter.dart';

part 'favorite_recipe_model.g.dart';

@HiveType(typeId: 1)
class FavoriteRecipeModel {
  @HiveField(0)
  final String? recipeId;
  @HiveField(1)
  final String? recipeName;
  @HiveField(2)
  final String? recipeImage;

  FavoriteRecipeModel(
    this.recipeId,
    this.recipeName,
    this.recipeImage,
  );
}
