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
                proxyDecorator:
                    (Widget child, int index, Animation<double> animation) {
                  return AnimatedBuilder(
                    animation: animation,
                    builder: (BuildContext context, Widget? child) {
                      return Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.5),
                              blurRadius: 10,
                              spreadRadius: 2,
                            )
                          ],
                        ),
                        child: child,
                      );
                    },
                    child: child,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return ReorderableDelayedDragStartListener(
                    index: index,
                    key: ValueKey(index),
                    child: Container(
                      key: ValueKey(index),
                      child: budgets[index],
                    ),
                  );
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
