import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final String id;
  final String title;

  CategoriesMealsScreen({this.id, this.title});
  @override
  Widget build(BuildContext context) {
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                imgUrl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                complexity: categoryMeals[index].complexity,
                affordability: categoryMeals[index].affordability);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
