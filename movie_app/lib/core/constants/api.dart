import 'dart:convert';

import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/data/models/movies.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _trendingUrl = 'https://api.themoviedb.org/3/trending/movie/day?api_key=${ApiConstants.apiKey}';
    static const _topRatedUrl = 'https://api.themoviedb.org/3/movie/top_rated?api_key=${ApiConstants.apiKey}';
        static const _upComingUrl = 'https://api.themoviedb.org/3/movie/upcoming?api_key=${ApiConstants.apiKey}';


  Future < List<Movies>> getTrendingMovies () async {
  final response = await  http.get(Uri.parse(_trendingUrl));
  if(response.statusCode == 200) {
  final decodeDate = json.decode(response.body) ['results'] as List;
  return decodeDate.map((movies) => Movies.fromJson(movies)).toList();
  }else {
    throw Exception("something happened");
  }
  }
  Future < List<Movies>> getTopRated () async {
  final response = await  http.get(Uri.parse(_topRatedUrl));
  if(response.statusCode == 200) {
  final decodeDate = json.decode(response.body) ['results'] as List;
  return decodeDate.map((movies) => Movies.fromJson(movies)).toList();
  }else {
    throw Exception("something happened");
  }
  }
   Future < List<Movies>> getUpComing () async {
  final response = await  http.get(Uri.parse(_upComingUrl));
  if(response.statusCode == 200) {
  final decodeDate = json.decode(response.body) ['results'] as List;
  return decodeDate.map((movies) => Movies.fromJson(movies)).toList();
  }else {
    throw Exception("something happened");
  }
  }
}