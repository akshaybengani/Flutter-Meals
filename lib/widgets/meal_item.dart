import 'package:flutter/material.dart';
import 'package:meals_app/modals/meal.dart';
import 'package:meals_app/screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  MealItem(this.meal);

  String get complexityText{    
    if(meal.complexity == Complexity.Simple){
      return 'Simple';
    }
    else if(meal.complexity == Complexity.Challenging){
      return 'Challenging';
    }
    else if(meal.complexity == Complexity.Hard){
      return 'Hard';
    }
    else{
      return 'Unknown';
    }
  }
  String get affordabilityText{
    if(meal.affordability == Affordability.Pricy) return 'Pricy';
    if(meal.affordability == Affordability.Luxurious) return 'Luxurious';
    if(meal.affordability == Affordability.Affordable) return 'Affordable';
    else return 'Unknown';
  }

  void selectMeal(BuildContext ctx){
    Navigator.of(ctx).pushNamed(MealDetailsScreen.routeName, arguments: meal.id);
  
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    color: Colors.black54,
                    child: Text(
                      meal.title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text(meal.duration.toString() + ' min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
