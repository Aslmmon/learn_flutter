import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/mealsApp/data/network/ApiClient.dart';
import 'package:learn_flutter/mealsApp/data/repository/MealsRepository.dart';
import 'package:learn_flutter/mealsApp/presentation/filter/FilterStates.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit(FilterState initialState) : super(initialState);

  final MealsRepository _mealsRepository = MealsRepository(apiClient: ApiClient());



  void getFilters(cookType,filterQuery) async {
    try {
      emit(LoadingState());
      final filters = await _mealsRepository.getFilters(cookType, filterQuery);
      emit(LoadedState(filters));
    } catch (e){
      emit(ErrorState(e.toString()));
    }
  }

}