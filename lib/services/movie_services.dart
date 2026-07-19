import 'package:dio/dio.dart';
import '../models/movie_model.dart';

class MovieServices {

  static Dio dio = Dio();

  static Future<MoviesModel> getMovies() async {

    Response response = await dio.get(
      "https://apimovie.runasp.net/api/Movies",
    );

    print(response.data);

    return MoviesModel.fromJson(response.data);
  }
}