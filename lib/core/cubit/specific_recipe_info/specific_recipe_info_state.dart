part of 'specific_recipe_info_cubit.dart';

abstract class SpecificRecipeInfoState extends Equatable {
  const SpecificRecipeInfoState();

  @override
  List<Object> get props => [];
}

class SpecificRecipeInfoInitial extends SpecificRecipeInfoState {}

class SpecificRecipeInfoLoading extends SpecificRecipeInfoState {}

class SpecificRecipeInfoLoaded extends SpecificRecipeInfoState {
  final Hits specificInfoModel;

  const SpecificRecipeInfoLoaded(this.specificInfoModel);
}

class SpecificRecipeInfoError extends SpecificRecipeInfoState {
  final String errorMessage;

  const SpecificRecipeInfoError(this.errorMessage);
}
