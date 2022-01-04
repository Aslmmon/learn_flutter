import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/mealsApp/Constants.dart';

class Chooser extends StatelessWidget {
  const Chooser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Choose your Type")),
        body: GridView.count(
            crossAxisCount: 2,
            children: List.generate(provideListOfCookType().length, (index) => CardCookType(provideListOfCookType()[index],context))));
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
      onTap: (){
        if(cookType.id==COOK.CATEGORIES.value){
          Navigator.of(context).pushNamed(categories_route);
        }
        if(cookType.id==COOK.AREAS.value){
          Navigator.of(context).pushNamed(areas_route);
        }
        if(cookType.id==COOK.INGREDIENTS.value){
         // Navigator.of(context).pushNamed(categories_route);
        }

      },
      child: Card(
        elevation: 5,
        color: Colors.lightBlue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Text(cookType.title),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}

class CookType {
  CookType(this.title, this.id);

  final String title;
  final int id;
}
enum COOK {CATEGORIES ,AREAS , INGREDIENTS}
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
