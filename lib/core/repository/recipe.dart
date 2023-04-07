import 'package:dartz/dartz.dart';
import 'package:food_recipe/core/constants/dio_constants.dart';
import 'package:food_recipe/core/constants/endpoints.dart';
import 'package:food_recipe/core/constants/enum/recipe_type.dart';
import 'package:food_recipe/core/models/recipe_search_model.dart';
import 'package:food_recipe/core/network/exceptions.dart';
import 'package:food_recipe/core/network/network_data_manager.dart';

abstract class IRecipeRepository {
  Future<Either<AppException, RecipeSearchModel>> recipeSearch(
    String q,
    String? diet,
    String? health,
    String? cuisineType,
    String? mealType,
    String? dishType,
    String? calories,
    bool? random,
  );
  Future<Either<AppException, Hits>> specificRecipeInfo(
    String recipeId,
  );
}

class RecipeRepository extends IRecipeRepository {
  final NetworkDataManager networkDataManager;

  RecipeRepository(this.networkDataManager);

  @override
  Future<Either<AppException, RecipeSearchModel>> recipeSearch(
    String? q,
    String? diet,
    String? health,
    String? cuisineType,
    String? mealType,
    String? dishType,
    String? calories,
    bool? random,
  ) async {
    try {
      final response = await networkDataManager.get(
        Endpoints.recipeSearch,
        queryParameters: {
          "type": RecipeType.public.name,
          "app_id": DioConstants.appId,
          "app_key": DioConstants.appKey,
          if (q != null) "q": q,
          if (diet != null) "diet": diet,
          if (health != null) "health": health,
          if (cuisineType != null) "cuisineType": cuisineType,
          if (mealType != null) "mealType": mealType,
          if (dishType != null) "dishType": dishType,
          if (calories != null) "calories": calories,
          if (random != null) "random": random,
          "Accept-Language": "en"
        },
      );
      final data = RecipeSearchModel.fromJson(response.data);
      return Right(data);
    } on AppException catch (err) {
      return Left(
        AppException(err.message),
      );
    }
  }

  @override
  Future<Either<AppException, Hits>> specificRecipeInfo(
    String recipeId,
  ) async {
    try {
      final response = await networkDataManager.get(
        "${Endpoints.recipeSearch}/$recipeId",
        queryParameters: {
          "type": RecipeType.public.name,
          "app_id": DioConstants.appId,
          "app_key": DioConstants.appKey,
          "Accept-Language": "en",
        },
      );
      final data = Hits.fromJson(response.data);
      return Right(data);
    } on AppException catch (err) {
      return Left(
        AppException(err.message),
      );
    }
  }
}
