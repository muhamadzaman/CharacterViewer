import 'package:characterviewer/models/Character.dart';
import 'package:characterviewer/resources/app_config.dart';
import 'package:characterviewer/ui/views/character_detail/character_detail_view.dart';
import 'package:characterviewer/ui/views/character_list_view/character_list_view_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  final List<Character> characters;
  const HomeView({Key? key, required this.characters}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    viewModel.updateScreenLayout = MediaQuery.of(context).size.shortestSide;
    if (viewModel.useMobileLayout) {
      return _buildMobileLayout(viewModel);
    }
    return _buildTabletLayout(viewModel);
  }

  Widget _buildMobileLayout(HomeViewModel viewModel) => CharacterListViewView(
      characters: viewModel.characters,
      characterSelectedCallback: viewModel.selectCharacter);

  Widget _buildTabletLayout(HomeViewModel viewModel) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Material(
            elevation: 4.0,
            child: CharacterListViewView(
                characters: viewModel.characters,
                characterSelectedCallback: viewModel.selectCharacter),
          ),
        ),
        Flexible(
          flex: 3,
          child: viewModel.selectedCharacter == null
              ? Container()
              : CharacterDetailView(character: viewModel.selectedCharacter!),
        ),
      ],
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel(appConfig: AppConfig.of(context), characters: characters);
}
