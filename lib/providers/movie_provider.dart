import 'package:flutter/material.dart';
import 'package:movies_booking/models/movie_model.dart';
import '../services/movie_services.dart';

class MovieProvider extends ChangeNotifier {
  MoviesModel? movieModel;

  Future<void> getMoviesProvider() async {
    print("Loading Movies");

    movieModel = await MovieServices.getMovies();

    notifyListeners();
  }
}
