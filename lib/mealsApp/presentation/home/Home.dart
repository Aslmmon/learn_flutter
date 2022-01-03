import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/mealsApp/presentation/home/HomeCubit.dart';
import 'package:learn_flutter/mealsApp/presentation/home/HomeState.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();


}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        if (state is LoadingState) return Center(child: const CircularProgressIndicator());

        if (state is ErrorState) {
          return  Center(
          child: Text(state.error),
        );
        }
        if (state is LoadedState) {
          final data = state.meals;
          return ListView.builder(
            itemCount: data.categories!.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text(data.categories![index].strCategory!),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(data.categories![index].strCategoryThumb!),
                ),
              ),
            ),
          );
        }else {
          return const Center(child: Text("Heello"));
        }
      }),
    );
  }

  @override
  void initState() {
    context.read<HomeCubit>().getMealsCategories();
  }
}
