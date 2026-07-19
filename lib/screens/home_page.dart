import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import '../widgets/movie_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    var providerObject = Provider.of<MovieProvider>(
      context,
      listen: false,
    );

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Movies",
          style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),

      body: Consumer<MovieProvider>(

        builder: (context, movieProvider, child) {

          final movie = movieProvider.movieModel?.movies;

          if (movie == null) {
            providerObject.getMoviesProvider();
            return const Center(child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(

              itemCount: movie.length,

              itemBuilder: (context, index) {
                return  MovieItem(
                  movieId: movie[index]["id"],
                  name: movie[index]["name"],
                  poster: movie[index]["poster"],
                  showDate: movie[index]["showDate"],
                  showTime: movie[index]["showTime"],
                  seats: movie[index]["seats"],
                );
              },
            );
          }
        },

      ),

    );
  }
}