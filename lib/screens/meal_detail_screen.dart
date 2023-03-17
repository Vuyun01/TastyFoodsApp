import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/provider/meals.dart';
import 'package:recipes_app/widgets/meal/meal_details.dart';

import '../models/meal.dart';
import '../widgets/meal/meal_header_image.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal';
  const MealDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;
    return Scaffold(
        // appBar: AppBar(backgroundColor: Colors.transparent,),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MealHeaderImage(meal: meal),
              MealDetails(meal: meal),
            ],
          ),
        ),
        floatingActionButton: Consumer<Meals>(builder: (_, meals, __) {
          final index = meals.meals.indexWhere(
            (element) => element.id == meal.id,
          );
          return FloatingActionButton(
            onPressed: () => Provider.of<Meals>(context, listen: false)
                .updateFavorite(meals.meals[index]),
            child: Icon(
              meal.isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
              color: Colors.white,
            ),
          );
        }));
  }
}
