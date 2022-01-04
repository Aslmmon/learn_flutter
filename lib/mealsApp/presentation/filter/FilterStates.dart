import 'package:equatable/equatable.dart';
import 'package:learn_flutter/mealsApp/data/model/filter_response.dart';
import 'package:learn_flutter/mealsApp/data/model/meals_categories.dart';
import 'package:learn_flutter/mealsApp/data/model/meals_categories_response.dart';

enum FilterStatus { loading, success, failure }

abstract class FilterState extends Equatable {}

class InitialStateFilters extends FilterState {
  @override
  List<Object> get props => [];
}

class LoadingState extends FilterState {
  @override
  List<Object> get props => [];
}

class LoadedState extends FilterState {
  LoadedState(this.meals);

  final FilterResponse meals;

  @override
  List<Object> get props => [meals];
}

class ErrorState extends FilterState {
  ErrorState(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
