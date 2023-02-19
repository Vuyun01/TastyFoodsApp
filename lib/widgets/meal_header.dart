import 'package:flutter/material.dart';
import 'package:recipes_app/widgets/meal_utility_desc.dart';
import 'package:recipes_app/constant.dart';
import '../models/meal.dart';

class MealHeader extends StatelessWidget {
  const MealHeader({
    Key? key,
    required this.meal,
  }) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    Widget _buildChipComponentMeal(String text) {
      return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Chip(
          label: Text(
            text,
            style:
                Theme.of(context).textTheme.headline6?.copyWith(fontSize: 14),
          ),
          elevation: 3,
          backgroundColor: Colors.transparent,
          side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
        ),
      );
    }

    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            meal.title,
            style: Theme.of(context).textTheme.headline3?.copyWith(
                fontFamily: 'Raleway', fontSize: 22, color: Colors.black),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (meal.isVegan) _buildChipComponentMeal('Vegan'),
              if (meal.isGlutenFree) _buildChipComponentMeal('Gluten'),
              if (meal.isLactoseFree) _buildChipComponentMeal('Lactose'),
              if (meal.isVegetarian) _buildChipComponentMeal('Vegetarian'),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              MealUtilityDescription(
                  icon: Icons.timer_outlined, text: '${meal.duration} mins'),
              const SizedBox(
                width: 20,
              ),
              MealUtilityDescription(
                  icon: Icons.timelapse_outlined,
                  text: getComplexity(meal.complexity)),
              const SizedBox(
                width: 20,
              ),
              MealUtilityDescription(
                  icon: Icons.monetization_on_outlined,
                  text: getAffordability(meal.affordability)),
            ],
          ),
        ],
      ),
    );
  }
}
