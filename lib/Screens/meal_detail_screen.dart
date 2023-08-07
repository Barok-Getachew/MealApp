import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routname = 'meal-detail';
  // ignore: prefer_typing_uninitialized_variables
  final tooglefavorite;
  // ignore: prefer_typing_uninitialized_variables
  final isMealfavorite;
  MealDetailScreen(this.tooglefavorite, this.isMealfavorite);

  Widget buildContainor(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        height: 200,
        width: 300,
        child: child);
  }

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectMeal = DUMMY_MEALS.firstWhere((meal) => mealId == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text('${selectMeal.title}'),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients', context),
            buildContainor(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    // ignore: deprecated_member_use
                    color: Theme.of(context).accentColor,
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(selectMeal.ingredients[index])),
                  );
                },
                itemCount: selectMeal.ingredients.length,
              ),
            ),
            buildSectionTitle('steps', context),
            buildContainor(ListView.builder(
                itemBuilder: ((context, index) => Column(
                      children: [
                        ListTile(
                          leading:
                              CircleAvatar(child: Text("#" '${(index + 1)}')),
                          title: Text(
                            selectMeal.steps[index],
                          ),
                        ),
                        Divider(),
                      ],
                    ))))
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => tooglefavorite(mealId),
          //() {
          //   // Navigator.of(context).pop(mealId);
          // },
          child: Icon(
            isMealfavorite(mealId) ? Icons.star : Icons.star_border,
          ),
        ));
  }
}
