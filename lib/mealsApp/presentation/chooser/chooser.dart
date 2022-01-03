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
    list.add(CookType("Categories", 1));
    list.add(CookType("Area", 2));
    list.add(CookType("Ingredients", 3));
    return list;
  }

  Widget CardCookType(CookType cookType, BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(cookType.id==1){
          Navigator.of(context).pushNamed(categories_route);
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
