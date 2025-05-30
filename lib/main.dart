import 'package:flutter/material.dart';
import 'ui/screens/home_screen.dart';

void main() => runApp(const BullsAndCowsApp());

class BullsAndCowsApp extends StatelessWidget {
  const BullsAndCowsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Быки и Коровы',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'PublicPixel',
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}