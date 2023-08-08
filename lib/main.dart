import 'package:flutter/material.dart';
import 'package:characterviewer/app/app.dialogs.dart';
import 'package:characterviewer/app/app.locator.dart';
import 'package:characterviewer/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:characterviewer/main_wireCharacter.dart' as main_wireCharacter;

Future<void> commonMain() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
}

Future<void> main() async {
  await main_wireCharacter.main();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
