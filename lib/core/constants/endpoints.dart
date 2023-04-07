import 'package:food_recipe/core/constants/dio_constants.dart';

class Endpoints {
  Endpoints._();

  //BASE URL
  static const baseUrl = DioConstants.baseUrl;

  //Recipe Search
  static const recipeSearch = "${DioConstants.baseUrl}/api/recipes/v2";
}
