import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:budgeting_app/view_models/budget_view_model.dart';

const List<Widget> creationButtons = [
  Text("Budget"),
  Text("Category"),
];

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({super.key});

  @override
  CreateBottomSheetState createState() => CreateBottomSheetState();
}

class CreateBottomSheetState extends State<BottomSheetWidget> {
  final List<bool> _selectedCreation = [true, false];
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      color: Theme.of(context).colorScheme.surfaceContainer,
      child: Stack(children: <Widget>[
        Positioned(
            top: 10,
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
              selectedColor: Colors.white,
              fillColor: Colors.blue,
              color: Colors.grey,
              children: creationButtons,
            ))),
        Center(
            child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(children: [
                  Icon(Icons.add),
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: TextField(
                              controller: controller,
                              decoration: InputDecoration(
                                  hintText: "Enter Budget Name",
                                  border: OutlineInputBorder()))))
                ]))),
        Positioned(
            bottom: 50,
            right: 25,
            child: Consumer<BudgetViewModel>(builder: (context, budget, child) {
              return FloatingActionButton(
                  onPressed: () {
                    budget.addCategory(controller.text);
                    Navigator.pop(context);
                  },
                  child: const Text("Add Budget"));
            }))
      ]),
    );
  }
}
