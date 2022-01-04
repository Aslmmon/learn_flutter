import 'package:equatable/equatable.dart';
import 'package:learn_flutter/mealsApp/data/model/ingredient_response.dart';
import 'package:learn_flutter/mealsApp/data/model/meals_categories_response.dart';

enum IngredientStatus { loading, success, failure }

abstract class IngredientState extends Equatable {}

class InitialStateIngredient extends IngredientState {
  @override
  List<Object> get props => [];
}

class LoadingState extends IngredientState {
  @override
  List<Object> get props => [];
}

class LoadedState extends IngredientState {
  LoadedState(this.meals);

  final IngredientResponse meals;

  @override
  List<Object> get props => [meals];
}

class ErrorState extends IngredientState {
  ErrorState(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
