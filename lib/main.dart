import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/mealsApp/Constants.dart';
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
import 'mealsApp/presentation/area/AreaCubit.dart';
import 'mealsApp/presentation/categories/CategoriesState.dart';
import 'mealsApp/presentation/filter/FilterStates.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => HomeCubit(InitialState())),
    BlocProvider(create: (context) => CategoriesCubit(InitialStateCategories())),
    BlocProvider(create: (context) => FilterCubit(InitialStateFilters())),
    BlocProvider(create: (context) => AreaCubit(InitialStateArea()))

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

      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
    );
  }
}
