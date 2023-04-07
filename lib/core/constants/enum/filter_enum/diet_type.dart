enum DietType {
  balanced,
  highFiber,
  highProtein,
  lowCarb,
  lowFat,
  lowSodium,
}

extension DietTypeExtension on DietType {
  String get message {
    switch (this) {
      case DietType.balanced:
        return ('Balanced');

      case DietType.highFiber:
        return ('High Fiber');

      case DietType.highProtein:
        return ('High Protein');

      case DietType.lowCarb:
        return ('Low Carb');

      case DietType.lowFat:
        return ('Low Fat');

      case DietType.lowSodium:
        return ('Low Sodium');
    }
  }
}
