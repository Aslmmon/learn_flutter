import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/mealsApp/presentation/themeState.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(initialThemState initialState) : super(initialState);




  void changeTheme(theme) async {
      emit(LoadThemeState(theme));
  }


}