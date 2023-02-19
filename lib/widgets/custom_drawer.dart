import 'package:flutter/material.dart';
import 'package:recipes_app/screens/home_screen.dart';
import 'package:recipes_app/screens/settings_screen.dart';

import 'custom_drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      width: size.width*0.6,
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 150,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Text(
              'Cooking Up!',
              style: Theme.of(context).textTheme.headline3?.copyWith(
                  color: const Color.fromARGB(255, 124, 241, 23),
                  fontFamily: 'Raleway',
                  fontSize: 30),
            ),
          ),
          CustomDrawerItem(
            icon: Icons.restaurant_menu,
            onTap: () => Navigator.of(context).pushReplacementNamed(HomeScreen.routeName),
            text: 'Meals',
          ),
          CustomDrawerItem(
            icon: Icons.settings,
            onTap: () => Navigator.of(context).pushNamed(SettingsScreen.routeName),
            text: 'Settings',
          ),
        ],
      ),
    );
  }
}
