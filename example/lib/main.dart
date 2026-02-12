import 'package:flutter/material.dart';
import 'package:battery_plugin/battery_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _batteryLevel = 'Unknown';

  final _batteryPlugin = BatteryPlugin();

  Future<void> _getBatteryLevel() async {
    final level = await _batteryPlugin.getBatteryLevel();

    setState(() {
      _batteryLevel = level != null ? '$level%' : 'Failed';
    });
  }

  @override
  void initState() {
    super.initState();
    _getBatteryLevel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Battery Plugin Test')),
        body: Center(
          child: Text(
            'Battery Level: $_batteryLevel',
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
