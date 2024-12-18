import 'package:flutter/material.dart';
import 'package:budgeting_app/views/budgets_view.dart';
import 'package:budgeting_app/views/accounts_view.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({super.key});

  @override
  State<AppNavigationBar> createState() => _AppState();
}

class _AppState extends State<AppNavigationBar> {
  int pageIndex = 0;

  final List<Widget> _pages = [BudgetsView(), AccountsView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[pageIndex],
        bottomNavigationBar: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                pageIndex = index;
              });
            },
            indicatorColor: Colors.blue,
            selectedIndex: pageIndex,
            destinations: const <Widget>[
              NavigationDestination(
                  selectedIcon: Icon(Icons.wallet),
                  icon: Icon(Icons.wallet_outlined),
                  label: "Budget"),
              NavigationDestination(
                  selectedIcon: Icon(Icons.account_balance_outlined),
                  icon: Icon(Icons.account_balance),
                  label: "Accounts")
            ]));
  }
}
