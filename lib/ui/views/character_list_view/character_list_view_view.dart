import 'package:characterviewer/models/Character.dart';
import 'package:characterviewer/resources/app_config.dart';
import 'package:characterviewer/ui/common/app_strings.dart';
import 'package:characterviewer/ui/common/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'character_list_view_viewmodel.dart';

class CharacterListViewView extends StackedView<CharacterListViewViewModel> {
  final List<Character> characters;
  final ValueChanged<Character> characterSelectedCallback;
  const CharacterListViewView(
      {Key? key,
      required this.characters,
      required this.characterSelectedCallback})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CharacterListViewViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: viewModel.isSearching
            ? SearchBarWidget(source: viewModel)
            : Text(viewModel.appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              viewModel.toggleSearch();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: viewModel.filteredCharacters.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemBuilder: (ctx, index) {
                final character = viewModel.getCharacter(at: index);
                return ListTile(
                  title: Text(character.title ?? ksNoCharacterTitleString),
                  subtitle:
                      Text(character.description ?? ksNoCharacterDesString),
                  onTap: () {
                    characterSelectedCallback(character);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  CharacterListViewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CharacterListViewViewModel(
          appConfig: AppConfig.of(context), characters: characters);
}
