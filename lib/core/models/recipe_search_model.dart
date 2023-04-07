class RecipeSearchModel {
  int? from;
  int? to;
  int? count;
  Links? lLinks;
  List<Hits>? hits;

  RecipeSearchModel({this.from, this.to, this.count, this.lLinks, this.hits});

  RecipeSearchModel.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    count = json['count'];
    lLinks = json['_links'] != null ? Links.fromJson(json['_links']) : null;
    if (json['hits'] != null) {
      hits = <Hits>[];
      json['hits'].forEach((v) {
        hits!.add(Hits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from'] = from;
    data['to'] = to;
    data['count'] = count;
    if (lLinks != null) {
      data['_links'] = lLinks!.toJson();
    }
    if (hits != null) {
      data['hits'] = hits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hits {
  Recipe? recipe;
  Links? lLinks;

  Hits({this.recipe, this.lLinks});

  Hits.fromJson(Map<String, dynamic> json) {
    recipe = json['recipe'] != null ? Recipe.fromJson(json['recipe']) : null;
    lLinks = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (recipe != null) {
      data['recipe'] = recipe!.toJson();
    }
    if (lLinks != null) {
      data['_links'] = lLinks!.toJson();
    }
    return data;
  }
}

class Recipe {
  String? uri;
  String? label;
  String? image;
  Images? images;
  String? source;
  String? url;
  String? shareAs;
  double? yield;
  List<String>? dietLabels;
  List<String>? healthLabels;
  List<String>? cautions;
  List<String>? ingredientLines;
  List<Ingredients>? ingredients;
  double? calories;
  int? glycemicIndex;
  int? totalCO2Emissions;
  String? co2EmissionsClass;
  double? totalWeight;
  double? totalTime;
  List<String>? cuisineType;
  List<String>? mealType;
  List<String>? dishType;
  List<String>? instructions;
  List<String>? tags;
  String? externalId;
  TotalNutrients? totalNutrients;
  TotalNutrients? totalDaily;
  List<Digest>? digest;

  Recipe(
      {this.uri,
      this.label,
      this.image,
      this.images,
      this.source,
      this.url,
      this.shareAs,
      this.yield,
      this.dietLabels,
      this.healthLabels,
      this.cautions,
      this.ingredientLines,
      this.ingredients,
      this.calories,
      this.glycemicIndex,
      this.totalCO2Emissions,
      this.co2EmissionsClass,
      this.totalWeight,
      this.totalTime,
      this.cuisineType,
      this.mealType,
      this.dishType,
      this.tags,
      this.externalId,
      this.totalNutrients,
      this.totalDaily,
      this.digest});

  Recipe.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    label = json['label'];
    image = json['image'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    source = json['source'];
    url = json['url'];
    shareAs = json['shareAs'];
    yield = json['yield'];
    dietLabels = json['dietLabels'].cast<String>();
    healthLabels = json['healthLabels'].cast<String>();
    cautions = json['cautions'].cast<String>();
    ingredientLines = json['ingredientLines'].cast<String>();
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(Ingredients.fromJson(v));
      });
    }
    calories = json['calories'];
    glycemicIndex = json['glycemicIndex'];
    totalCO2Emissions = json['totalCO2Emissions'];
    co2EmissionsClass = json['co2EmissionsClass'];
    totalWeight = json['totalWeight'];
    totalTime = json['totalTime'];
    cuisineType = json['cuisineType'].cast<String>();
    mealType = json['mealType'].cast<String>();
    if (json['dishType'] != null) {
      dishType = json['dishType'].cast<String>();
    } else {
      dishType = null;
    }
    if (json['tags'] != null) {
      tags = json['tags'].cast<String>();
    } else {
      tags = null;
    }
    externalId = json['externalId'];
    totalNutrients = json['totalNutrients'] != null ? TotalNutrients.fromJson(json['totalNutrients']) : null;
    totalDaily = json['totalDaily'] != null ? TotalNutrients.fromJson(json['totalDaily']) : null;
    if (json['digest'] != null) {
      digest = <Digest>[];
      json['digest'].forEach((v) {
        digest!.add(Digest.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uri'] = uri;
    data['label'] = label;
    data['image'] = image;
    if (images != null) {
      data['images'] = images!.toJson();
    }
    data['source'] = source;
    data['url'] = url;
    data['shareAs'] = shareAs;
    data['yield'] = yield;
    data['dietLabels'] = dietLabels;
    data['healthLabels'] = healthLabels;
    data['cautions'] = cautions;
    data['ingredientLines'] = ingredientLines;
    if (ingredients != null) {
      data['ingredients'] = ingredients!.map((v) => v.toJson()).toList();
    }
    data['calories'] = calories;
    data['glycemicIndex'] = glycemicIndex;
    data['totalCO2Emissions'] = totalCO2Emissions;
    data['co2EmissionsClass'] = co2EmissionsClass;
    data['totalWeight'] = totalWeight;
    data['totalTime'] = totalTime;
    data['cuisineType'] = cuisineType;
    data['mealType'] = mealType;
    if (dishType != null) {
      data['dishType'] = dishType;
    }
    data['tags'] = tags;
    data['externalId'] = externalId;
    if (totalNutrients != null) {
      data['totalNutrients'] = totalNutrients!.toJson();
    }
    if (totalDaily != null) {
      data['totalDaily'] = totalDaily!.toJson();
    }
    if (digest != null) {
      data['digest'] = digest!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  THUMBNAIL? tHUMBNAIL;
  THUMBNAIL? sMALL;
  THUMBNAIL? rEGULAR;
  THUMBNAIL? lARGE;

  Images({this.tHUMBNAIL, this.sMALL, this.rEGULAR, this.lARGE});

  Images.fromJson(Map<String, dynamic> json) {
    tHUMBNAIL = json['THUMBNAIL'] != null ? THUMBNAIL.fromJson(json['THUMBNAIL']) : null;
    sMALL = json['SMALL'] != null ? THUMBNAIL.fromJson(json['SMALL']) : null;
    rEGULAR = json['REGULAR'] != null ? THUMBNAIL.fromJson(json['REGULAR']) : null;
    lARGE = json['LARGE'] != null ? THUMBNAIL.fromJson(json['LARGE']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tHUMBNAIL != null) {
      data['THUMBNAIL'] = tHUMBNAIL!.toJson();
    }
    if (sMALL != null) {
      data['SMALL'] = sMALL!.toJson();
    }
    if (rEGULAR != null) {
      data['REGULAR'] = rEGULAR!.toJson();
    }
    if (lARGE != null) {
      data['LARGE'] = lARGE!.toJson();
    }
    return data;
  }
}

class THUMBNAIL {
  String? url;
  int? width;
  int? height;

  THUMBNAIL({this.url, this.width, this.height});

  THUMBNAIL.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}

class Ingredients {
  String? text;
  double? quantity;
  String? measure;
  String? food;
  double? weight;
  String? foodId;

  Ingredients({this.text, this.quantity, this.measure, this.food, this.weight, this.foodId});

  Ingredients.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    quantity = json['quantity'];
    measure = json['measure'];
    food = json['food'];
    weight = json['weight'];
    foodId = json['foodId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['quantity'] = quantity;
    data['measure'] = measure;
    data['food'] = food;
    data['weight'] = weight;
    data['foodId'] = foodId;
    return data;
  }
}

class TotalNutrients {
  AdditionalProp1? additionalProp1;
  AdditionalProp1? additionalProp2;
  AdditionalProp1? additionalProp3;

  TotalNutrients({this.additionalProp1, this.additionalProp2, this.additionalProp3});

  TotalNutrients.fromJson(Map<String, dynamic> json) {
    additionalProp1 = json['additionalProp1'] != null ? AdditionalProp1.fromJson(json['additionalProp1']) : null;
    additionalProp2 = json['additionalProp2'] != null ? AdditionalProp1.fromJson(json['additionalProp2']) : null;
    additionalProp3 = json['additionalProp3'] != null ? AdditionalProp1.fromJson(json['additionalProp3']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (additionalProp1 != null) {
      data['additionalProp1'] = additionalProp1!.toJson();
    }
    if (additionalProp2 != null) {
      data['additionalProp2'] = additionalProp2!.toJson();
    }
    if (additionalProp3 != null) {
      data['additionalProp3'] = additionalProp3!.toJson();
    }
    return data;
  }
}

class AdditionalProp1 {
  String? label;
  double? quantity;
  String? unit;

  AdditionalProp1({this.label, this.quantity, this.unit});

  AdditionalProp1.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['quantity'] = quantity;
    data['unit'] = unit;
    return data;
  }
}

class Digest {
  String? label;
  String? tag;
  String? schemaOrgTag;
  double? total;
  bool? hasRDI;
  double? daily;
  String? unit;
  List<Sub>? sub;

  Digest({this.label, this.tag, this.schemaOrgTag, this.total, this.hasRDI, this.daily, this.unit, this.sub});

  Digest.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    tag = json['tag'];
    schemaOrgTag = json['schemaOrgTag'];
    total = json['total'];
    hasRDI = json['hasRDI'];
    daily = json['daily'];
    unit = json['unit'];
    if (json['sub'] != null) {
      sub = <Sub>[];
      json['sub'].forEach((v) {
        sub!.add(Sub.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['tag'] = tag;
    data['schemaOrgTag'] = schemaOrgTag;
    data['total'] = total;
    data['hasRDI'] = hasRDI;
    data['daily'] = daily;
    data['unit'] = unit;
    if (sub != null) {
      data['sub'] = sub!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sub {
  String? label;
  String? tag;
  String? schemaOrgTag;
  double? total;
  bool? hasRDI;
  double? daily;
  String? unit;

  Sub({this.label, this.tag, this.schemaOrgTag, this.total, this.hasRDI, this.daily, this.unit});

  Sub.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    tag = json['tag'];
    schemaOrgTag = json['schemaOrgTag'];
    total = json['total'];
    hasRDI = json['hasRDI'];
    daily = json['daily'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['tag'] = tag;
    data['schemaOrgTag'] = schemaOrgTag;
    data['total'] = total;
    data['hasRDI'] = hasRDI;
    data['daily'] = daily;
    data['unit'] = unit;
    return data;
  }
}

class Links {
  Self? self;
  Self? next;

  Links({this.self, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'] != null ? Self.fromJson(json['self']) : null;
    next = json['next'] != null ? Self.fromJson(json['next']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (self != null) {
      data['self'] = self!.toJson();
    }
    if (next != null) {
      data['next'] = next!.toJson();
    }
    return data;
  }
}

class Self {
  String? href;
  String? title;

  Self({this.href, this.title});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    data['title'] = title;
    return data;
  }
}
