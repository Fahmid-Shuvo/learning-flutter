import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy-data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static final routeName = '/categoy-meals';
  // final String categoryId;
  // final String categoryTitle;
  // final Color categoryColor;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle, this.categoryColor);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((item) {
      return item.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
            itemCount: categoryMeals.length,
            itemBuilder: (ctx, index) {
              return MealItem(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                affordability: categoryMeals[index].affordability,
                complexity: categoryMeals[index].complexity,
              );
            }));
  }
}
