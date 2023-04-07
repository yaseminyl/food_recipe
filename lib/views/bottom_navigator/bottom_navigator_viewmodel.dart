import 'package:food_recipe/core/base/base_viewmodel.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'package:flutter/material.dart';

enum Destination { home, favorites }

class BottomNavigatorViewModel extends BaseViewModel {
  bool isInit = false;
  int count = 0;
  String? pageNameString;
  late bool iconBool;
  late IconData iconLight = Icons.wb_sunny;
  late IconData iconDark = Icons.nights_stay;
  late PersistentTabController controller;
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    controller = PersistentTabController();
    if (!isInit) {
      changeStatus();
      isInit = !isInit;
    }
  }

  void changeTheme(bool trueOrFalse) {
    iconBool = trueOrFalse;
    notifyListeners();
  }

  int number = 0;
  static const List<Destination> destinations = Destination.values;

  int selectedDestinationIndex = destinations.indexOf(Destination.home);

  Destination get selectedDestination => destinations[selectedDestinationIndex];

  void selectDestination(int index) {
    selectedDestinationIndex = index;
    notifyListeners();
  }
}
