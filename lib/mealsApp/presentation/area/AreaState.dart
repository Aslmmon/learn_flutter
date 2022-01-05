import 'package:equatable/equatable.dart';
import 'package:learn_flutter/mealsApp/data/model/meals_area.dart';
import 'package:learn_flutter/mealsApp/data/repository/MealsRepository.dart';

enum AreaStatus { loading, success, failure }

abstract class AreaState extends Equatable {}

class InitialStateArea extends AreaState {
  @override
  List<Object> get props => [];
}

class LoadingState extends AreaState {
  @override
  List<Object> get props => [];
}

class LoadedState extends AreaState {
  LoadedState(this.meals);

  final List<UIView> meals;

  @override
  List<Object> get props => [meals];
}

class ErrorState extends AreaState {
  ErrorState(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
