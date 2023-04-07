enum DishType {
  biscuitsAndCookies,
  bread,
  cereals,
  condimentsAndSauces,
  desserts,
  drinks,
  mainCourse,
  pancake,
  preps,
  preserve,
  salad,
  sandwiches,
  sideDish,
  soup,
  starter,
  sweets,
}

extension DishTypeExtension on DishType {
  String get message {
    switch (this) {
      case DishType.biscuitsAndCookies:
        return ('Biscuits And Cookies');

      case DishType.bread:
        return ('Bread');

      case DishType.cereals:
        return ('Cereals');

      case DishType.condimentsAndSauces:
        return ('Condiments And Sauces');

      case DishType.desserts:
        return ('Desserts');

      case DishType.drinks:
        return ('Drinks');

      case DishType.mainCourse:
        return ('Main Course');

      case DishType.pancake:
        return ('Pancake');

      case DishType.preps:
        return ('Preps');

      case DishType.preserve:
        return ('Preserve');

      case DishType.salad:
        return ('Salad');

      case DishType.sandwiches:
        return ('Sandwiches');

      case DishType.sideDish:
        return ('Side Dish');

      case DishType.soup:
        return ('Soup');

      case DishType.starter:
        return ('Starter');

      case DishType.sweets:
        return ('Sweets');
    }
  }
}
