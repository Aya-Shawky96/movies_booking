class Seat {
  final int seatId;
  final int? bookingId;
  final String seatNumber;
  final String status;
  final String? customerName;

  const Seat({
    required this.seatId,
    required this.seatNumber,
    required this.status,
    this.bookingId,
    this.customerName,
  });
}

class MovieModel {
  final int id;
  final String name;
  final String poster;
  final String showDate;
  final String showTime;
  final List<Seat> seats;

  MovieModel({
    required this.id,
    required this.name,
    required this.poster,
    required this.showDate,
    required this.showTime,
    required this.seats,
  });
}

class MoviesModel {
  final List<MovieModel> movies;

  MoviesModel({required this.movies});

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    final tempList = json['data']
        .map<MovieModel>(
          (movie) => MovieModel(
            id: movie['id'],
            name: movie['name'],
            poster: movie['poster'],
            showDate: movie['showDate'],
            showTime: movie['showTime'],
            seats: movie["seats"]
                .map<Seat>(
                  (seat) => Seat(
                    seatId: seat["seatId"],
                    seatNumber: seat["seatNumber"],
                    status: seat["status"],
                    bookingId: seat["bookingId"],
                    customerName: seat["customerName"],
                  ),
                )
                .toList(),
          ),
        )
        .toList();

    return MoviesModel(movies: tempList);
  }
}
