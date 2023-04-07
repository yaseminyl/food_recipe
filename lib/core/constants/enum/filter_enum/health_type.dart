import 'package:hive_flutter/adapters.dart';

part 'health_type.g.dart';

@HiveType(typeId: 0)
enum HealthType {
  @HiveField(0)
  alcoholFree,
  @HiveField(1)
  eggFree,
  @HiveField(2)
  fishFree,
  @HiveField(3)
  glutenFree,
  @HiveField(4)
  lowSugar,
  @HiveField(5)
  noOilAdded,
  @HiveField(6)
  redMeatFree,
  @HiveField(7)
  soyFree,
  @HiveField(8)
  sugarFree,
  @HiveField(9)
  vegan,
  @HiveField(10)
  vegetarian,
}

extension HealthTypeExtension on HealthType {
  String get text {
    switch (this) {
      case HealthType.alcoholFree:
        return ('Alcohol Free');

      case HealthType.eggFree:
        return ('Egg Free');

      case HealthType.fishFree:
        return ('Fish Free');

      case HealthType.glutenFree:
        return ('Gluten Free');

      case HealthType.lowSugar:
        return ('Low Sugar');

      case HealthType.noOilAdded:
        return ('No Oil Added');

      case HealthType.redMeatFree:
        return ('Red Meat Free');

      case HealthType.soyFree:
        return ('Soy Free');

      case HealthType.sugarFree:
        return ('Sugar Free');

      case HealthType.vegan:
        return ('Vegan');

      case HealthType.vegetarian:
        return ('Vegetarian');
    }
  }
}
