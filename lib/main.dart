import 'package:flutter/material.dart';
import 'package:fomodo/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFE7626C),
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              color: Color(0xFF232B55)
            ),
          ),
          cardColor: const Color(0xFFF4EDDB),
        ),
      home: const HomeScreen(
      ),
    );
  }
}
