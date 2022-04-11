
import 'dart:async';

import 'package:flutter/services.dart';

class PlatformViewSample {
  static const MethodChannel _channel = MethodChannel('platform_view_sample');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
