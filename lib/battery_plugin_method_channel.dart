import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'battery_plugin_platform_interface.dart';

/// An implementation of [BatteryPluginPlatform] that uses method channels.
class MethodChannelBatteryPlugin extends BatteryPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('battery_plugin');

  @override
  Future<int?> getBatteryLevel() async {
    final level = await methodChannel.invokeMethod<int>('getBatteryLevel');
    return level;
  }
}
