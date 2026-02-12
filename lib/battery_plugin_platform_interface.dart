import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'battery_plugin_method_channel.dart';

abstract class BatteryPluginPlatform extends PlatformInterface {
  BatteryPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static BatteryPluginPlatform _instance = MethodChannelBatteryPlugin();

  static BatteryPluginPlatform get instance => _instance;

  static set instance(BatteryPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<int?> getBatteryLevel();
}
