import 'package:flutter/material.dart';
import '../models/Meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavoriteScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(child: Text('You have no favorite- start adding some!'));
    } else {
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favouriteMeals[index].id,
              title: favouriteMeals[index].title,
              imageUrl: favouriteMeals[index].imageUrl,
              duration: favouriteMeals[index].duration,
              complexity: favouriteMeals[index].complexity,
              affordability: favouriteMeals[index].affordability,
            );
          },
          itemCount: favouriteMeals.length);
    }
  }
}
