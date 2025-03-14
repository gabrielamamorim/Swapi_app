import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const SwapiApiApp());
}

class SwapiApiApp extends StatelessWidget {
  const SwapiApiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SWAPI',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}