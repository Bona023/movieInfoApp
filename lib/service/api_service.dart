import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_info_app/model/movie_detail_model.dart';
import 'package:movie_info_app/model/movie_model.dart';

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";

  static Future<List<MovieModel>> getPopularMovie() async {
    List<MovieModel> movieInstance = [];
    final url = Uri.parse("$baseUrl/popular");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> results = jsonDecode(response.body)['results'];
      for (var result in results) {
        movieInstance.add(MovieModel.fromJson(result));
      }
      return movieInstance;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getNowMove() async {
    List<MovieModel> movieInstance = [];
    final url = Uri.parse("$baseUrl/now-playing");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> results = jsonDecode(response.body)['results'];
      for (var result in results) {
        movieInstance.add(MovieModel.fromJson(result));
      }
      return movieInstance;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getComingMove() async {
    List<MovieModel> movieInstance = [];
    final url = Uri.parse("$baseUrl/coming-soon");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> results = jsonDecode(response.body)['results'];
      for (var result in results) {
        movieInstance.add(MovieModel.fromJson(result));
      }
      return movieInstance;
    }
    throw Error();
  }

  static Future<MovieDetailModel> getMoveDetailById(num id) async {
    final String strId = id.toString();
    final url = Uri.parse("$baseUrl/movie?id=$strId");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final MovieDetailModel movieInfo =
          MovieDetailModel.fromJson(jsonDecode(response.body));
      return movieInfo;
    }
    throw Error();
  }

  static Future<List<String>> getGenresById(num id) async {
    List<String> genreList = [];
    final String strId = id.toString();
    final url = Uri.parse("$baseUrl/movie?id=$strId");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var genres = jsonDecode(response.body)['genres'];
      for (var genre in genres) {
        genreList.add(genre['name']);
      }
      return genreList;
    }
    throw Error();
  }
}
