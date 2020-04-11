import 'package:flutter/foundation.dart';
import 'package:providermovieapp/POJOs/movie.dart';
import 'package:providermovieapp/repository/movie_repository.dart';

class Movies extends ChangeNotifier {
  List<Movie> movieList = <Movie>[];

  Movies() {
    fetchMovies();
  }

  void fetchMovies() async {
    movieList = await MovieRepository().movies();
    notifyListeners();
  }
}
