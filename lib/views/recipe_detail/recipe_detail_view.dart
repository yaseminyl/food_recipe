import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:food_recipe/core/constants/app_constants.dart';
import 'package:food_recipe/core/cubit/specific_recipe_info/specific_recipe_info_cubit.dart';
import 'package:food_recipe/views/recipe_detail/recipe_detail_viewmodel.dart';
import 'package:food_recipe/views/recipe_detail/recipe_detail_widgets.dart';

import '../../core/base/base_view.dart';

class RecipeDetailView extends StatelessWidget {
  const RecipeDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<RecipeDetailViewModel>(
      viewModel: Provider.of<RecipeDetailViewModel>(context, listen: false),
      onModelReady: (model) async {
        model.setContext(context);
        await model.init();
      },
      pageBuilder: (context, viewModel, _) => Scaffold(
        body: BlocBuilder<SpecificRecipeInfoCubit, SpecificRecipeInfoState>(
          builder: (context, state) {
            if (state is SpecificRecipeInfoLoaded) {
              return Column(
                children: [
                  RecipeHeaderImage(
                    recipe: state.specificInfoModel.recipe!,
                    viewModel: viewModel,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppConstants.appPagePadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IngredientsList(recipe: state.specificInfoModel.recipe!),
                            InstructionsList(recipe: state.specificInfoModel.recipe!),
                            SizedBox(height: 75.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is SpecificRecipeInfoError) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: Colors.red,
                      ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
