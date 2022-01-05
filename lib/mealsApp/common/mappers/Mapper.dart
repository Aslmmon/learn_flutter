import 'package:learn_flutter/mealsApp/data/model/ingredient_response.dart';
import 'package:learn_flutter/mealsApp/data/repository/MealsRepository.dart';

abstract class Mapper<FROM, TO> {
  TO call(FROM object);
}
class ToUIViewFromIngredients implements Mapper<IngredientResponse, List<UIView>> {
  @override
  List<UIView> call(IngredientResponse object) {
    List<UIView> uiviews = [];
    object.meals?.forEach((element) {
      uiviews.add(UIView(element.strIngredient!, element.strIngredient!));
    });
    return uiviews;
  }



}