import 'transactions.dart';

class Accounts {
  //account variables
  late String _name;
  late String _type;
  late double _amount;

  late List<Transactions> _transactions = [];

  //constructor
  Accounts(this._name, this._type, this._amount);

  //getters/setters
  String getName() {
    return _name;
  }

  String getType() {
    return _type;
  }

  double getAmount() {
    return _amount;
  }

  List<Transactions> getTransactions() {
    return _transactions;
  }

  void setName(String Newname) {
    _name = Newname;
  }
}
