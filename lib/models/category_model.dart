import 'package:budgeting_app/models/budget_model.dart';

class CategoryModel {
  final String _name;
  final double _liquidBalance;
  final double _assignedBalance;
  final List<BudgetModel> _budgetModel = [];

  CategoryModel(this._name, this._liquidBalance, this._assignedBalance);

  String get name => _name;
  double get assignedBalance => _assignedBalance;
  double get liquidBalance => _liquidBalance;
  List<BudgetModel> get budgets => _budgetModel;
}
