import 'package:flutter/material.dart';

enum Flavor { simpsonsCharacter, wireCharacter }

class AppConfig extends InheritedWidget {
  final String appName;
  final String appBundleName;
  final String baseUrl;
  final Flavor flavor;

  AppConfig({
    required this.appName,
    required this.appBundleName,
    required this.baseUrl,
    required this.flavor,
    required Widget child,
  }) : super(child: child);

  static AppConfig of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppConfig>()!;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
