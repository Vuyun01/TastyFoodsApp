import 'package:flutter/material.dart';
import 'package:recipes_app/models/meal.dart';
import 'package:recipes_app/screens/meal_detail_screen.dart';
import 'package:recipes_app/widgets/meal_utility_desc.dart';
import 'package:recipes_app/constant.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.item});

  final Meal item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => Navigator.of(context)
            .pushNamed(MealDetailScreen.routeName, arguments: item),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      item.imageURL,
                      fit: BoxFit.cover,
                      height: 250,
                      width: double.maxFinite,
                    )),
                Positioned(
                  bottom: 20,
                  right: 100,
                  left: 20,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        item.title,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  MealUtilityDescription(
                      icon: Icons.timer_outlined,
                      text: '${item.duration} mins'),
                  const Spacer(),
                  MealUtilityDescription(
                      icon: Icons.timelapse,
                      text: getComplexity(item.complexity)),
                  const Spacer(),
                  MealUtilityDescription(
                      icon: Icons.monetization_on_outlined,
                      text: getAffordability(item.affordability)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
