import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/mealsApp/Constants.dart';
import 'package:learn_flutter/mealsApp/common/theme/Theme.dart';
import 'package:learn_flutter/mealsApp/presentation/area/AreaScreen.dart';
import 'package:learn_flutter/mealsApp/presentation/area/AreaState.dart';
import 'package:learn_flutter/mealsApp/presentation/categories/CategoriesCubit.dart';
import 'package:learn_flutter/mealsApp/presentation/categories/CategoriesScreen.dart';
import 'package:learn_flutter/mealsApp/presentation/chooser/chooser.dart';
import 'package:learn_flutter/mealsApp/presentation/filter/FilterCubit.dart';
import 'package:learn_flutter/mealsApp/presentation/filter/FilterScreen.dart';
import 'package:learn_flutter/mealsApp/presentation/home/Home.dart';
import 'package:learn_flutter/mealsApp/presentation/home/HomeCubit.dart';
import 'package:learn_flutter/mealsApp/presentation/home/HomeState.dart';
import 'package:learn_flutter/mealsApp/presentation/ingredients/IngredientCubit.dart';
import 'package:learn_flutter/mealsApp/presentation/ingredients/IngredientsScreen.dart';
import 'package:learn_flutter/mealsApp/presentation/themeCubit.dart';
import 'package:learn_flutter/mealsApp/presentation/themeState.dart';
import 'mealsApp/presentation/area/AreaCubit.dart';
import 'mealsApp/presentation/categories/CategoriesState.dart';
import 'mealsApp/presentation/filter/FilterStates.dart';
import 'mealsApp/presentation/ingredients/IngredientState.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => HomeCubit(InitialState())),
    BlocProvider(
        create: (context) => CategoriesCubit(InitialStateCategories())),
    BlocProvider(create: (context) => FilterCubit(InitialStateFilters())),
    BlocProvider(create: (context) => AreaCubit(InitialStateArea())),
    BlocProvider(create: (context) => IngredientCubit(InitialStateIngredient())),
    BlocProvider(create: (context) => ThemeCubit(initialThemState(appThemeData[AppTheme.GreenLight])))

  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: chooser_route,
      routes: {
        chooser_route: (context) => const Chooser(),
        home_route: (context) => const Home(),
        categories_route: (context) => const CategoriesScreen(),
        filters_route: (context) => const FilterScreen(),
        areas_route: (context) => const AreaScreen(),
        ingredients_route: (context) => const IngredientScreen()
      },
      theme:context.read<ThemeCubit>().state.themeData,
    );
  }
}
