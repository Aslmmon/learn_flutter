
import 'package:flutter/material.dart';
import 'package:learn_flutter/mealsApp/common/theme/ThemeText.dart';
import 'package:learn_flutter/mealsApp/data/repository/MealsRepository.dart';
import 'package:learn_flutter/mealsApp/presentation/categories/CategoriesScreen.dart';
import 'package:learn_flutter/mealsApp/presentation/chooser/chooser.dart';
import '../../../Constants.dart';

Widget buildCardWidget(
    List<UIView> data, int index, BuildContext context,COOK cook) {
  return Card(
    child: GestureDetector(
      onTap: () {
        DataToBeSent dataToBeSent = DataToBeSent(id: data[index].title, cook: cook);
        Navigator.of(context).pushNamed(filters_route, arguments: dataToBeSent);
      },
      child: ListTile(
          title: Text(
            data[index].title,
            style: ThemeText.headerBody,
          )),
    ),
  );
}