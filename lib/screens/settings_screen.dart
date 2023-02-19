import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = '/settings';
  const SettingsScreen(
      {super.key, required this.filters, required this.onSetFilter});

  final Map<String, bool> filters;
  final Function onSetFilter;
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _gluten = false;
  bool _vegan = false;
  bool _lactose = false;
  bool _vegetarian = false;

  @override
  void initState() {
    // TODO: implement initState
    _gluten = widget.filters['gluten'] as bool;
    _vegan = widget.filters['vegan'] as bool;
    _lactose = widget.filters['lactose'] as bool;
    _vegetarian = widget.filters['vegetarian'] as bool;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
              onPressed: () {
                final _filters = {
                  'gluten': _gluten,
                  'lactose': _lactose,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.onSetFilter(_filters);
              },
              icon: const Icon(Icons.save))
        ],
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
              currentValue: _gluten,
              updateValue: (value) {
                setState(() {
                  _gluten = value;
                });
              }),
          _buildCustomSwitch(
              title: 'Lactose-Free',
              currentValue: _lactose,
              updateValue: (value) {
                setState(() {
                  _lactose = value;
                });
              }),
          _buildCustomSwitch(
              title: 'Vegan',
              currentValue: _vegan,
              updateValue: (value) {
                setState(() {
                  _vegan = value;
                });
              }),
          _buildCustomSwitch(
              title: 'Vegetarian',
              currentValue: _vegetarian,
              updateValue: (value) {
                setState(() {
                  _vegetarian = value;
                });
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
