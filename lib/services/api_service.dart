import 'dart:convert';

import 'package:characterviewer/models/Character.dart';
import 'package:characterviewer/resources/constants.dart';
import 'package:dio/dio.dart';

class ApiService {
  final _dio = Dio();

  Future<List<Character>> fetchCharacters(
      {required String queryParameter}) async {
    try {
      List<Character> characters = [];

      Map<String, dynamic> queryParams = {
        "q": queryParameter,
        "format": "json"
      };
      final response = await _dio.get(baseUrl, queryParameters: queryParams);
      final data = json.decode(response.data);

      characters =
          List<Character>.from(data['RelatedTopics'].map((characterData) {
        return Character.fromJson(characterData);
      }));

      return characters;
    } catch (error) {
      throw Exception("Error fetching characters: $error");
    }
  }
}
