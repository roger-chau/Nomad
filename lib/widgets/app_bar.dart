import 'package:flutter/material.dart';

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
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        color: Theme.of(context).colorScheme.surfaceContainer,
                        child: Stack(children: <Widget>[
                          const Center(
                              child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Row(children: [
                                    Icon(Icons.add),
                                    Expanded(
                                        child: Padding(
                                            padding: EdgeInsets.only(left: 8),
                                            child: TextField(
                                                decoration: InputDecoration(
                                                    hintText:
                                                        "Enter Budget Name",
                                                    border:
                                                        OutlineInputBorder()))))
                                  ]))),
                          Positioned(
                              bottom: 50,
                              right: 25,
                              child: FloatingActionButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.save)))
                        ]),
                      );
                    });
              })
        ]);
  }
}
