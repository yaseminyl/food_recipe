enum CuisineType {
  american,
  asian,
  british,
  caribbean,
  centralEurope,
  chinese,
  easternEurope,
  french,
  indian,
  italian,
  japanese,
  kosher,
  mediterranean,
  mexican,
  middleEastern,
  nordic,
  southAmerican,
  southEastAsian,
}

extension CuisineTypeExtension on CuisineType {
  String get message {
    switch (this) {
      case CuisineType.american:
        return ('American');

      case CuisineType.asian:
        return ('Asian');

      case CuisineType.british:
        return ('British');

      case CuisineType.caribbean:
        return ('Caribbean');

      case CuisineType.centralEurope:
        return ('Central Europe');

      case CuisineType.chinese:
        return ('Chinese');

      case CuisineType.easternEurope:
        return ('Eastern Europe');

      case CuisineType.french:
        return ('French');

      case CuisineType.indian:
        return ('Indian');

      case CuisineType.italian:
        return ('Italian');

      case CuisineType.japanese:
        return ('Japanese');

      case CuisineType.kosher:
        return ('Kosher');

      case CuisineType.mediterranean:
        return ('Mediterranean');

      case CuisineType.mexican:
        return ('Mexican');

      case CuisineType.middleEastern:
        return ('Middle Eastern');

      case CuisineType.nordic:
        return ('Nordic');

      case CuisineType.southAmerican:
        return ('South American');

      case CuisineType.southEastAsian:
        return ('South East Asian');
    }
  }
}
