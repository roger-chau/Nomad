import 'package:flutter/foundation.dart';
import 'package:budgeting_app/models/budget_model.dart';

class BudgetViewModel extends ChangeNotifier {
  final List<BudgetModel> _budgetModel = [];

  List<BudgetModel> get allBudgets => _budgetModel;

  void addBudget(BudgetModel budget) {
    _budgetModel.add(budget);
    notifyListeners();
  }

  BudgetModel getBudget(int index) {
    return _budgetModel[index];
  }
}
