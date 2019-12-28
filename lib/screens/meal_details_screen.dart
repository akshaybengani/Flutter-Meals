import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavourite;
  final Function isFavorite;
  MealDetailsScreen(this.toggleFavourite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: 'RobotoCondensed',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as String;
    final mealId = routeArgs;

    // firstWhere is used when we need to search for a single item in the dict
    // This takes an annonymous function
    final mealData = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(mealData.title),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 8,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              height: 200,
              margin: EdgeInsets.all(10),
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  mealData.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 200,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  elevation: 2,
                  // color: Theme.of(context).accentColor,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      mealData.ingredients[index],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                itemCount: mealData.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 200,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ' + (index + 1).toString()),
                      ),
                      title: Text(mealData.steps[index]),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                  ],
                ),
                itemCount: mealData.steps.length,
              ),
            ),
            buildSectionTitle(context, 'More'),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(MdiIcons.leaf),
                      SizedBox(width: 5),
                      Text('Vegan'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(MdiIcons.roomService),
                      SizedBox(width: 5),
                      Text('Vegetarian'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(MdiIcons.rice),
                      SizedBox(width: 5),
                      Text('Glutton Free'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId) ? Icons.favorite : Icons.favorite_border,
        ),
        onPressed: () => toggleFavourite(mealId),
      ),
    );
  }
}
