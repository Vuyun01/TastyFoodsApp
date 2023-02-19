import 'package:flutter/material.dart';
import 'package:recipes_app/demo_data.dart';
import 'package:recipes_app/widgets/meal_item.dart';

import '../models/category.dart';
import '../models/meal.dart';

class CategoryRecipesScreen extends StatefulWidget {
  static const String routeName = '/categoryRecipes';
  const CategoryRecipesScreen({
    super.key,
    required this.meals,
  });

  final List<Meal> meals;
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
    // TODO: implement didChangeDependencies
    if (!_loadingData) {
      _category = ModalRoute.of(context)?.settings.arguments as Category;
      _mealsByCategory = widget.meals
          .where((meal) => meal.categories.contains(_category.id))
          .toList();
      super.didChangeDependencies();
      _loadingData = true;
    }
  }

  // void _removeItem(Meal item) {
  //   // print('Deleted');
  //   setState(() {
  //     _mealsByCategory.removeWhere((meal) => meal.id == item.id);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: _category.color,
          title: Text(_category.title),
        ),
        body: ListView.builder(
            itemCount: _mealsByCategory.length,
            itemBuilder: (context, index) => MealItem(
                  item: _mealsByCategory[index],
                )));
  }
}
