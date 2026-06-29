import 'package:flutter/material.dart';

class PanchangScreen extends StatelessWidget {
  const PanchangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: Text(
          '🕉 Panchang',
          style: textTheme.headlineSmall,
        ),
      ),
    );
  }
}
