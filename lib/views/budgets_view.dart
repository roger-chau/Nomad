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
              key: ValueKey(
                  '${budget.allCategories.length}-${budget.allCategories.map((c) => c.budgets.length).join("-")}'),
              children: [
                for (var category in budget.allCategories)
                  CategoryWidget(
                      name: category.name,
                      available: category.liquidBalance,
                      assigned: category.assignedBalance,
                      budgets: [
                        for (var budget in category.budgets)
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
