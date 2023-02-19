import 'package:flutter/material.dart';
import 'package:recipes_app/screens/meal_detail_screen.dart';

import '../models/meal.dart';
import 'meal_utility_desc.dart';

class RelatedMealCard extends StatelessWidget {
  const RelatedMealCard({
    Key? key,
    required this.meal,
  }) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(MealDetailScreen.routeName, arguments: meal),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
        child: SizedBox(
          width: 160,
          height: 240,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  meal.imageURL,
                  height: 150,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                      child: Text(
                        meal.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        softWrap: true,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MealUtilityDescription(
                        iconSize: 18,
                        textSize: 12,
                        icon: Icons.timer_outlined,
                        text: '${meal.duration} mins')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
