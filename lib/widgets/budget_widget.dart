import 'package:flutter/material.dart';

class BudgetWidget extends StatefulWidget {
  const BudgetWidget(
      {super.key,
      required this.title,
      required this.available,
      required this.assigned});

  final String title;
  final double available;
  final double assigned;

  @override
  State<BudgetWidget> createState() => _BudgetWidgetState();
}

class _BudgetWidgetState extends State<BudgetWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).colorScheme.surfaceContainer,
        child: Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 16),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: Text(widget.title,
                          style: const TextStyle(fontSize: 16.0),
                          textAlign: TextAlign.center),
                    ),
                    Spacer(),
                    Transform(
                        transform: Matrix4.identity()..scale(0.8),
                        child: Chip(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0)),
                            label: Text(
                              "\$${widget.available.toString()}",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .colorScheme
                                    .surfaceContainer,
                              ),
                            ))),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: SizedBox(
                      width: double.infinity,
                      child: LinearProgressIndicator(
                          color: Colors.green,
                          value: widget.available > 0
                              ? widget.assigned / widget.available
                              : 0)),
                ),
              ],
            )));
  }
}
