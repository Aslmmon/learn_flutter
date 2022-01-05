
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/mealsApp/common/mappers/Mapper.dart';
import 'package:learn_flutter/mealsApp/data/network/ApiClient.dart';
import 'package:learn_flutter/mealsApp/data/repository/MealsRepository.dart';
import 'package:learn_flutter/mealsApp/presentation/area/AreaState.dart';

class AreaCubit extends Cubit<AreaState> {
  AreaCubit(InitialStateArea initialState) : super(initialState);

  final MealsRepository _mealsRepository = MealsRepository(apiClient: ApiClient());
  final toSourceMapper = ToUIViewFromAreas();



  void getAreas() async {
    try {
      emit(LoadingState());
      final movies = await _mealsRepository.getMealsArea();
      emit(LoadedState(toSourceMapper(movies)));
    } catch (e){
      emit(ErrorState(e.toString()));
    }
  }

}