import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/film_model.dart';

class ApiService {
  static const String baseUrl = 'https://imdb.iamidiotareyoutoo.com';

  static Future<List<Film>> searchMovies(String query) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/search?q=$query'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['description'] != null && data['description'] is List) {
          return (data['description'] as List)
              .map((json) => Film.fromJson(json))
              .toList();
        }
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}