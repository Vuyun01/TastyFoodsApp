import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'custom_back_button.dart';

class MealHeaderImage extends StatelessWidget {
  const MealHeaderImage({
    Key? key,
    required this.meal,
  }) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.maxFinite,
          height: 300,
          child: Image.network(
            meal.imageURL,
            fit: BoxFit.cover,
          ),
        ),
        const Positioned(
            left: 10,
            top: 30,
            child: CustomBackButton())
      ],
    );
  }
}
