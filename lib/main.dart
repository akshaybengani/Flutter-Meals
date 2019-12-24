import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meals_app/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
          primaryColor: Colors.orange,
          primarySwatch: Colors.yellow,
          fontFamily: 'Railway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 31, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 31, 1)),
    ),);
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meals App',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: CategoriesScreen(),
    );
  }
}
