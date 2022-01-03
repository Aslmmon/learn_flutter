import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/mealsApp/presentation/categories/CategoriesCubit.dart';
import 'package:learn_flutter/mealsApp/presentation/categories/CategoriesState.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
        if (state is LoadingState)
          return const Center(child: CircularProgressIndicator());
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
              child: ListTile(title: Text(data.meals![index].strCategory!)),
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
    context.read<CategoriesCubit>().getCategories();

  }
}
