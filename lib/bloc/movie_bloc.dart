import 'package:providermovieapp/POJOs/movie_detail.dart';
import 'package:providermovieapp/repository/movie_repository.dart';

class MovieBloc {
  Future<MovieDtail> displayMovies(String mId) async {
    return await MovieRepository().moviesDetails(mId);
  }
}
