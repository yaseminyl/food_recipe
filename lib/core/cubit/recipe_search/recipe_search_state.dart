part of 'recipe_search_cubit.dart';

abstract class RecipeSearchState extends Equatable {
  const RecipeSearchState();

  @override
  List<Object> get props => [];
}

class RecipeSearchInitial extends RecipeSearchState {}

class RecipeSearchLoading extends RecipeSearchState {}

class RecipeSearchLoaded extends RecipeSearchState {
  final RecipeSearchModel recipeSearchModel;

  const RecipeSearchLoaded(this.recipeSearchModel);
}

class RecipeSearchError extends RecipeSearchState {
  final String errorMessage;

  const RecipeSearchError(this.errorMessage);
}
