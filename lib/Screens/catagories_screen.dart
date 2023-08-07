import 'package:flutter/material.dart';
import '../widgets/catagoryItem.dart';
import '../dummy_data.dart';

class CatagoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
          padding: const EdgeInsets.all(25),
          // ignore: sort_child_properties_last
          children: DUMMY_CATEGORIES.map((CataData) {
            return catagoryItem(CataData.id, CataData.title, CataData.color);
          }).toList(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          )),
    );
  }
}
