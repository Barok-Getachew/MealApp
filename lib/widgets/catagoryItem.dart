import 'dart:ui';

import 'package:flutter/material.dart';
import '../Screens/catagory_meal_screen.dart';
import '../models/Catagory.dart';
import '../dummy_data.dart';

class catagoryItem extends StatelessWidget {
  final Color colors;
  final String title;
  final String id;

  catagoryItem(this.id, this.title, this.colors);

  void selectCatagory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CatagoryMealScreen.routename,
      arguments: {
        'id': id,
        'title': title
      }, //This is a  type of Navigation which is called named Navigation

      // MaterialPageRoute(builder: (_) {
      //   return CatagoryMealScreen(id, title);
      // }),//And this is a also a type of navigation which is work by passing data with constructors
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCatagory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              colors.withOpacity(0.7),
              colors,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
