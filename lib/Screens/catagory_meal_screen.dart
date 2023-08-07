import 'package:flutter/material.dart';
import '../models/Meal.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CatagoryMealScreen extends StatefulWidget {
  static const routename = 'Catagory-Meal';
  final List<Meal> availableMeal;
  CatagoryMealScreen(this.availableMeal);

  @override
  State<CatagoryMealScreen> createState() => _CatagoryMealScreenState();
}

class _CatagoryMealScreenState extends State<CatagoryMealScreen> {
  String catagoryTitle = '';
  List<Meal> displayMeals = [];
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      catagoryTitle = routeArgs['title']!;
      displayMeals = widget.availableMeal.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(catagoryTitle)),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayMeals[index].id,
              title: displayMeals[index].title,
              imageUrl: displayMeals[index].imageUrl,
              duration: displayMeals[index].duration,
              complexity: displayMeals[index].complexity,
              affordability: displayMeals[index].affordability,
            );
          },
          itemCount: displayMeals.length),
    );
  }
}
