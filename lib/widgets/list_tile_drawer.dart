import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  DrawerListTile({required this.icon, required this.labelText, required this.onTap, super.key});

  IconData icon;
  String labelText;
  void Function() onTap;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 26, color: Theme.of(context).colorScheme.onBackground,),
      title: Text(
        labelText,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 24),
      ),
      onTap: onTap,
    );
  }
}
