import 'package:flutter/material.dart';
import 'package:budgeting_app/widgets/bottom_sheet.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        actions: [
          IconButton(
              icon: const Icon(Icons.plus_one),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    useRootNavigator: true,
                    builder: (BuildContext context) {
                      return BottomSheetWidget();
                    });
              })
        ]);
  }
}
