import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:budgeting_app/view_models/budget_view_model.dart';

const List<Widget> creationButtons = [
  Text("Category", style: TextStyle(fontWeight: FontWeight.bold)),
  Text("Budget", style: TextStyle(fontWeight: FontWeight.bold)),
];

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({super.key});

  @override
  CreateBottomSheetState createState() => CreateBottomSheetState();
}

class CreateBottomSheetState extends State<BottomSheetWidget> {
  final List<bool> _selectedCreation = [true, false];
  String? selectedCategory;

  final TextEditingController nameController = TextEditingController();

  Widget _buildCategoryView() {
    return Center(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: 280,
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      labelText: "Category Name", border: OutlineInputBorder()),
                ))));
  }

  Widget _buildBudgetView() {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: 280,
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      labelText: "Budget Name", border: OutlineInputBorder()),
                ))),
        SizedBox(
          width: 280,
          child: Consumer<BudgetViewModel>(builder: (context, budget, child) {
            return DropdownButtonFormField<String>(
              value: selectedCategory,
              decoration: const InputDecoration(
                labelText: "Category",
                border: OutlineInputBorder(),
              ),
              items: budget.allCategories
                  .map<DropdownMenuItem<String>>((category) {
                return DropdownMenuItem<String>(
                  value: category.name,
                  child: Text(category.name),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue;
                });
              },
            );
          }),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      color: Theme.of(context).colorScheme.surfaceContainer,
      child: Stack(children: <Widget>[
        Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Center(
                child: ToggleButtons(
              isSelected: _selectedCreation,
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < _selectedCreation.length; i++) {
                    _selectedCreation[i] = i == index;
                  }
                });
              },
              borderRadius: BorderRadius.circular(10),
              selectedColor: Colors.white,
              fillColor: Colors.blue,
              color: Colors.grey,
              constraints: BoxConstraints.expand(width: 150),
              children: creationButtons,
            ))),
        _selectedCreation[0] ? _buildCategoryView() : _buildBudgetView(),
        Positioned(
            bottom: 50,
            right: 25,
            child: Consumer<BudgetViewModel>(builder: (context, budget, child) {
              return FloatingActionButton(
                  onPressed: () {
                    _selectedCreation[0]
                        ? budget.addCategory(nameController.text)
                        : budget.addBudget(
                            nameController.text, selectedCategory ?? "");
                    Navigator.pop(context);
                  },
                  child: const Text("Add"));
            }))
      ]),
    );
  }
}
