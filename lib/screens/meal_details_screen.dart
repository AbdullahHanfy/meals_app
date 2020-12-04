import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetails extends StatelessWidget {
  final String id;
  MealDetails({@required this.id});

  @override
  Widget build(BuildContext context) {
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
    Widget buildTitle(BuildContext ctx, String title) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    }

    Widget buildContainer(BuildContext ctx, Widget child) {
      return Container(
        height: 200,
        width: 300,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: child,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                )),
            buildTitle(context, 'Ingredients'),
            buildContainer(
                context,
                ListView.builder(
                    itemCount: selectedMeal.ingredients.length,
                    itemBuilder: (ctx, index) => Card(
                          color: Theme.of(context).accentColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(selectedMeal.ingredients[index]),
                          ),
                        ))),
            buildTitle(context, 'Steps'),
            buildContainer(
                context,
                ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (ctx, index) => ListTile(
                    title: Text(selectedMeal.steps[index]),
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
