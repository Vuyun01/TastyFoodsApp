import 'package:flutter/material.dart';
import '../models/meal.dart';

class InstructionsMeal extends StatelessWidget {
  const InstructionsMeal({
    Key? key,
    required this.meal,
  }) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
      meal.steps.length,
      (index) => Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          leading: Container(
            width: 50,
            decoration: BoxDecoration(
                color: Colors.black54, borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Text(
                '${index + 1}',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ),
          title: Text(
            meal.steps[index],
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ),
    ));
  }
}
