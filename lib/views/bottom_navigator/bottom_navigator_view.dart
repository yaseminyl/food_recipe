import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/views/favorites/favorites_viewmodel.dart';
import 'package:food_recipe/views/home/home_viewmodel.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:food_recipe/views/favorites/favorites_view.dart';
import '../../core/base/base_view.dart';
import '../home/home_view.dart';
import 'bottom_navigator_viewmodel.dart';

class BottomNavigatorView extends StatefulWidget {
  const BottomNavigatorView({Key? key}) : super(key: key);

  @override
  State<BottomNavigatorView> createState() => _BottomNavigatorViewState();
}

class _BottomNavigatorViewState extends State<BottomNavigatorView> {
  List<Widget> pagesLogin() {
    return [
      const HomeView(),
      const FavoritesView(),
    ];
  }

  List<Widget> pagesNotLogin() {
    return [
      const HomeView(),
      const FavoritesView(),
    ];
  }

  late final ValueChanged<int> onItemSelected;
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        title: "Home",
        textStyle: Theme.of(context).textTheme.headline6,
        icon: const Icon(
          Iconsax.home1,
        ),
        inactiveIcon: const Icon(
          Iconsax.home,
        ),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Theme.of(context).primaryColor,
        activeColorSecondary: Theme.of(context).primaryColor,
      ),
      PersistentBottomNavBarItem(
        title: "Favorites",
        textStyle: Theme.of(context).textTheme.headline6,
        icon: const Icon(
          Iconsax.heart5,
        ),
        inactiveIcon: const Icon(
          Iconsax.heart4,
        ),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Theme.of(context).primaryColor,
        activeColorSecondary: Theme.of(context).primaryColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<BottomNavigatorViewModel>(
      viewModel: Provider.of<BottomNavigatorViewModel>(context, listen: false),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      pageBuilder: (context, viewModel, child) => SafeArea(
        bottom: false,
        left: false,
        top: false,
        right: false,
        maintainBottomViewPadding: true,
        minimum: EdgeInsets.zero,
        child: Scaffold(
          body: PersistentTabView(
            context,
            controller: viewModel.controller,
            onItemSelected: (int index) {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) async {
                  if (index == 0) {
                    Provider.of<HomeViewModel>(context, listen: false).init();
                  }
                  if (index == 1) {
                    Provider.of<FavoritesViewModel>(context, listen: false).init();
                  }
                },
              );
            },
            screens: pagesLogin(),
            items: _navBarsItems(),
            confineInSafeArea: true,
            backgroundColor: Colors.white,
            handleAndroidBackButtonPress: true, // Default is true.
            resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            stateManagement: true, // Default is true.
            hideNavigationBarWhenKeyboardShows: true,
            navBarHeight: 75.h,
            margin: EdgeInsets.zero,
            bottomScreenMargin: 0,
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            navBarStyle: NavBarStyle.style6,
          ),
        ),
      ),
    );
  }
}
