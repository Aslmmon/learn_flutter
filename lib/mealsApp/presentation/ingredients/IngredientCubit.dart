import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/mealsApp/common/mappers/Mapper.dart';
import 'package:learn_flutter/mealsApp/data/network/ApiClient.dart';
import 'package:learn_flutter/mealsApp/data/repository/MealsRepository.dart';
import 'package:learn_flutter/mealsApp/presentation/ingredients/IngredientState.dart';


class IngredientCubit extends Cubit<IngredientState> {
  IngredientCubit(IngredientState initialState) : super(initialState);

  final MealsRepository _mealsRepository = MealsRepository(apiClient: ApiClient());
  final toSourceMapper = ToUIViewFromIngredients();


  void getIngredients() async {
    try {
      emit(LoadingState());
      final movies = await _mealsRepository.getIngredients();
      emit(LoadedState(toSourceMapper.call(movies)));
    } catch (e){
      emit(ErrorState(e.toString()));
    }
  }


}