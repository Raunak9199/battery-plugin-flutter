// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://flutter.dev/to/integration-testing

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:battery_plugin/battery_plugin.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getPlatformVersion test', (WidgetTester tester) async {
    final battery = BatteryPlugin();
    final level = await battery.getBatteryLevel();
    debugPrint("Battery Level: $level%");

    // The version string depends on the host platform running the test, so
    // just assert that some non-empty string is returned.
    expect(level, isA<int>());
  });
}
