import 'package:characterviewer/models/Character.dart';
import 'package:characterviewer/resources/app_config.dart';
import 'package:characterviewer/ui/common/widgets/search_bar.dart';
import 'package:stacked/stacked.dart';

class CharacterListViewViewModel extends BaseViewModel
    implements InterfaceSearchBarWidget {
  late final AppConfig _appConfig;
  late List<Character> _characters;
  late List<Character> _filteredCharacters;
  bool _isSearching = false;

  CharacterListViewViewModel({required appConfig, required characters}) {
    _characters = characters;
    _filteredCharacters = _characters;
    _appConfig = appConfig;
  }

  //Getter Setter
  String get appTitle => _appConfig.appName;
  List<Character> get filteredCharacters => _filteredCharacters;
  bool get isSearching => _isSearching;

  //Helper Function
  Character getCharacter({required int at}) => filteredCharacters[at];

  void toggleSearch() {
    _isSearching = !_isSearching;
    rebuildUi();
  }

  @override
  void clearSearch() {
    _filteredCharacters = List.from(_characters);
    _isSearching = false;
    rebuildUi();
  }

  @override
  void filterCharacters(String query) {
    if (query.isEmpty) {
      _filteredCharacters = List.from(_characters);
    } else {
      _filteredCharacters = _characters.where((character) {
        return (character.title?.toLowerCase().contains(query.toLowerCase()) ??
                false) ||
            (character.description
                    ?.toLowerCase()
                    .contains(query.toLowerCase()) ??
                false);
      }).toList();
    }
    rebuildUi();
  }
}
