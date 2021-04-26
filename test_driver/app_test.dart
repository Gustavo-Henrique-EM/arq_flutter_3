import 'package:flutter_driver/flutter_driver.dart' as dr;
import 'package:test/test.dart';

void main() async {
  group('Aplicação', () {

    dr.FlutterDriver? driver;
    final buttonLogin = dr.find.byValueKey('login-text-button');
    final textFieldUsuario = dr.find.byValueKey('user-text-field');
    final textFieldSenha = dr.find.byValueKey('senha-text-field');
    final scackError = dr.find.byValueKey('error-snack');
    final textHome = dr.find.byValueKey('Home');

    setUpAll(() async {
      driver = await dr.FlutterDriver.connect();
    });

    tearDownAll(() async {
        driver!.close();
    });

    test('abra tela login', () async {
      await driver!.tap(buttonLogin);
      await driver!.waitUntilFirstFrameRasterized();
    });

    test('login incorreto login', () async {
      await driver!.tap(buttonLogin);
      expect(await driver!.getText(scackError), "Informe login e a senha");
    });

    test('login correto', () async {
      await driver!.tap(textFieldUsuario);
      await driver!.enterText("gustavo");
      await driver!.tap(textFieldSenha);
      await driver!.enterText("123456");
      await driver!.tap(buttonLogin);
      expect(await driver!.getText(textHome), "Home");
    });
  });
}