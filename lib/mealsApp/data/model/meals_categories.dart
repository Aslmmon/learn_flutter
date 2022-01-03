/// meals : [{"strCategory":"Beef"},{"strCategory":"Breakfast"},{"strCategory":"Chicken"},{"strCategory":"Dessert"},{"strCategory":"Goat"},{"strCategory":"Lamb"},{"strCategory":"Miscellaneous"},{"strCategory":"Pasta"},{"strCategory":"Pork"},{"strCategory":"Seafood"},{"strCategory":"Side"},{"strCategory":"Starter"},{"strCategory":"Vegan"},{"strCategory":"Vegetarian"}]

class MealsCategories {
  MealsCategories({
      List<Meals>? meals,}){
    _meals = meals;
}

  MealsCategories.fromJson(dynamic json) {
    if (json['meals'] != null) {
      _meals = [];
      json['meals'].forEach((v) {
        _meals?.add(Meals.fromJson(v));
      });
    }
  }
  List<Meals>? _meals;

  List<Meals>? get meals => _meals;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_meals != null) {
      map['meals'] = _meals?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// strCategory : "Beef"

class Meals {
  Meals({
      String? strCategory,}){
    _strCategory = strCategory;
}

  Meals.fromJson(dynamic json) {
    _strCategory = json['strCategory'];
  }
  String? _strCategory;

  String? get strCategory => _strCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['strCategory'] = _strCategory;
    return map;
  }

}