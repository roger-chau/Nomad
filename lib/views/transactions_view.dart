import 'package:flutter/material.dart';
import 'package:budgeting_app/models/transactions.dart';
import 'package:budgeting_app/models/accounts.dart';

class TransactionView extends StatefulWidget {
  const TransactionView({super.key});

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  @override
  Widget build(BuildContext context) {
    Accounts account = Accounts("yep", "Savings", 1203.21);
    List<Transactions> transactions = List.empty(growable: true);
    transactions.add(Transactions(
        DateTime.parse("2024-11-23"), 120.21, "Bills", true, account, "telus"));
    transactions.add(Transactions(DateTime.parse("2024-11-27"), 15.42,
        "Eating out", true, account, "mcdonald"));
    transactions.add(Transactions(
        DateTime.parse("2024-12-23"), 120.21, "Bills", true, account, "telus"));
    transactions.add(Transactions(DateTime.parse("2024-12-24"), 213.97,
        "chrismas", true, account, "bestBuy"));

    return Scaffold(
        appBar: AppBar(
            title: const Text("Transaction"),
            backgroundColor: Theme.of(context).colorScheme.surfaceContainer),
        body: ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return Container(
                  alignment: Alignment.topLeft,
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white10,
                      style: BorderStyle.solid,
                      width: 1,
                    ),
                    color: Colors.black,
                  ),
                  child: Text(
                    "Date: ${transactions[index].getDate().year}-${transactions[index].getDate().month}-${transactions[index].getDate().day}\n"
                    "Amount: \$${transactions[index].getAmount()}\n"
                    "Memo: ${transactions[index].getMemo()}\n"
                    "Payee: ${transactions[index].getPayee()}",
                    style: const TextStyle(fontSize: 20),
                  ));
            }));
  }
}
