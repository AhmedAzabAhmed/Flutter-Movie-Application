import 'package:providermovieapp/POJOs/movie.dart';
import 'package:providermovieapp/POJOs/movie_detail.dart';
import 'package:providermovieapp/model/network_model.dart';

class MovieApi {
  Future<List<Movie>> fetchMovies() async {
    var jsonResponse = await MyNetworkModel().fetchMyData();
    return List<Movie>.from(
        jsonResponse.map((jsonEntry) => Movie.fromJson(jsonEntry)));
  }

  Future<MovieDtail> fetchMoviesDetail(String mId) async {
    var jsonResponse = await MyNetworkModel().fetchMyDetailData(mId);
    MovieDtail md = new MovieDtail();
    md.posterPath = jsonResponse['poster_path'];
    md.originalTitle = jsonResponse['original_title'];
    md.overview = jsonResponse['overview'];
    md.voteAverage = jsonResponse['vote_average'];
//    return jsonResponse.map((jsonEntry) => MovieDtail.fromJson(jsonEntry));
    return md;
  }
}
