import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:food_recipe/core/constants/assets_constants.dart';
import 'package:food_recipe/views/start/start_widgets.dart';

import '../../core/base/base_view.dart';
import 'start_viewmodel.dart';

class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<StartViewModel>(
      viewModel: Provider.of<StartViewModel>(context, listen: false),
      onModelReady: (model) async {
        model.setContext(context);
        await model.init();
      },
      pageBuilder: (context, viewModel, _) => Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetPath.home),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(1),
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: const OnWidget(),
          ),
        ),
      ),
    );
  }
}
