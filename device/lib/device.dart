import 'dart:async';

import 'package:flutter/services.dart';

class Device {
  static const MethodChannel _channel =
      const MethodChannel('device');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> get electricity async {
    final String electricity = await _channel.invokeMethod('getElectricity');
    return electricity;
  }
}
