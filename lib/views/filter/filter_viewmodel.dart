import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../core/base/base_viewmodel.dart';
import '../../core/constants/enum/filter_enum/health_type.dart';
import '../../core/constants/hive_box_contants.dart';

class FilterViewModel extends BaseViewModel {
  bool isInit = false;

  HealthType? selectedHealthType;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  Future<void> init() async {
    selectedHealthType = Hive.box(HiveBoxConstants.healthType).get("healthType");
    if (!isInit) {
      changeStatus();
      isInit = !isInit;
    }
  }

  selectHealthType(HealthType healthType) {
    selectedHealthType = healthType;
    notifyListeners();
  }
}
