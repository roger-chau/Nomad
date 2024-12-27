import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/navigation_bar.dart';
import 'view_models/budget_view_model.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (BuildContext context) => BudgetViewModel(), child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          dividerColor: Colors.transparent,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.lightBlueAccent, brightness: Brightness.dark)),
      home: const AppNavigationBar(),
    );
  }
}
