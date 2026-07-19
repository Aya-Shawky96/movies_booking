class MoviesModel {
  List<dynamic> movies;

  MoviesModel({
    required this.movies,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> fullData = json["data"].map((item) {
      return {
        "id": item["id"],
        "name": item["name"],
        "poster": item["poster"],
        "showDate": item["showDate"],
        "showTime": item["showTime"],
        "seats": item["seats"],
      };
    }).toList();

    return MoviesModel(
      movies: fullData,
    );
  }
}