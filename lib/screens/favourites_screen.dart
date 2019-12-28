import 'package:flutter/material.dart';
import 'package:meals_app/modals/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {

  final List<Meal> favouriteMeals;
  FavoritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favouriteMeals.isEmpty){
    return Container(
      child: Center(
        child: Text('You have no favourites yet - start adding some!'),
      ),
    );
    }
    else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(favouriteMeals[index]);
        },
        itemCount: favouriteMeals.length,
        scrollDirection: Axis.vertical,
      );
    }

  }
}
