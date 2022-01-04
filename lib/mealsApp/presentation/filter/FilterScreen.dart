import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/mealsApp/presentation/categories/CategoriesScreen.dart';
import 'package:learn_flutter/mealsApp/presentation/chooser/chooser.dart';
import 'package:learn_flutter/mealsApp/presentation/filter/FilterCubit.dart';
import 'package:learn_flutter/mealsApp/presentation/filter/FilterStates.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: BlocBuilder<FilterCubit, FilterState>(builder: (context, state) {

        if (state is LoadingState) return const Center(child: CircularProgressIndicator());
        if (state is ErrorState) {
          return  Center(
            child: Text(state.error),
          );
        }
        if (state is LoadedState) {
          final data = state.meals;
          return ListView.builder(
            itemCount: data.meals!.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text(data.meals![index].strMeal!),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(data.meals![index].strMealThumb!),
                ),
              ),
            ),
          );
        }
        else {
          return const Center(child: Text("Hello"));
        }
      }),
    );
  }



  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)!.settings.arguments as DataToBeSent;
    context.read<FilterCubit>().getFilters(args.cook, args.id);

  }
}
