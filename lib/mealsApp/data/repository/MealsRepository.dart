import 'package:flutter/cupertino.dart';
import 'package:learn_flutter/mealsApp/common/mappers/Mapper.dart';
import 'package:learn_flutter/mealsApp/data/model/filter_response.dart';
import 'package:learn_flutter/mealsApp/data/model/ingredient_response.dart';
import 'package:learn_flutter/mealsApp/data/model/meals_area.dart';
import 'package:learn_flutter/mealsApp/data/model/meals_categories.dart';
import 'package:learn_flutter/mealsApp/data/model/meals_categories_response.dart';
import 'package:learn_flutter/mealsApp/data/network/ApiClient.dart';

class MealsRepository {
  MealsRepository({ApiClient? apiClient}) : _apiClient = apiClient ?? ApiClient();

  final ApiClient _apiClient;



  Future<MealsCategoriesResponse> getMealsCategories() async => await _apiClient.getMealsCategories();
  Future<MealsCategories> getCategories() async => await _apiClient.getCategories();

  Future<MealsArea> getMealsArea() async => await _apiClient.getAreas();

  Future<FilterResponse> getFilters(cookType,filterQuery) async => await _apiClient.getFilterData(cookType, filterQuery);
  Future<IngredientResponse> getIngredients() async => await _apiClient.getIngredients();


}
class UIView{
  String title;
  String? id ;
  UIView(this.title,this.id);
}