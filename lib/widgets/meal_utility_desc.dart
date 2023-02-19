import 'package:flutter/material.dart';

class MealUtilityDescription extends StatelessWidget {
  const MealUtilityDescription({
    Key? key,
    required this.icon,
    required this.text,
    this.iconSize = 20,
    this.textSize = 14
  }) : super(key: key);

  final IconData icon;
  final String text;
  final double iconSize;
  final double textSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: iconSize,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: textSize),
        ),
      ],
    );
  }
}
