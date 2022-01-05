import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/mealsApp/common/theme/Theme.dart';
import 'package:learn_flutter/mealsApp/common/theme/Theme.dart';
import 'package:learn_flutter/mealsApp/common/theme/Theme.dart';
import 'package:learn_flutter/mealsApp/common/theme/Theme.dart';
import 'package:meta/meta.dart';

class ThemeState extends Equatable {
  final ThemeData themeData;

  const ThemeState({required this.themeData}) : super();

  @override
  List<Object?> get props => [];

}

class LoadThemeState extends ThemeState{
  LoadThemeState(ThemeData) : super( themeData: ThemeData);

}
class initialThemState extends ThemeState{
  initialThemState(theme) : super(themeData: theme);

}