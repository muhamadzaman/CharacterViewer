import 'package:characterviewer/resources/app_config.dart';
import 'package:characterviewer/services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:characterviewer/app/app.locator.dart';
import 'package:characterviewer/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _apiService = locator<ApiService>();
  late final AppConfig _appConfig;

  StartupViewModel({required AppConfig appConfig}) {
    this._appConfig = appConfig;
  }

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    _fetchCharacters();
  }

  Future<void> _fetchCharacters() async {
    try {
      final characters =
          await _apiService.fetchCharacters(queryParameter: _appConfig.baseUrl);
      if (characters.isNotEmpty) {
        _navigationService.replaceWithHomeView(characters: characters);
      } else {
        throw Exception("Something when worng");
      }
    } catch (error) {
      _navigationService.replaceWithErrorView();
    }
  }
}
