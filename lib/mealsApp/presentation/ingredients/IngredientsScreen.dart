import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/mealsApp/Constants.dart';
import 'package:learn_flutter/mealsApp/common/theme/TextTheme.dart';
import 'package:learn_flutter/mealsApp/common/theme/Theme.dart';
import 'package:learn_flutter/mealsApp/data/model/ingredient_response.dart';
import 'package:learn_flutter/mealsApp/data/repository/MealsRepository.dart';
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
            itemCount: data.length,
            itemBuilder: (context, index) =>
                Card(child: buildCardWidget(data, index, context)),
          );
        } else {
          return const Center(child: Text("Heello"));
        }
      }),
    );
  }

  GestureDetector buildCardWidget(
      List<UIView> data, int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        DataToBeSent dataToBeSent = DataToBeSent(
            id: data[index].title, cook: COOK.INGREDIENTS);
        Navigator.of(context).pushNamed(filters_route, arguments: dataToBeSent);
      },
      child: ListTile(
          title: Text(
        data[index].title,
        style: ThemeText.headerBody,
      )),
    );
  }

  @override
  void initState() {
    context.read<ThemeCubit>().changeTheme(appThemeData[AppTheme.BlueDark]);
    context.read<IngredientCubit>().getIngredients();
  }
}
