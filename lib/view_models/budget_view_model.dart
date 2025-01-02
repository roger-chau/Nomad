import 'package:flutter/foundation.dart';
import 'package:budgeting_app/models/category_model.dart';
import 'package:budgeting_app/models/budget_model.dart';

class BudgetViewModel extends ChangeNotifier {
  final List<CategoryModel> _categoryModels = [];

  List<CategoryModel> get allCategories => _categoryModels;

  void addBudget(String budgetName, String? categoryName) {
    BudgetModel budget = BudgetModel(budgetName, categoryName, 0, 0);
    _categoryModels
        .firstWhere((category) => category.name == categoryName)
        .addBudget(budget);

    notifyListeners();
  }

  void addCategory(String categoryName) {
    CategoryModel category = CategoryModel(categoryName, 0, 0);
    _categoryModels.add(category);

    notifyListeners();
  }
}
