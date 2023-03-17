import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/provider/meals.dart';
import 'package:recipes_app/screens/categories_screen.dart';
import 'package:recipes_app/screens/home_screen.dart';
import 'package:recipes_app/screens/meal_detail_screen.dart';
import 'package:recipes_app/screens/settings_screen.dart';
import 'package:recipes_app/screens/category_recipes_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Meals(),
      child: MaterialApp(
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
            SettingsScreen.routeName: (context) => const SettingsScreen(),
            MealDetailScreen.routeName: (context) => const MealDetailScreen(),
            HomeScreen.routeName: (context) => const HomeScreen(),
            CategoryRecipesScreen.routeName: (context) =>
                const CategoryRecipesScreen()
          },
          onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => const CategoriesScreen())),
    );
  }
}
