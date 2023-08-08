import 'package:flutter/material.dart';
import 'package:characterviewer/main.dart';
import 'package:characterviewer/resources/app_config.dart';

Future<void> main() async {
  commonMain();
  var configuredApp = AppConfig(
      appName: "The Wire Character Viewer",
      appBundleName: "com.sample.wireviewer",
      baseUrl: "the wire characters",
      flavor: Flavor.wireCharacter,
      child: const MainApp());

  return runApp(configuredApp);
}
