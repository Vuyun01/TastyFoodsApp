import 'package:flutter/material.dart';
import 'package:recipes_app/demo_data.dart';
import 'package:recipes_app/widgets/meal_utility_desc.dart';
import 'package:recipes_app/widgets/related_meal_card.dart';

import '../models/meal.dart';
import 'meal_header.dart';
import 'meal_ingredients.dart';
import 'meal_instructions.dart';
import 'section_name.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({
    Key? key,
    required this.meal,
  }) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final meals = demoMeals
        .where((item) =>
            item.categories.contains(meal.categories[0]) &&
            item.id != meal.id)
        .toList();
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          MealHeader(meal: meal),
          const Divider(
            color: Colors.black54,
          ),
          SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionName(
                  text: 'Ingredients',
                ),
                IngredientsMeal(meal: meal),
                const SectionName(text: 'Instructions'),
                InstructionsMeal(meal: meal),
                const SectionName(text: 'Related Meals'),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        meals.map((e) => RelatedMealCard(meal: e)).toList(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
