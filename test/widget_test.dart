import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:utsav/presentation/app/app_providers.dart';
import 'package:utsav/presentation/app/utsav_app.dart';

void main() {
  testWidgets('App loads smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: AppProviders.providers,
        child: const UtsavApp(),
      ),
    );
    await tester.pump();

    expect(find.text('Home'), findsOneWidget);
  });
}
