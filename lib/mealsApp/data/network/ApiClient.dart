import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:learn_flutter/mealsApp/data/model/meals_area.dart';
import 'package:learn_flutter/mealsApp/data/model/meals_categories.dart';
import 'package:learn_flutter/mealsApp/data/model/meals_categories_response.dart';
import 'package:http/http.dart' as http;

/// Exception thrown when locationSearch fails.
class Failure implements Exception {}

/// Exception thrown when the provided location is not found.
class NotFound implements Exception {}

/// Exception thrown when getWeather fails.

class ApiClient {
  ApiClient({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'www.themealdb.com';
  final http.Client _httpClient;


  Future<MealsCategoriesResponse> getMealsCategories() async {
    final categoriesRequest = Uri.https(
      _baseUrl,
      '/api/json/v1/1/categories.php');
    final categoriesResponse = await _httpClient.get(categoriesRequest);

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

    return MealsCategoriesResponse.fromJson(mealsCategoriesJson);
  }


  Future<MealsCategories> getCategories() async {
    final categoriesRequest = Uri.https(
        _baseUrl,
        '/api/json/v1/1//list.php',
      <String, String>{'c': "list"},
    );
    final categoriesResponse = await _httpClient.get(categoriesRequest);

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

    return MealsCategories.fromJson(mealsCategoriesJson);
  }



  //
  // Future<MealsArea> getAreas() async {
  //   final categoriesRequest = Uri.https(
  //       _baseUrl,
  //       '/api/json/v1/1/categories.php');
  //   final categoriesResponse = await _httpClient.get(categoriesRequest);
  //
  //   if (categoriesResponse.statusCode != 200) {
  //     debugPrint(categoriesResponse.body.toString());
  //     throw Failure();
  //   }
  //
  //   final mealsCategoriesJson = jsonDecode(
  //     categoriesResponse.body,
  //   );
  //
  //   if (mealsCategoriesJson.isEmpty) {
  //     throw NotFound();
  //   }
  //
  //   return MealsCategoriesResponse.fromJson(mealsCategoriesJson);
  // }




}