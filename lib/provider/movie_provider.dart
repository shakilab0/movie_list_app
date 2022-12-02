import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/movie_response.dart';

class MovieProvider extends ChangeNotifier {
  MovieResponse? movieResponse;

  bool get hasDataLoaded => movieResponse != null;

  Future<void> getData({int page = 1}) async {
    final url = 'https://yts.mx/api/v2/list_movies.json?page=$page';
    try {
      final response = await get(Uri.parse(url));
      final map = json.decode(response.body);
      if(response.statusCode == 200) {
        movieResponse = MovieResponse.fromJson(map);
        notifyListeners();
      } else {
        print(response.statusCode.toString());
      }
    } catch(error) {
      print(error.toString());
    }
  }
}