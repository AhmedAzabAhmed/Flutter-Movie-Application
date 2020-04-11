import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providermovieapp/provider/Movies.dart';
import 'package:providermovieapp/screen/movie_details.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Movie Application"),
          backgroundColor: Colors.amber,
        ),
        body: ChangeNotifierProvider<Movies>(
          create: (context) => Movies(),
          child: MoviePage(),
        ),
      ),
    );
  }
}

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer(
      builder: (BuildContext context, Movies movies, Widget child) => Container(
        color: Colors.black,
        child: ListView.builder(
          itemBuilder: (_, int index) => ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MovieDetails('${movies.movieList[index].id}')));
            },
            leading: Container(
              child: Image.network(
                  'https://image.tmdb.org/t/p/w500/${movies.movieList[index].posterPath}'),
            ),
            title: Text(
              movies.movieList[index].title,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          itemCount: movies.movieList.length,
        ),
      ),
    );
  }
}
