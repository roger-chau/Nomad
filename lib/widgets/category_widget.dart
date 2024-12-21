import 'package:flutter/material.dart';
import 'budget_widget.dart';

class CategoryWidget extends StatefulWidget {
  final String name;
  final double available;
  final double assigned;
  final List<BudgetWidget> budgets;

  const CategoryWidget(
      {super.key,
      required this.name,
      required this.available,
      required this.assigned,
      required this.budgets});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  late List<BudgetWidget> budgets;

  @override
  void initState() {
    super.initState();
    budgets = List<BudgetWidget>.from(widget.budgets);
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        initiallyExpanded: true,
        collapsedBackgroundColor: Colors.black,
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(side: BorderSide.none),
        collapsedShape: RoundedRectangleBorder(side: BorderSide.none),
        title: Text(widget.name),
        subtitle: Text(
            "Available: ${widget.available.toString()} Assigned: ${widget.assigned.toString()}"),
        children: <Widget>[
          Container(
            color: Theme.of(context).colorScheme.surfaceDim, // Or Colors.white
            child: ReorderableListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: budgets.length,
                itemBuilder: (BuildContext context, int index) {
                  return ReorderableDragStartListener(
                      index: index,
                      key: ValueKey(index),
                      child: Container(
                          key: ValueKey(index),
                          color: Theme.of(context).colorScheme.surfaceDim,
                          child: budgets[index]));
                },
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final BudgetWidget item = budgets.removeAt(oldIndex);
                    budgets.insert(newIndex, item);
                  });
                }),
          )
        ]);
  }
}
