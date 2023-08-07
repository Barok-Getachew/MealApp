import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routename = 'filters';
  final Function saveFilters;

  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  @override
  void initState() {
    // TODO: implement initState
    _glutenFree = widget.currentFilters['glutten']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    super.initState();
  }

  Widget Switchbuilder(String title, String description, bool currentValue,
      void Function(bool) updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    '_gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian
                  };
                  widget.saveFilters(selectedFilters);
                },
                icon: Icon(Icons.save))
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust Your Meal Selection.',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                Switchbuilder("GluttenFree", 'Only Glutten Fre', _glutenFree,
                    (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                Switchbuilder("LactoseFree", 'Only Lactose Free', _lactoseFree,
                    (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                Switchbuilder("Vegan", 'Only for Vegans..', _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                Switchbuilder("Vegetarian", 'For Vegetarians ..', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                })
              ],
            ))
          ],
        ));
  }
}
