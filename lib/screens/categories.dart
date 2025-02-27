import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/screens/meals.dart';

import '../models/category.dart';
import '../models/meal.dart';

class CategoriesScreen extends StatelessWidget {

  CategoriesScreen({required this.onToggleFavourite, required this.availableMeals, super.key});

  void Function(Meal meal) onToggleFavourite;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    
    final filteredMeals = availableMeals.where((meal) => meal.categories.contains(category.id)).toList();
    
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: category.title, meals: filteredMeals, onToggleFavourite: onToggleFavourite )));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.only(top: 20, left: 12, right: 12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          // using for loop as below written code alternative
          // availableCategories.map((category) => CategoryGridItem(category: category)).toList();
          for (final category in availableCategories)
            CategoryGridItem(
              category: category, onSelectCategory: (){
              _selectCategory(context, category);
            },
            )
        ],
      ); // Setting my no of columns
  }
}
