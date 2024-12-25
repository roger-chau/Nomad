import 'package:flutter/material.dart';
import 'package:budgeting_app/models/accounts.dart';
import 'package:budgeting_app/views/transactions_view.dart';

class AccountsView extends StatefulWidget {
  const AccountsView({super.key});

  @override
  State<AccountsView> createState() => _AccountsViewState();
}

class _AccountsViewState extends State<AccountsView> {
  @override
  Widget build(BuildContext context) {
    List<Accounts> accounts = List.empty(growable: true);
    accounts.add(Accounts("yep", "Savings", 1203.21));
    accounts.add(Accounts("cash", "Checking", 1203.21));
    accounts.add(Accounts("money", "Savings", 1203.21));
    return Scaffold(
        appBar: AppBar(
            title: const Text("Accounts"),
            backgroundColor: Theme.of(context).colorScheme.surfaceContainer),
        body: ListView.builder(
            itemCount: accounts.length,
            itemBuilder: (context, index) {
              return Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 0),
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blueAccent,
                      style: BorderStyle.solid,
                      width: 1,
                    ),
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: GestureDetector(
                      child: Text(
                        'Account: ${accounts[index].getName()}\nBalance: \$${accounts[index].getAmount()}',
                        style: const TextStyle(fontSize: 22),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TransactionView()));
                      }));
            }
            //child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //children: <Widget>[
            //Text("Accounts View"),
            //],
            //),
            ));
  }
}
