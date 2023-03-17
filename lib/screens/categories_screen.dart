import 'package:flutter/material.dart';
import 'package:recipes_app/widgets/category_item.dart';
import 'package:recipes_app/screens/category_recipes_screen.dart';

import '../constant.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = '/categories';
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20),
      children: demoCategories
          .map((e) => CategoryItem(
                item: e,
                onTap: () => Navigator.of(context)
                    .pushNamed(CategoryRecipesScreen.routeName, arguments: e),
              ))
          .toList(),
    );
  }
}
