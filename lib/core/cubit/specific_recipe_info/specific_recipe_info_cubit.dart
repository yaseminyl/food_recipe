import 'package:bloc/bloc.dart';
import 'package:food_recipe/core/models/recipe_search_model.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipe/core/repository/recipe.dart';

part 'specific_recipe_info_state.dart';

class SpecificRecipeInfoCubit extends Cubit<SpecificRecipeInfoState> {
  SpecificRecipeInfoCubit(this.recipeRepository) : super(SpecificRecipeInfoInitial());

  final RecipeRepository recipeRepository;

  Future<void> specificRecipeInfo(String recipeId) async {
    emit(SpecificRecipeInfoLoading());
    final response = await recipeRepository.specificRecipeInfo(
      recipeId,
      
    );
    response.fold(
      (l) => emit(SpecificRecipeInfoError(l.message)),
      (r) => emit(SpecificRecipeInfoLoaded(r)),
    );
  }
}
