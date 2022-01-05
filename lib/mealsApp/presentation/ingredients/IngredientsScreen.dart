import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/mealsApp/common/theme/Theme.dart';
import 'package:learn_flutter/mealsApp/common/widgets/card/cardwidgets.dart';
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
            itemBuilder: (context, index) => buildCardWidget(data, index, context),
          );
        } else {
          return const Center(child: Text(""));
        }
      }),
    );
  }


  @override
  void initState() {
    context.read<ThemeCubit>().changeTheme(appThemeData[AppTheme.BlueDark]);
    context.read<IngredientCubit>().getIngredients();
  }
}
