class BudgetModel {
  final String _name;
  final String? _category;
  final double _liquidBalance;
  final double _assignedBalance;

  BudgetModel(
      this._name, this._category, this._liquidBalance, this._assignedBalance);

  String get name => _name;
  String? get category => _category;
  double get assignedBalance => _assignedBalance;
  double get liquidBalance => _liquidBalance;
}
