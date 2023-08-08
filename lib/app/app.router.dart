// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:characterviewer/models/Character.dart' as _i8;
import 'package:characterviewer/ui/views/character_detail/character_detail_view.dart'
    as _i4;
import 'package:characterviewer/ui/views/character_list_view/character_list_view_view.dart'
    as _i3;
import 'package:characterviewer/ui/views/error/error_view.dart' as _i6;
import 'package:characterviewer/ui/views/home/home_view.dart' as _i5;
import 'package:characterviewer/ui/views/startup/startup_view.dart' as _i2;
import 'package:flutter/material.dart' as _i7;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i9;

class Routes {
  static const startupView = '/startup-view';

  static const characterListViewView = '/character-list-view-view';

  static const characterDetailView = '/character-detail-view';

  static const homeView = '/home-view';

  static const errorView = '/error-view';

  static const all = <String>{
    startupView,
    characterListViewView,
    characterDetailView,
    homeView,
    errorView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startupView,
      page: _i2.StartupView,
    ),
    _i1.RouteDef(
      Routes.characterListViewView,
      page: _i3.CharacterListViewView,
    ),
    _i1.RouteDef(
      Routes.characterDetailView,
      page: _i4.CharacterDetailView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i5.HomeView,
    ),
    _i1.RouteDef(
      Routes.errorView,
      page: _i6.ErrorView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StartupView(),
        settings: data,
      );
    },
    _i3.CharacterListViewView: (data) {
      final args = data.getArgs<CharacterListViewViewArguments>(nullOk: false);
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.CharacterListViewView(
            key: args.key,
            characters: args.characters,
            characterSelectedCallback: args.characterSelectedCallback),
        settings: data,
      );
    },
    _i4.CharacterDetailView: (data) {
      final args = data.getArgs<CharacterDetailViewArguments>(nullOk: false);
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i4.CharacterDetailView(key: args.key, character: args.character),
        settings: data,
      );
    },
    _i5.HomeView: (data) {
      final args = data.getArgs<HomeViewArguments>(nullOk: false);
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i5.HomeView(key: args.key, characters: args.characters),
        settings: data,
      );
    },
    _i6.ErrorView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.ErrorView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class CharacterListViewViewArguments {
  const CharacterListViewViewArguments({
    this.key,
    required this.characters,
    required this.characterSelectedCallback,
  });

  final _i7.Key? key;

  final List<_i8.Character> characters;

  final void Function(_i8.Character) characterSelectedCallback;

  @override
  String toString() {
    return '{"key": "$key", "characters": "$characters", "characterSelectedCallback": "$characterSelectedCallback"}';
  }

  @override
  bool operator ==(covariant CharacterListViewViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.characters == characters &&
        other.characterSelectedCallback == characterSelectedCallback;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        characters.hashCode ^
        characterSelectedCallback.hashCode;
  }
}

class CharacterDetailViewArguments {
  const CharacterDetailViewArguments({
    this.key,
    required this.character,
  });

  final _i7.Key? key;

  final _i8.Character character;

  @override
  String toString() {
    return '{"key": "$key", "character": "$character"}';
  }

  @override
  bool operator ==(covariant CharacterDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.character == character;
  }

  @override
  int get hashCode {
    return key.hashCode ^ character.hashCode;
  }
}

class HomeViewArguments {
  const HomeViewArguments({
    this.key,
    required this.characters,
  });

  final _i7.Key? key;

  final List<_i8.Character> characters;

  @override
  String toString() {
    return '{"key": "$key", "characters": "$characters"}';
  }

  @override
  bool operator ==(covariant HomeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.characters == characters;
  }

  @override
  int get hashCode {
    return key.hashCode ^ characters.hashCode;
  }
}

extension NavigatorStateExtension on _i9.NavigationService {
  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCharacterListViewView({
    _i7.Key? key,
    required List<_i8.Character> characters,
    required void Function(_i8.Character) characterSelectedCallback,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.characterListViewView,
        arguments: CharacterListViewViewArguments(
            key: key,
            characters: characters,
            characterSelectedCallback: characterSelectedCallback),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCharacterDetailView({
    _i7.Key? key,
    required _i8.Character character,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.characterDetailView,
        arguments: CharacterDetailViewArguments(key: key, character: character),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView({
    _i7.Key? key,
    required List<_i8.Character> characters,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key, characters: characters),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToErrorView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.errorView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCharacterListViewView({
    _i7.Key? key,
    required List<_i8.Character> characters,
    required void Function(_i8.Character) characterSelectedCallback,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.characterListViewView,
        arguments: CharacterListViewViewArguments(
            key: key,
            characters: characters,
            characterSelectedCallback: characterSelectedCallback),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCharacterDetailView({
    _i7.Key? key,
    required _i8.Character character,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.characterDetailView,
        arguments: CharacterDetailViewArguments(key: key, character: character),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView({
    _i7.Key? key,
    required List<_i8.Character> characters,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key, characters: characters),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithErrorView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.errorView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
