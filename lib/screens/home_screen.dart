import 'package:flutter/material.dart';
import 'package:recipes_app/models/meal.dart';
import 'package:recipes_app/screens/categories_screen.dart';
import 'package:recipes_app/screens/favorite_screen.dart';
import 'package:recipes_app/widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';
  const HomeScreen({super.key, required this.favorites});

  final List<Meal> favorites;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final List<Map<String, Object>> _listScreen;

  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _listScreen = [
      {'page': const CategoriesScreen(), 'title': 'Tasty Foods'},
      {
        'page': FavoriteScreen(
          favorites: widget.favorites,
        ),
        'title': 'My Favorites'
      },
    ];
    super.initState();
  }

  void _setSelectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_listScreen[_selectedIndex]['title']}'),
      ),
      drawer: const CustomDrawer(),
      body: _listScreen[_selectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.black45,
          backgroundColor: Colors.white,
          onTap: _setSelectedPage,
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.list), label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined), label: "Favorites")
          ]),
    );
  }
}
