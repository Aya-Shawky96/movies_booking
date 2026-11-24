import 'package:dio/dio.dart';
import 'package:movies_booking/models/movie_model.dart';

class MovieServices {
  static Dio dio = Dio();

  static Future<MoviesModel> getMovies() async {
    try {
      final Response response = await dio.get(
        "https://apimovie.runasp.net/api/Movies",
      );

      return MoviesModel.fromJson(
        Map<String, dynamic>.from(response.data as Map),
      );
    } on DioException catch (dioError) {
      throw Exception("Dio Error: ${dioError.message}");
    } catch (error) {
      throw Exception("Other error: ${error.toString()}");
    }
  }
}
