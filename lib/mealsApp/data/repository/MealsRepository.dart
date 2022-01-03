import 'package:learn_flutter/mealsApp/data/model/meals_categories_response.dart';
import 'package:learn_flutter/mealsApp/data/network/ApiClient.dart';

class MealsRepository {
  MealsRepository({ApiClient? apiClient}) : _apiClient = apiClient ?? ApiClient();

  final ApiClient _apiClient;


  Future<MealsCategoriesResponse> getMealsCategories() async =>
      await _apiClient.getMealsCategories();

}