import 'package:flutter/material.dart';

abstract class InterfaceSearchBarWidget {
  void clearSearch();
  void filterCharacters(String query);
}

class SearchBarWidget extends StatelessWidget {
  final InterfaceSearchBarWidget source;
  SearchBarWidget({required this.source});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: source.filterCharacters,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            labelText: 'Search Characters',
            prefixIcon: const Icon(Icons.search, color: Colors.white),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear, color: Colors.white),
              onPressed: () {
                source.clearSearch();
              },
            ),
            labelStyle: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
