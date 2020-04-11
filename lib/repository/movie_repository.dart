import 'package:providermovieapp/POJOs/movie.dart';
import 'package:providermovieapp/POJOs/movie_detail.dart';
import 'package:providermovieapp/api/movie_api.dart';

class MovieRepository {
  Future<List<Movie>> movies() async => await MovieApi().fetchMovies();

  Future<MovieDtail> moviesDetails(String mId) async =>
      await MovieApi().fetchMoviesDetail(mId);
}
