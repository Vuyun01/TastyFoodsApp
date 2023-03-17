import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/provider/meals.dart';

import '../models/category.dart';
import '../models/meal.dart';
import '../widgets/meal/meal_item.dart';

class CategoryRecipesScreen extends StatefulWidget {
  static const String routeName = '/categoryRecipes';
  const CategoryRecipesScreen({
    super.key,
  });

  // final List<Meal> meals;
  @override
  State<CategoryRecipesScreen> createState() => _CategoryRecipesScreenState();
}

class _CategoryRecipesScreenState extends State<CategoryRecipesScreen> {
  late final Category _category;
  late final List<Meal> _mealsByCategory;
  bool _loadingData = false;

  @override
  void didChangeDependencies() {
    // print("didChangeDependencies");
    if (!_loadingData) {
      _category = ModalRoute.of(context)?.settings.arguments as Category;
      final listMeals = Provider.of<Meals>(context, listen: false).sortProductsBySettings();
      _mealsByCategory = listMeals
          .where((meal) => meal.categories.contains(_category.id))
          .toList();
      super.didChangeDependencies();
      _loadingData = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: _category.color,
          title: Text(_category.title),
        ),
        body: ListView.builder(
          itemCount: _mealsByCategory.length,
          itemBuilder: (context, index) => MealItem(meal: _mealsByCategory[index],),
        ));
  }
}
