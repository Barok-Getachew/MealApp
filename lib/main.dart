// ignore_for_file: non_constant_identifier_name

import 'package:flutter/material.dart';
import 'package:thserd_project/Screens/filters_screen.dart';
import 'package:thserd_project/Screens/tabs_Screen.dart';
import 'package:thserd_project/dummy_data.dart';
import 'Screens/catagory_meal_screen.dart';
import 'Screens/meal_detail_screen.dart';
import 'Screens/catagories_screen.dart';
import './models/Meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  final List<Meal> _favoriteMeals = [];
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((Meal) {
        if (_filters['glutten']! && !Meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !Meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !Meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !Meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((Meal) => Meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((Meal) => Meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    // ignore: avoid_types_as_parameter_names
    return _favoriteMeals.any((Meal) => Meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: TextStyle(
                color: Color(0xFF143333),
              ),
              bodyMedium: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleLarge: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        CatagoryMealScreen.routename: (ctx) =>
            CatagoryMealScreen(_availableMeals),
        MealDetailScreen.routname: (ctx) =>
            MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routename: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // if (settings.name == '/meal-detail') {
        //   return ...;
        // } else if (settings.name == '/something-else') {
        //   return ...;
        // }
        // return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CatagoriesScreen(),
        );
      },
    );
  }
}
