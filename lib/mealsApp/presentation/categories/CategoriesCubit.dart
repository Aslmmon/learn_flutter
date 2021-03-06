import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/mealsApp/common/mappers/Mapper.dart';
import 'package:learn_flutter/mealsApp/data/network/ApiClient.dart';
import 'package:learn_flutter/mealsApp/data/repository/MealsRepository.dart';
import 'package:learn_flutter/mealsApp/presentation/categories/CategoriesState.dart';


class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(CategoriesState initialState) : super(initialState);

  final MealsRepository _mealsRepository = MealsRepository(apiClient: ApiClient());
  final toSourceMapper = ToUIViewFromCategories();

  void getCategories() async {
    try {
      emit(LoadingState());
      final movies = await _mealsRepository.getCategories();
      emit(LoadedState(toSourceMapper(movies)));
    } catch (e){
      emit(ErrorState(e.toString()));
    }
  }

}