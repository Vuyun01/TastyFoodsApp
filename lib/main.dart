import 'package:flutter/material.dart';
import 'package:recipes_app/demo_data.dart';
import 'package:recipes_app/models/meal.dart';
import 'package:recipes_app/screens/categories_screen.dart';
import 'package:recipes_app/screens/home_screen.dart';
import 'package:recipes_app/screens/meal_detail_screen.dart';
import 'package:recipes_app/screens/settings_screen.dart';
import 'package:recipes_app/screens/category_recipes_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

//default filter
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _favoriteMeals = [];
  List<Meal> _filteredMeals = demoMeals;
  void _setFilters(Map<String, bool> newFilters) {
    setState(() {
      _filters = newFilters;

      _filteredMeals = demoMeals.where((item) {
        if (_filters['gluten'] == true && !item.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !item.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !item.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !item.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _setFavorite(Meal meal) {
    if (_favoriteMeals.contains(meal)) {
      setState(() {
        _favoriteMeals.removeWhere((item) => item.id == meal.id);
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
    }
  }

  bool _setFavoriteIcon(Meal item) {
    return _favoriteMeals.contains(item);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Recipes App',
        theme: ThemeData(
            fontFamily: 'Raleway',
            primarySwatch: Colors.teal,
            canvasColor: const Color.fromRGBO(225, 245, 240, 1),
            textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Raleway',
                ),
                bodyText1: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w600,
                    color: Colors.black54),
                bodyText2: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w600,
                    color: Colors.black54),
                headline3: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoCondensed',
                    color: Colors.black54)),
            appBarTheme: AppBarTheme.of(context).copyWith(
                iconTheme:
                    ThemeData.light().iconTheme.copyWith(color: Colors.white),
                centerTitle: true,
                titleTextStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway'))),
        initialRoute: '/',
        routes: {
          SettingsScreen.routeName: (context) =>
              SettingsScreen(filters: _filters, onSetFilter: _setFilters),
          MealDetailScreen.routeName: (context) => MealDetailScreen(
              onFavorite: _setFavorite, onSetIcon: _setFavoriteIcon),
          HomeScreen.routeName: (context) =>
              HomeScreen(favorites: _favoriteMeals),
          CategoryRecipesScreen.routeName: (context) => CategoryRecipesScreen(
                meals: _filteredMeals,
              )
        },
        onGenerateRoute: (settings) =>
            MaterialPageRoute(builder: (context) => const CategoriesScreen()));
  }
}
