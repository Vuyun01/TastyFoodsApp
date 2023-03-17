import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/provider/meals.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = '/settings';
  const SettingsScreen({super.key});

  // final Map<String, bool> filters;
  // final Function onSetFilter;
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // bool _gluten = false;
  // bool _vegan = false;
  // bool _lactose = false;
  // bool _vegetarian = false;

  late Map<String, bool> filters;
  // Map<String, Object> initialFilters = {
  //   'gluten': false,
  //   'lactose': false,
  //   'vegan': false,
  //   'vegetarian': false
  // };
  @override
  void initState() {
    filters = Provider.of<Meals>(context, listen: false).settingFilter;
    // _gluten = filters.settingFilter['gluten'] as bool;
    // _vegan = filters.settingFilter['vegan'] as bool;
    // _lactose = filters.settingFilter['lactose'] as bool;
    // _vegetarian = filters.settingFilter['vegetarian'] as bool;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         final _filters = {
        //           'gluten': _gluten,
        //           'lactose': _lactose,
        //           'vegan': _vegan,
        //           'vegetarian': _vegetarian
        //         };
        //         filters.updateSettings(_filters);
        //       },
        //       icon: const Icon(Icons.save))
        // ],
      ),
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(30),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline3?.copyWith(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w900,
                  color: Colors.black87),
            ),
          ),
          _buildCustomSwitch(
              title: 'Gluten-Free',
              currentValue: filters['gluten'] ?? false,
              updateValue: (value) {
                setState(() {
                  filters['gluten'] = value;
                });
              }),
          _buildCustomSwitch(
              title: 'Lactose-Free',
              currentValue: filters['lactose'] ?? false,
              updateValue: (value) {
                setState(() {
                  filters['lactose'] = value;
                });
              }),
          _buildCustomSwitch(
              title: 'Vegan',
              currentValue: filters['vegan'] ?? false,
              updateValue: (value) {
                setState(() {
                  filters['vegan'] = value;
                });
              }),
          _buildCustomSwitch(
              title: 'Vegetarian',
              currentValue: filters['vegetarian'] ?? false,
              updateValue: (value) {
                setState(() {
                  filters['vegetarian'] = value;
                });
                // print(Provider.of<Meals>(context, listen: false).settingFilter['vegetarian']);
              }),
        ],
      ),
    );
  }

  SwitchListTile _buildCustomSwitch(
      {required String title,
      required bool currentValue,
      required Function(bool newValue) updateValue}) {
    return SwitchListTile.adaptive(
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        subtitle: Text(
          'Only include $title meals',
          style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 14),
        ),
        value: currentValue,
        onChanged: updateValue);
  }
}
