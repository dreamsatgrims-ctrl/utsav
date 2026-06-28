import 'package:flutter/material.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  runApp(const UtsavApp());
}

class UtsavApp extends StatelessWidget {
  const UtsavApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Utsav',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepOrange,
      ),
      home: const HomeScreen(),
    );
  }
}