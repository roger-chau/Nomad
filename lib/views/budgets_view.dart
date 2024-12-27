import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:budgeting_app/view_models/budget_view_model.dart';
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
      body: SingleChildScrollView(
        child: Consumer<BudgetViewModel>(
          builder: (context, budget, child) {
            return Column(
              key: ValueKey(budget.allBudgets.length),
              children: [
                CategoryWidget(
                    name: "Transportation",
                    available: 50.0,
                    assigned: 25.0,
                    budgets: [
                      for (var budget in budget.allBudgets)
                        BudgetWidget(
                            title: budget.name,
                            assigned: budget.assignedBalance,
                            available: budget.liquidBalance)
                    ]),
              ],
            );
          },
        ),
      ),
    );
  }
}
