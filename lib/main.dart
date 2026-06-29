import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/app/app_providers.dart';
import 'presentation/app/utsav_app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: AppProviders.providers,
      child: const UtsavApp(),
    ),
  );
}
