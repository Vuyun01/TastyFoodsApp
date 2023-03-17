import 'package:flutter/material.dart';

import '../../models/meal.dart';

class IngredientsMeal extends StatelessWidget {
  const IngredientsMeal({
    Key? key,
    required this.meal,
  }) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: meal.ingredients
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    e,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ))
            .toList());
  }
}
