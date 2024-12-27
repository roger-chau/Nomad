import 'package:flutter/foundation.dart';
import 'package:budgeting_app/models/category_model.dart';
import 'package:budgeting_app/models/budget_model.dart';

class BudgetViewModel extends ChangeNotifier {
  final List<BudgetModel> _budgetModels = [];
  final List<CategoryModel> _categoryModels = [];

  List<CategoryModel> get allCategories => _categoryModels;

  void addBudget(String budgetName) {
    // FIX ME, MOVE TO SERVICE
    BudgetModel budget = BudgetModel(budgetName, 0, 0);
    _budgetModels.add(budget);
    notifyListeners();
  }

  void addCategory(String categoryName) {
    // FIX ME, MOVE TO SERVICE
    CategoryModel category = CategoryModel(categoryName, 0, 0);
    _categoryModels.add(category);
    notifyListeners();
  }

  BudgetModel getBudget(int index) {
    return _budgetModels[index];
  }
}
