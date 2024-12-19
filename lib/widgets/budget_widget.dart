import 'package:flutter/material.dart';

class BudgetWidget extends StatefulWidget {
  const BudgetWidget(
      {super.key,
      required this.title,
      required this.amount,
      required this.spent,
      required this.color});

  final String title;
  final double amount;
  final double spent;
  final Color color;

  @override
  State<BudgetWidget> createState() => _BudgetWidgetState();
}

class _BudgetWidgetState extends State<BudgetWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: widget.color,
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Text(widget.title,
                    style: const TextStyle(
                        fontSize: 24.0, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Amount: ${widget.amount.toString()}",
                        style: const TextStyle(fontSize: 16.0)),
                    Text("Spent: ${widget.spent.toString()}",
                        style: const TextStyle(fontSize: 16.0))
                  ],
                )
              ],
            )));
  }
}
