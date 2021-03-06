import 'dart:async';

import 'package:flutter/services.dart';

class AppCalculadoraImc {

  static const MethodChannel _channel =
      const MethodChannel('app_calculadora_imc');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
