import 'package:flutter/material.dart';
import 'package:flutter_rest_api/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Rest api app",
        theme:ThemeData(primarySwatch: Colors.blueGrey),
        home: HomePage()
    );
  }
}
