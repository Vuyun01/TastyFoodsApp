import 'package:flutter/material.dart';
import 'package:recipes_app/widgets/meal_item.dart';
import 'package:recipes_app/widgets/related_meal_card.dart';

import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key, required this.favorites});

  final List<Meal> favorites;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: favorites.isEmpty
            ? Text(
                'You don\'t have any favorite meals. \nPlease go back and add some!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              )
            : ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) => MealItem(
                      item: favorites[index],
                    )));
  }
}
