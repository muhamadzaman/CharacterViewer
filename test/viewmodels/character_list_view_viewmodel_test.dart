import 'package:characterviewer/models/Character.dart';
import 'package:characterviewer/resources/app_config.dart';
import 'package:characterviewer/ui/views/character_list_view/character_list_view_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:characterviewer/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('CharacterListViewViewModel Tests -', () {
    final AppConfig appConfig = AppConfig(
        appName: "Test App",
        appBundleName: "com.test",
        baseUrl: "test",
        flavor: Flavor.simpsonsCharacter,
        child: Container());
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    test('CharacterListViewViewModel initializes correctly', () {
      final characters = [
        Character(title: 'Character 1'),
        Character(title: 'Character 2'),
      ];
      final viewModel = CharacterListViewViewModel(
          appConfig: appConfig, characters: characters);

      expect(viewModel.appTitle, 'Test App');
      expect(viewModel.filteredCharacters, characters);
      expect(viewModel.isSearching, false);
    });

    test('Toggle search updates isSearching', () {
      final viewModel = CharacterListViewViewModel(
          appConfig: appConfig, characters: <Character>[]);

      viewModel.toggleSearch();
      expect(viewModel.isSearching, true);

      viewModel.toggleSearch();
      expect(viewModel.isSearching, false);
    });

    test('Filtering characters works correctly', () {
      final characters = [
        Character(title: 'Character 1'),
        Character(title: 'Character 2'),
        Character(title: 'Another Character'),
      ];
      final viewModel = CharacterListViewViewModel(
          appConfig: appConfig, characters: characters);

      viewModel.filterCharacters('Character');
      expect(viewModel.filteredCharacters.length, 3);

      viewModel.filterCharacters('Another');
      expect(viewModel.filteredCharacters.length, 1);

      viewModel.filterCharacters('Non-existent');
      expect(viewModel.filteredCharacters.length, 0);
    });

    test('Clear search resets filteredCharacters and isSearching', () {
      final characters = [
        Character(title: 'Character 1'),
        Character(title: 'Character 2'),
      ];
      final viewModel = CharacterListViewViewModel(
          appConfig: appConfig, characters: characters);

      viewModel.filterCharacters('Character');
      expect(viewModel.filteredCharacters.length, 2);

      viewModel.clearSearch();
      expect(viewModel.filteredCharacters.length,
          2); // Should reset to original characters
    });

    test('getCharacter returns correct character', () {
      final characters = [
        Character(title: 'Character 1'),
        Character(title: 'Character 2'),
      ];
      final viewModel = CharacterListViewViewModel(
          appConfig: appConfig, characters: characters);

      final character = viewModel.getCharacter(at: 1);
      expect(character.title, 'Character 2');
    });
  });
}
