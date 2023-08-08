import 'package:characterviewer/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:characterviewer/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:characterviewer/ui/views/character_list_view/character_list_view_view.dart';
import 'package:characterviewer/ui/views/character_detail/character_detail_view.dart';
import 'package:characterviewer/services/api_service.dart';
import 'package:characterviewer/ui/views/home/home_view.dart';
import 'package:characterviewer/ui/views/error/error_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: CharacterListViewView),
    MaterialRoute(page: CharacterDetailView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: ErrorView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
// @stacked-service
  ],
  // bottomsheets: [
  //   StackedBottomsheet(classType: NoticeSheet),
  //   // @stacked-bottom-sheet
  // ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
