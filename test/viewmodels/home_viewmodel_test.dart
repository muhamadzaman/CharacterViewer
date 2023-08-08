import 'package:characterviewer/models/Character.dart';
import 'package:characterviewer/resources/app_config.dart';
import 'package:characterviewer/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:characterviewer/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('HomeViewModel Tests -', () {
    late HomeViewModel viewModel;
    final AppConfig appConfig = AppConfig(
        appName: "Test App",
        appBundleName: "com.test",
        baseUrl: "test",
        flavor: Flavor.simpsonsCharacter,
        child: Container());
    setUp(() {
      registerServices();
      viewModel = HomeViewModel(
          appConfig: appConfig,
          characters: <Character>[Character(title: "Title")]);
    });
    tearDown(() => locator.reset());

    test('initial values are set correctly', () {
      expect(viewModel.useMobileLayout, true);
      expect(viewModel.selectedCharacter!.title, "Title");
    });

    test('updateScreenLayout sets useMobileLayout correctly', () {
      viewModel.updateScreenLayout = 500;
      expect(viewModel.useMobileLayout, true);

      viewModel.updateScreenLayout = 700;
      expect(viewModel.useMobileLayout, false);
    });

    test('selectCharacter sets selectedCharacter correctly', () {
      final testCharacter = Character(title: 'Test Character');

      viewModel.selectCharacter(testCharacter);

      expect(viewModel.selectedCharacter, testCharacter);
    });
  });
}
