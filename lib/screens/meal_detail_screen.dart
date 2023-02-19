import 'package:flutter/material.dart';
import 'package:recipes_app/widgets/meal_details.dart';

import '../models/meal.dart';
import '../widgets/meal_header_image.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal';
  const MealDetailScreen(
      {super.key, required this.onFavorite, required this.onSetIcon});
  final Function onSetIcon;
  final Function onFavorite;
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => onFavorite(meal),
        child: Icon(
          onSetIcon(meal) ? Icons.favorite : Icons.favorite_border_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
