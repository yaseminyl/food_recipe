import 'package:bloc/bloc.dart';
import 'package:food_recipe/core/models/recipe_search_model.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipe/core/repository/recipe.dart';
import '../../models/recipe_search_model.dart';

part 'recipe_search_state.dart';

class RecipeSearchCubit extends Cubit<RecipeSearchState> {
  RecipeSearchCubit(this.recipeRepository) : super(RecipeSearchInitial());

  final RecipeRepository recipeRepository;

  Future<void> recipeSearch(
    String? q, {
    String? diet,
    String? health,
    String? cuisineType,
    String? mealType,
    String? dishType,
    String? calories,
    bool? random,
  }) async {
    emit(RecipeSearchLoading());
    final response = await recipeRepository.recipeSearch(
      q,
      diet,
      health,
      cuisineType,
      mealType,
      dishType,
      calories,
      random,
    );
    response.fold(
      (l) => emit(RecipeSearchError(l.message)),
      (r) => emit(RecipeSearchLoaded(r)),
    );
  }

  void clearState() => emit(RecipeSearchInitial());
}
