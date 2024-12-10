import 'package:flutter/material.dart';
import 'Widgets/AppNavigationBar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.lightBlueAccent, brightness: Brightness.dark)),
      home: const AppNavigationBar(),
    );
  }
}
