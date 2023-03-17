import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/provider/meals.dart';

import '../widgets/meal/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meals = Provider.of<Meals>(context).meals.where((e) => e.isFavorite).toList();
    return Center(
        child: meals.isEmpty
            ? Text(
                'You don\'t have any favorite meals. \nPlease go back and add some!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              )
            : ListView.builder(
                itemCount: meals.length,
                itemBuilder: (context, index) => MealItem(
                      meal: meals[index],
                    )));
  }
}
