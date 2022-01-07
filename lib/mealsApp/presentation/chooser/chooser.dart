import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/mealsApp/Constants.dart';
import 'package:learn_flutter/mealsApp/common/theme/ThemeText.dart';
import 'package:learn_flutter/mealsApp/presentation/categories/CategoriesCubit.dart';

class Chooser extends StatefulWidget {
  const Chooser({Key? key}) : super(key: key);

  @override
  State<Chooser> createState() => _ChooserState();
}

class _ChooserState extends State<Chooser> {
  final PageController _controller =
      PageController(initialPage: 0, viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          ProfileWidget(),
          SearchForm(),
          CategoriesSection(),
          popularSection(),
          SearchSection()
        ])));
  }

  @override
  void initState() {
      context.read<CategoriesCubit>().getCategories();
  }

  Container popularSection() {
    return Container(
      margin: Margins.margin20,
      child: Wrap(
        direction: Axis.horizontal,
        children: [
          Text("Popular", style: ThemeText.headerFont14),
          Container(
            height: 150,
            width: double.infinity,
            child: ListView.builder(
              itemCount: provideListOfCookType().length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    providePlaceHolder(120, 100),
                    Text(provideListOfCookType()[index].title)
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Container CategoriesSection() {
    return Container(
      margin: Margins.margin20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text("Select a category", style: ThemeText.headerFont14),
          SizedBoxConstraints.sizedBox10,
          Container(
            height: 100,
            width: double.infinity,
            child: ListView.builder(
              itemCount: provideListOfCookType().length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    providePlaceHolder(50, 50),
                    Text(provideListOfCookType()[index].title)
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Container SearchSection() {
    return Container(
      margin: Margins.margin20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text("Search by Area", style: ThemeText.headerFont14),
          SizedBoxConstraints.sizedBox10,
          Container(
            height: 100,
            width: double.infinity,
            child: ListView.builder(
              itemCount: provideListOfCookType().length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    providePlaceHolder(50, 50),
                    Text(provideListOfCookType()[index].title)
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Container SearchForm() {
    return Container(
      margin: Margins.margin20,
      child: TextFormField(
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          fillColor: Colors.grey,
          border: OutlineInputBorder(),
          labelText: 'Serch Products here..',
        ),
      ),
    );
  }

  Container ProfileWidget() {
    return Container(
      margin: Margins.margin20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Hello there,Ana!", style: ThemeText.headerFont24),
          providePlaceHolder(50, 50),
        ],
      ),
    );
  }

  List<CookType> provideListOfCookType() {
    List<CookType> list = [];

    list.add(CookType("Categories", COOK.CATEGORIES.value));
    list.add(CookType("Area", COOK.AREAS.value));
    list.add(CookType("Ingredients", COOK.INGREDIENTS.value));
    return list;
  }

  Widget CardCookType(CookType cookType, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (cookType.id == COOK.CATEGORIES.value) {
          Navigator.of(context).pushNamed(categories_route);
        }
        if (cookType.id == COOK.AREAS.value) {
          Navigator.of(context).pushNamed(areas_route);
        }
        if (cookType.id == COOK.INGREDIENTS.value) {
          Navigator.of(context).pushNamed(ingredients_route);
        }
      },
      child: Card(
        margin: EdgeInsets.all(20),
        elevation: 5,
        color: Theme.of(context).cardColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Text(cookType.title, style: ThemeText.headerFont30),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class CookType {
  CookType(this.title, this.id);

  final String title;
  final int id;
}

enum COOK { CATEGORIES, AREAS, INGREDIENTS }

extension COOKEXT on COOK {
  static const _values = [1, 2, 3];

  int get value => _values[this.index];

  String? get name {
    switch (this) {
      case COOK.AREAS:
        return "a";
      case COOK.CATEGORIES:
        return "c";
      case COOK.INGREDIENTS:
        return "i";
      default:
        return null;
    }
  }
}
