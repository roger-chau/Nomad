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
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        initiallyExpanded: true,
        title: Text(widget.name),
        subtitle: Text(
            "Available: ${widget.available.toString()} Assigned: ${widget.assigned.toString()}"),
        children: <Widget>[for (var budget in widget.budgets) budget]);
  }
}
