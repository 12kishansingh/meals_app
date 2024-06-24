import 'package:flutter/material.dart';
import 'package:meals_app/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
        ),
      ),
      body: Image.network(
        meal.imageUrl,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}