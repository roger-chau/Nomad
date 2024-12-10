import 'package:flutter/material.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({super.key});

  @override
  State<AppNavigationBar> createState() => _AppState();
}

class _AppState extends State<AppNavigationBar> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                pageIndex = index;
              });
            },
            indicatorColor: Colors.amber,
            selectedIndex: pageIndex,
            destinations: const <Widget>[
          NavigationDestination(
              selectedIcon: Icon(Icons.wallet),
              icon: Icon(Icons.wallet_outlined),
              label: "Budget"),
          NavigationDestination(
              selectedIcon: Icon(Icons.food_bank_outlined),
              icon: Icon(Icons.food_bank),
              label: "Accounts")
        ]));
  }
}
