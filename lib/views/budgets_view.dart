import 'package:flutter/material.dart';
import 'package:budgeting_app/widgets/budget_widget.dart';

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
            child: Column(children: <Widget>[
          BudgetWidget(
              title: "Groceries",
              amount: 100.0,
              spent: 50.0,
              color: Colors.green),
          BudgetWidget(
              title: "Entertainment",
              amount: 200.0,
              spent: 150.0,
              color: Colors.blue),
          BudgetWidget(
              title: "Transportation",
              amount: 150.0,
              spent: 100.0,
              color: Colors.red),
          BudgetWidget(
              title: "Rent",
              amount: 1000.0,
              spent: 1000.0,
              color: Colors.purple),
        ])));
  }
}
