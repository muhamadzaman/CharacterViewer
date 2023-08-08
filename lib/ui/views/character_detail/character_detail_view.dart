import 'package:cached_network_image/cached_network_image.dart';
import 'package:characterviewer/models/Character.dart';
import 'package:characterviewer/ui/common/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'character_detail_viewmodel.dart';

class CharacterDetailView extends StackedView<CharacterDetailViewModel> {
  final Character character;
  const CharacterDetailView({Key? key, required this.character})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CharacterDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.title ?? ksNoCharacterTitleString),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Positioned.fill(
                child: SizedBox(
                  height: 400,
                  child: character.imageURl != null
                      ? CachedNetworkImage(
                          imageUrl: character.imageURl!, fit: BoxFit.cover)
                      : const Icon(Icons.broken_image_outlined),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(character.title ?? ksNoCharacterTitleString,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text(character.description ?? ksNoCharacterDesString),
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  CharacterDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CharacterDetailViewModel();
}
