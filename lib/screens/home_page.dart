import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import '../widgets/movie_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var providerObject = Provider.of<MovieProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Movies",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF123B63),
        foregroundColor: Colors.white,
      ),

      body: Consumer<MovieProvider>(
        builder: (context, movieProvider, child) {
          final movie = movieProvider.movieModel?.movies;

          if (movie == null) {
            providerObject.getMoviesProvider();
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: movie.length,

              itemBuilder: (context, index) {
                return MovieItem(movie: movie[index]);
              },
            );
          }
        },
      ),
    );
  }
}
