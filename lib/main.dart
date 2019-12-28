import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/screens/settings_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        '/':(ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(),
        SettingsScreen.routeName: (ctx) => SettingsScreen(),
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

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return CategoriesScreen();
//   }
// }
