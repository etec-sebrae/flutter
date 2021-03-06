import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_calculadora_imc/app_calculadora_imc.dart';

void main() {
  const MethodChannel channel = MethodChannel('app_calculadora_imc');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await AppCalculadoraImc.platformVersion, '42');
  });
}
