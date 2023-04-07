import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:food_recipe/core/constants/app_constants.dart';
import 'package:food_recipe/core/cubit/recipe_search/recipe_search_cubit.dart';

import '../../core/base/base_view.dart';
import 'home_viewmodel.dart';
import 'home_widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: Provider.of<HomeViewModel>(context, listen: false),
      onModelReady: (model) async {
        model.setContext(context);
        await model.init();
      },
      pageBuilder: (context, viewModel, _) => GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.appPagePadding),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      SearchWidget(
                        textEditingController: viewModel.textEditingController,
                        health: viewModel.health ?? "",
                      ),
                      SizedBox(width: 10.w),
                      const FilterWidget(),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Expanded(
                    child: BlocBuilder<RecipeSearchCubit, RecipeSearchState>(
                      builder: (BuildContext context, state) {
                        if (state is RecipeSearchLoaded) {
                          return state.recipeSearchModel.hits != null
                              ? ListView.separated(
                                  padding: EdgeInsets.only(bottom: 75.h),
                                  shrinkWrap: true,
                                  itemCount: state.recipeSearchModel.hits!.length,
                                  itemBuilder: (context, index) {
                                    return RecipeCard(recipe: state.recipeSearchModel.hits![index].recipe!);
                                  },
                                  separatorBuilder: (BuildContext context, int index) {
                                    return SizedBox(height: 15.h);
                                  },
                                )
                              : Container();
                        } else if (state is RecipeSearchError) {
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
