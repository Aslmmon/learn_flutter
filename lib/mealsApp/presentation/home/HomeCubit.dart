import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/mealsApp/data/network/ApiClient.dart';
import 'package:learn_flutter/mealsApp/data/repository/MealsRepository.dart';

import 'HomeState.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(HomeState initialState) : super(initialState);

  final MealsRepository _mealsRepository = MealsRepository(apiClient: ApiClient());


  void getMealsCategories() async {
    try {
      emit(LoadingState());
      final movies = await _mealsRepository.getMealsCategories();
      emit(LoadedState(movies));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

}