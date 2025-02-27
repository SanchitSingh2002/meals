import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({required this.icon, required this.labelText, super.key});

  final IconData icon;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 17, color: Colors.white),
        SizedBox(width: 5,),
        Text(labelText, style: TextStyle(color: Colors.white),)
      ],
    );
  }
}
