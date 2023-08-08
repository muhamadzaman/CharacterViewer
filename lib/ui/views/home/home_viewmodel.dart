import 'package:characterviewer/app/app.locator.dart';
import 'package:characterviewer/app/app.router.dart';
import 'package:characterviewer/models/Character.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  late List<Character> _characters;
  var _useMobileLayout = true;
  Character? _selectedCharacter;

  HomeViewModel({required appConfig, required characters}) {
    _characters = characters;
    _selectedCharacter = _characters.first;
  }

  //Getter Setter
  List<Character> get characters => _characters;
  bool get useMobileLayout => _useMobileLayout;
  Character? get selectedCharacter => _selectedCharacter;

  set updateScreenLayout(double shortestSide) {
    _useMobileLayout = shortestSide < 600;
  }

  void selectCharacter(Character character) {
    _selectedCharacter = character;
    if (useMobileLayout) {
      _navigationService.navigateToCharacterDetailView(
          character: _selectedCharacter!);
    } else {
      rebuildUi();
    }
  }
}
