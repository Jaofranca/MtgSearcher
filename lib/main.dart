import 'package:MtgSearcher/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          accentColor: ThemeData.dark().scaffoldBackgroundColor,
          primaryColor: ThemeData.dark().scaffoldBackgroundColor),
      home: HomeScreen(),
    );
  }
}
