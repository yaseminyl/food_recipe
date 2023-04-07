import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/core/cubit/recipe_search/recipe_search_cubit.dart';
import 'package:food_recipe/core/cubit/specific_recipe_info/specific_recipe_info_cubit.dart';
import 'package:food_recipe/core/network/network_data_manager.dart';
import 'package:food_recipe/core/repository/recipe.dart';
import 'package:food_recipe/views/filter/filter_viewmodel.dart';
import 'package:food_recipe/views/recipe_detail/recipe_detail_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:food_recipe/views/bottom_navigator/bottom_navigator_viewmodel.dart';
import 'package:food_recipe/views/favorites/favorites_viewmodel.dart';
import 'package:food_recipe/views/first_run/first_run_viewmodel.dart';
import 'package:food_recipe/views/start/start_viewmodel.dart';

import '../../../views/home/home_viewmodel.dart';

class ProviderManager {
  static ProviderManager? _instance;
  static ProviderManager get instance {
    _instance ??= ProviderManager._init();
    return _instance!;
  }

  ProviderManager._init();

  List<SingleChildWidget> singleProvider = [
    ChangeNotifierProvider<BottomNavigatorViewModel>(
      create: (_) => BottomNavigatorViewModel(),
    ),
    ChangeNotifierProvider<StartViewModel>(
      create: (_) => StartViewModel(),
    ),
    ChangeNotifierProvider<FirstRunViewModel>(
      create: (_) => FirstRunViewModel(),
    ),
    ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel(),
    ),
    ChangeNotifierProvider<RecipeDetailViewModel>(
      create: (_) => RecipeDetailViewModel(),
    ),
    ChangeNotifierProvider<FavoritesViewModel>(
      create: (_) => FavoritesViewModel(),
    ),
    ChangeNotifierProvider<FilterViewModel>(
      create: (_) => FilterViewModel(),
    ),
    BlocProvider(
      create: (context) => RecipeSearchCubit(RecipeRepository(NetworkDataManager(Dio()))),
    ),
    BlocProvider(
      create: (context) => SpecificRecipeInfoCubit(RecipeRepository(NetworkDataManager(Dio()))),
    ),
  ];
}
