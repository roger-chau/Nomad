import 'package:flutter/material.dart';
import 'package:budgeting_app/widgets/budget_widget.dart';
import 'package:budgeting_app/widgets/category_widget.dart';

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
        body: const SingleChildScrollView(
            child: Column(children: [
          CategoryWidget(
              name: "Transportation",
              available: 50.0,
              assigned: 25.0,
              budgets: <BudgetWidget>[
                BudgetWidget(title: "Gas", amount: 25.0, spent: 12.5),
                BudgetWidget(title: "Public Transit", amount: 25.0, spent: 12.5)
              ])
        ])));
  }
}
