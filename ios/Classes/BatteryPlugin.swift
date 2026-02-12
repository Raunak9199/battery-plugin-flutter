import Flutter
import UIKit

public class BatteryPlugin: NSObject, FlutterPlugin {

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
        name: "battery_plugin",
        binaryMessenger: registrar.messenger()
    )
    let instance = BatteryPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(
    _ call: FlutterMethodCall,
    result: @escaping FlutterResult
  ) {

    switch call.method {

    case "getBatteryLevel":

        UIDevice.current.isBatteryMonitoringEnabled = true
        let batteryLevel = UIDevice.current.batteryLevel

        if batteryLevel < 0 {
            result(FlutterError(
                code: "UNAVAILABLE",
                message: "Battery level not available",
                details: nil
            ))
        } else {
            result(Int(batteryLevel * 100))
        }

    default:
        result(FlutterMethodNotImplemented)
    }
  }
}
