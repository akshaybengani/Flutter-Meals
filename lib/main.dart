import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/screens/settings_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import 'modals/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _settings = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setSettings(Map<String, bool> settingsData) {
    setState(() {
      _settings = settingsData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_settings['gluten'] && !meal.isGlutenFree) return false;
        if (_settings['lactose'] && !meal.isLactoseFree) return false;
        if (_settings['vegan'] && !meal.isVegan) return false;
        if (_settings['vegetarian'] && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id){
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primaryColor: Colors.orange,
        primarySwatch: Colors.yellow,
        canvasColor: Color.fromRGBO(225, 254, 229, 1),
        fontFamily: 'Railway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      // home: MyHomePage(),
      // initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(_toggleFavorite, _isMealFavorite),
        SettingsScreen.routeName: (ctx) =>
            SettingsScreen(_settings, _setSettings),
      },
      onGenerateRoute: (settings) {
        // This is useful when we create highly dynamic apps which they dont know what page will be the next
        // As such now the settings.arguments will return the route name of the requested route
        // And if you have not configured it then it will be useful to open that page,
        // remember this will open the page but no data will be carried since it is an accidental route.
        print(settings.arguments);
        // You can specify your dynamic page route settings and redirect using MaterialPageRoute
        // if(settings.arguments == 'meal-details'){
        //   return MaterialPageRoute(builder: (ctx) => MealDetailsScreen());
        // }

        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },

      // It is reached when flutter failed to build a screen with all other measures
      // Its like a 404 page we can use it in flutter web
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
