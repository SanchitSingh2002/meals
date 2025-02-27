import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_detail.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({required this.onToggleFavourite, this.title, required this.meals, super.key});

  final String? title;
  final List<Meal> meals;
  final Function(Meal meal) onToggleFavourite;

  void selectMeal(BuildContext context, Meal selectedMeal){
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => MealDetail(meal: selectedMeal, onToggleFavourite: onToggleFavourite,  )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Uh oh...nothing here!",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Try selecting a different category!",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = Padding(
        padding: const EdgeInsets.only(top: 15),
        child: ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => MealItem(
            meal: meals[index],
            onSelectMealItem: (meal){
              selectMeal(context, meal);
            },
          ),
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          size: 35, // Change the size as needed
        ),
        title: Text(title!),
      ),
      body: content,
    );
  }
}
