import 'package:flutter/material.dart';
import 'package:budgeting_app/models/accounts.dart';
import 'package:budgeting_app/views/transactions_view.dart';

class AccountsView extends StatefulWidget {
  const AccountsView({super.key});

  @override
  State<AccountsView> createState() => _AccountsViewState();
}

List<Accounts> checking = [Accounts("cash", "Checking", 1203.21)];
List<Accounts> savings = [
  Accounts("yep", "Savings", 1203.21),
  Accounts("money", "Savings", 1203.21)
];
List<Accounts> credit = List.empty(growable: true);
List<Accounts>? displayList = List.empty(growable: true);

class _AccountsViewState extends State<AccountsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Accounts"),
            backgroundColor: Theme.of(context).colorScheme.surfaceContainer),
        body: Center(
            child: Column(children: <Widget>[
          //change the type to string later so that we can just call view model to get the lists to display
          DropdownMenu<List<Accounts>>(
              dropdownMenuEntries: [
                DropdownMenuEntry(value: savings, label: "savings"),
                DropdownMenuEntry(value: checking, label: "checking"),
                DropdownMenuEntry(value: credit, label: "credit")
              ],
              width: 300,
              onSelected: (value) {
                // do a call to view model to recive the most up todate list
                setState(() {
                  displayList = value;
                }); // onselect
              }), //dropdownMenu
          Expanded(
              child: ListView.builder(
                  itemCount: displayList?.length,
                  itemBuilder: (context, index) {
                    return Container(
                        alignment: Alignment.topLeft,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white10,
                            style: BorderStyle.solid,
                            width: 1,
                          ), //border
                          color: Colors.black,
                        ), //decoration
                        child: GestureDetector(
                            child: Text(
                              'Account: ${displayList?[index].getName()}\nBalance: \$${displayList?[index].getAmount()}',
                              style: const TextStyle(fontSize: 22),
                            ), //text
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TransactionView()));
                            } //onTap
                            ) //gesture
                        ); //container
                  } //item builder
                  ) //list builder
              ) // expanded
        ] //column children
                ) //column
            ) //center
        ); //scaffold
  }
}
