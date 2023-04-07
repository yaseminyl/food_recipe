enum MealType {
  breakfast,
  dinner,
  lunch,
  snack,
  teatime,
}

extension MealTypeExtension on MealType {
  String get message {
    switch (this) {
      case MealType.breakfast:
        return ('Breakfast');

      case MealType.dinner:
        return ('Dinner');

      case MealType.lunch:
        return ('Lunch');

      case MealType.snack:
        return ('Snack');

      case MealType.teatime:
        return ('Teatime');
    }
  }
}
