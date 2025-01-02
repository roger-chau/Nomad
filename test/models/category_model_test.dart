import 'package:budgeting_app/models/category_model.dart';
import 'package:budgeting_app/models/budget_model.dart';
import 'package:test/test.dart';

void main() {
  group('Category Model', () {
    test('CategoryModel should add a budget', () {
      CategoryModel category = CategoryModel('Test', 0, 0);

      expect(category.budgets.length, 0);
      category.addBudget(BudgetModel('Test Budget', 'Test', 0, 0));
      expect(category.budgets.length, 1);
    });
  });
}
