import 'package:equatable/equatable.dart';
import 'package:learn_flutter/mealsApp/data/model/meals_categories_response.dart';

enum HomeStatus { loading, success, failure }

abstract class HomeState extends Equatable {}

class InitialState extends HomeState {
  @override
  List<Object> get props => [];
}

class LoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class LoadedState extends HomeState {
  LoadedState(this.meals);

  final MealsCategoriesResponse meals;

  @override
  List<Object> get props => [meals];
}

class ErrorState extends HomeState {
  ErrorState(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
