import 'package:equatable/equatable.dart';
import 'package:learn_flutter/mealsApp/data/model/meals_categories.dart';
import 'package:learn_flutter/mealsApp/data/model/meals_categories_response.dart';

enum CategoriesStatus { loading, success, failure }

abstract class CategoriesState extends Equatable {}

class InitialStateCategories extends CategoriesState {
  @override
  List<Object> get props => [];
}

class LoadingState extends CategoriesState {
  @override
  List<Object> get props => [];
}

class LoadedState extends CategoriesState {
  LoadedState(this.meals);

  final MealsCategories meals;

  @override
  List<Object> get props => [meals];
}

class ErrorState extends CategoriesState {
  ErrorState(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
