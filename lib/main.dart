// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'utilities/constants.dart';

void main () {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          appBarTheme: AppBarTheme(
            backgroundColor: kBackgroundColor,
            elevation: 0.0
          )
        ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}