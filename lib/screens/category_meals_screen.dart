import 'package:flutter/material.dart';
import 'package:meals_app/modals/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId,this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryID = routeArgs['id'];

    // categoryMeals is a whole long array of DUMMY_MEALS
    //sorted in such a form that the categoryID array items come with the object
    // Now we have the whole list of meal object with all its properties.
    final categoryMeals =  availableMeals.where((meal) {
      return meal.categories.contains(categoryID);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      backgroundColor: Colors.white,
      // ListView is needed to build this list which returns his own context ctx and a index
      // Array of elements in the list and we provide the length of list using our new object
      // categoryMeals.length since that was a list containing all the item values.
      // As such in the annonymous function we return the layout containing item.
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(categoryMeals[index]);
        },
        itemCount: categoryMeals.length,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
