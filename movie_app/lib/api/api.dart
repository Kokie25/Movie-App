import 'dart:convert';
import 'dart:core';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/constant.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const _trendingurl = 'https://api.themoviedb.org/3/trending/movie/day?api_key = ${Constants.apiKey}';

  Future List<Movie>getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingurl));
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }else{
      throw Exception("Something happened");
    }

  }
}
 