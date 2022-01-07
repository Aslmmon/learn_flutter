import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:learn_flutter/mealsApp/data/model/filter_response.dart';
import 'package:learn_flutter/mealsApp/data/model/ingredient_response.dart';
import 'package:learn_flutter/mealsApp/data/model/meals_area.dart';
import 'package:learn_flutter/mealsApp/data/model/meals_categories.dart';
import 'package:learn_flutter/mealsApp/data/model/meals_categories_response.dart';
import 'package:http/http.dart' as http;
import 'package:learn_flutter/mealsApp/presentation/chooser/chooser.dart';

/// Exception thrown when locationSearch fails.
class Failure implements Exception {}

/// Exception thrown when the provided location is not found.
class NotFound implements Exception {}

/// Exception thrown when getWeather fails.

class ApiClient {
  ApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'www.themealdb.com';
  final http.Client _httpClient;

  Future<MealsCategoriesResponse> getMealsCategories() async {
    final categoriesRequest =
        Uri.https(_baseUrl, '/api/json/v1/1/categories.php');
    final categoriesResponse = await _httpClient.get(categoriesRequest);

    var mealsCategoriesJson = CheckForResponse(categoriesResponse);

    return MealsCategoriesResponse.fromJson(mealsCategoriesJson);
  }

  Future<MealsCategories> getCategories() async {
    final categoriesRequest = Uri.https(
      _baseUrl,
      '/api/json/v1/1/list.php',
      <String, String>{'c': "list"},
    );
    final categoriesResponse = await _httpClient.get(categoriesRequest);
    var mealsCategoriesJson = CheckForResponse(categoriesResponse);
    return MealsCategories.fromJson(mealsCategoriesJson);
  }



  Future<MealsArea> getAreas() async {
    final areaRequest = Uri.https(_baseUrl, '/api/json/v1/1/list.php',
        <String, String>{'a': "list"});
    final areaResponse = await _httpClient.get(areaRequest);
    var mealsCategoriesJson = CheckForResponse(areaResponse);
    return MealsArea.fromJson(mealsCategoriesJson);
  }
  Future<Iterable> getHomeRequest() async {
    final ingredientRequest = Uri.https(_baseUrl, '/api/json/v1/1/list.php',
        <String, String>{'i': "list"});
    final areaRequest = Uri.https(_baseUrl, '/api/json/v1/1/list.php',
        <String, String>{'a': "list"});
    final responses = await Future.wait([_httpClient.get(areaRequest),_httpClient.get(ingredientRequest)]);
    return [
      CheckForResponse(responses[0]),
      CheckForResponse(responses[1]),

    ];
    // var mealsCategoriesJson = CheckForResponse(areaResponse);
    // return MealsArea.fromJson(mealsCategoriesJson);
  }

  Future<IngredientResponse> getIngredients() async {
    final areaRequest = Uri.https(_baseUrl, '/api/json/v1/1/list.php',
        <String, String>{'i': "list"});
    final areaResponse = await _httpClient.get(areaRequest);
    var mealsCategoriesJson = CheckForResponse(areaResponse);
    return IngredientResponse.fromJson(mealsCategoriesJson);
  }


  Future<FilterResponse> getFilterData(COOK cookType,String filterQuery) async {
    final areaRequest = Uri.https(_baseUrl, '/api/json/v1/1/filter.php',
        <String, String>{'${cookType.name}': filterQuery});
    final areaResponse = await _httpClient.get(areaRequest);
    var mealsCategoriesJson = CheckForResponse(areaResponse);
    return FilterResponse.fromJson(mealsCategoriesJson);
  }

  CheckForResponse(http.Response categoriesResponse) {
    if (categoriesResponse.statusCode != 200) {
      debugPrint(categoriesResponse.body.toString());
      throw Failure();
    }

    final mealsCategoriesJson = jsonDecode(
      categoriesResponse.body,
    );

    if (mealsCategoriesJson.isEmpty) {
      throw NotFound();
    }
    return mealsCategoriesJson;
  }
}
