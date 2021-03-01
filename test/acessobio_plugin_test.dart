import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:acessobio_plugin/acessobio_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('acessobio_plugin');

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
    expect(await AcessobioPlugin.platformVersion, '42');
  });
}
