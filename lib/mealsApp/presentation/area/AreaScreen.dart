import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/mealsApp/Constants.dart';
import 'package:learn_flutter/mealsApp/common/theme/TextTheme.dart';
import 'package:learn_flutter/mealsApp/common/theme/Theme.dart';
import 'package:learn_flutter/mealsApp/presentation/area/AreaCubit.dart';
import 'package:learn_flutter/mealsApp/presentation/area/AreaState.dart';
import 'package:learn_flutter/mealsApp/presentation/categories/CategoriesScreen.dart';
import 'package:learn_flutter/mealsApp/presentation/chooser/chooser.dart';

import '../themeCubit.dart';

class AreaScreen extends StatefulWidget {
  const AreaScreen({Key? key}) : super(key: key);

  @override
  _AreaScreen createState() => _AreaScreen();
}

class _AreaScreen extends State<AreaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AreaCubit, AreaState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ErrorState) {
              return Center(
                child: Text(state.error),
              );
            }
            if (state is LoadedState) {
              final data = state.meals;
              return ListView.builder(
                itemCount: data.meals!.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                      title: GestureDetector(
                          onTap: (){
                            DataToBeSent dataToBeSent  = DataToBeSent(id: data.meals![index].strArea,cook: COOK.AREAS);
                            Navigator.of(context).pushNamed(filters_route,arguments: dataToBeSent);
                          },
                          child: Text(data.meals![index].strArea!,style: ThemeText.headerBody))),
                ),
              );
            } else {
              return const Center(child: Text("Heello"));
            }
          }),
    );
  }

  @override
  void initState() {
    context.read<ThemeCubit>().changeTheme(appThemeData[AppTheme.BlueLight]);
    context.read<AreaCubit>().getAreas();
  }
}
