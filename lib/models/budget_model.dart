class BudgetModel {
  final String _name;
  final double _liquidBalance;
  final double _assignedBalance;

  BudgetModel(this._name, this._liquidBalance, this._assignedBalance);

  String get name => _name;
  double get assignedBalance => _assignedBalance;
  double get liquidBalance => _liquidBalance;
}
