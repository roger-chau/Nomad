import 'package:flutter/material.dart';
import 'package:budgeting_app/widgets/budget_widget.dart';
import 'package:budgeting_app/widgets/category_widget.dart';
import 'package:budgeting_app/widgets/app_bar.dart';

class BudgetsView extends StatefulWidget {
  const BudgetsView({super.key});

  @override
  State<BudgetsView> createState() => _BudgetViewState();
}

class _BudgetViewState extends State<BudgetsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(title: "Budgets"),
        body: const SingleChildScrollView(
            child: Column(children: [
          CategoryWidget(
              name: "Transportation",
              available: 50.0,
              assigned: 25.0,
              budgets: <BudgetWidget>[
                BudgetWidget(title: "Gas", available: 25.0, assigned: 12.5),
                BudgetWidget(
                    title: "Public Transit", available: 25.0, assigned: 12.5)
              ])
        ])));
  }
}
