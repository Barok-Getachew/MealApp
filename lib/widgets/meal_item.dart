// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../Screens/meal_detail_screen.dart';
import '../models/Meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });
  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailScreen.routname,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        // removeItem(result);
      }
    });
  }

  String get affordabilityTest {
    switch (affordability) {
      case Affordability.affordable:
        return 'Affordable';
        break;
      case Affordability.pricey:
        return 'pricey';
        break;
      case Affordability.luxurious:
        return 'luxurious';
      default:
        return 'unknown';
    }
  }

  String get complexityTest {
    switch (complexity) {
      case Complexity.simple:
        return 'simple';
        break;
      case Complexity.challenging:
        return 'challenging';
        break;
      case Complexity.hard:
        return 'hard';
        break;
      default:
        return 'unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  width: 300,
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 26, color: Colors.white),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.schedule,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text('$duration min')
                  ],
                ),
                Row(children: [
                  Icon(
                    Icons.work,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(complexityTest)
                ]),
                Row(children: [
                  Icon(
                    Icons.attach_money,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(affordabilityTest),
                ]),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
