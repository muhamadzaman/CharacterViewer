import 'package:flutter/material.dart';
import 'package:characterviewer/main.dart';
import 'package:characterviewer/resources/app_config.dart';

Future<void> main() async {
  commonMain();
  var configuredApp = AppConfig(
      appName: "Simpsons Character Viewer",
      appBundleName: "com.sample.simpsonsviewer",
      baseUrl: "simpsons characters",
      flavor: Flavor.simpsonsCharacter,
      child: const MainApp());

  return runApp(configuredApp);
}
