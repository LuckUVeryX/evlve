import 'package:evlve/app/app.dart';
import 'package:evlve/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('App', () {
    testWidgets('renders MaterialApp', (tester) async {
      SharedPreferences.setMockInitialValues({});
      final pref = await SharedPreferences.getInstance();
      await tester.pumpWidget(
        ProviderScope(
          overrides: [sharedPreferencesProvider.overrideWithValue(pref)],
          child: const App(),
        ),
      );
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
}
