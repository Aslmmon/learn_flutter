import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/mealsApp/Constants.dart';
import 'package:learn_flutter/mealsApp/common/theme/Theme.dart';
import 'package:learn_flutter/mealsApp/presentation/categories/CategoriesScreen.dart';
import 'package:learn_flutter/mealsApp/presentation/chooser/chooser.dart';
import 'package:learn_flutter/mealsApp/presentation/ingredients/IngredientCubit.dart';
import 'package:learn_flutter/mealsApp/presentation/ingredients/IngredientState.dart';
import 'package:learn_flutter/mealsApp/presentation/themeCubit.dart';

class IngredientScreen extends StatefulWidget {
  const IngredientScreen({Key? key}) : super(key: key);

  @override
  _IngredientScreen createState() => _IngredientScreen();
}

class _IngredientScreen extends State<IngredientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<IngredientCubit, IngredientState>(
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
                            context.read<ThemeCubit>().changeTheme(appThemeData[AppTheme.BlueDark]);

                            DataToBeSent dataToBeSent  = DataToBeSent(id: data.meals![index].strIngredient,cook: COOK.INGREDIENTS);
                            Navigator.of(context).pushNamed(filters_route,arguments: dataToBeSent);
                          },
                          child: Text(data.meals![index].strIngredient!))),
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
    context.read<IngredientCubit>().getIngredients();
  }
}
