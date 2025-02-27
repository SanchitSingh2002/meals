import 'package:flutter/material.dart';
import 'package:meals/widgets/list_tile_drawer.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({required this.onSelectScreen, super.key});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: Row(
                children: [
                  Icon(
                    Icons.fastfood,
                    size: 48,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Text(
                    "Cooking Up!!",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  )
                ],
              )),
          DrawerListTile(icon: Icons.restaurant, labelText: "Meals", onTap: (){
            onSelectScreen("meals");
          }),
          DrawerListTile(icon: Icons.settings, labelText: "Filters", onTap: (){
            onSelectScreen("filters");
          }),
        ],
      ),
    );
  }
}
