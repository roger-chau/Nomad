import 'package:flutter/material.dart';

class BudgetsView extends StatefulWidget {
  const BudgetsView({super.key});

  @override
  State<BudgetsView> createState() => _BudgetViewState();
}

class _BudgetViewState extends State<BudgetsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Budgets"),
            backgroundColor: Theme.of(context).colorScheme.surfaceContainer),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Budget View"),
            ],
          ),
        ));
  }
}
