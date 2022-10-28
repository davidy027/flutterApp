import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/helpers/debouncer.dart';


import '../models/models.dart';
import '../models/search_movies_response.dart';

class MoviesProvider extends ChangeNotifier {

  final String _apiKey = "3827c6eca3a80513bfd4a9d27c958c6d";
  final String _baseUrl = "api.themoviedb.org";
  final String _language = "es-ES";
  
  final StreamController<List<Movie>> _suggestionStreamController = new StreamController.broadcast();
  Stream<List<Movie>> get suggestionStream => _suggestionStreamController.stream;

  final debouncer  = Debouncer(duration: const Duration(milliseconds: 500),);
  
  int _popularPage = 0;
  List<Movie> onDisplayMovie = []; 
  List<Movie> popularMovie = []; 
  Map<int, List<Cast>> moviesCast = {}; 



  MoviesProvider() {

    this.getOnDisplayMovies();
    this.getPopularMovies();
  }


  Future<String> _getJsonData(String endPoint, [int page = 1]) async{

    final url =
        Uri.https(_baseUrl, endPoint, 
        {"api_key": _apiKey,
        'language': _language,
        'page': '${page}'
        });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    
    final jsonData = await _getJsonData("3/movie/now_playing");
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovie = nowPlayingResponse.results;
    notifyListeners();
    
  }

    getPopularMovies() async {
    _popularPage++;
    
    final jsonData = await _getJsonData("3/movie/popular", _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);
    print(_popularPage);
    
    popularMovie = [...popularMovie, ...popularResponse.results];
    notifyListeners();
    
  }

  Future<List<Cast>> getMovieCast (int movieId) async{

    if(moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    print("pidiendo innfo al servidor-cast");

    final jsonData = await _getJsonData("3/movie/$movieId/credits");
    final creditResponse = CreditResponse.fromJson(jsonData);
    moviesCast [movieId] = creditResponse.cast;

    return creditResponse.cast;

  }

Future<List<Movie>> searchMovies (String query) async {

  final url = Uri.https(_baseUrl, "3/search/movie", 
    {"api_key": _apiKey,
    'language': _language,
    'query': query
    });

    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson( response.body );

    return searchResponse.results;

}

  void getSuggestionsByQuery (String searchTerm){

    debouncer.value = "";
    debouncer.onValue = (value) async {
      //print("Tenemos un valor a buscar: $value");
      final results = await this.searchMovies(value);
      this._suggestionStreamController.add(results);
    };

    final timer = Timer.periodic(Duration(milliseconds: 300),  (_) { debouncer.value = searchTerm;});

    Future.delayed(const Duration(milliseconds: 301)).then(( _ ) => timer.cancel());

  }


}
