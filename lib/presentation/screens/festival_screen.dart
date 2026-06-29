import 'package:flutter/material.dart';

class FestivalScreen extends StatelessWidget {
  const FestivalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: Text(
          '🎉 Festivals',
          style: textTheme.headlineSmall,
        ),
      ),
    );
  }
}
