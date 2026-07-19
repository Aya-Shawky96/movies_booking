import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import 'booking.dart';
import 'booking_details.dart';

class MovieSeatsPage extends StatelessWidget {
  final int movieId;
  final String name;
  final String poster;
  final String showDate;
  final String showTime;


  const MovieSeatsPage({
    super.key,
    required this.movieId,
    required this.name,
    required this.poster,
    required this.showDate,
    required this.showTime,
  });

  @override
  Widget build(BuildContext context) {
    var providerObject = Provider.of<MovieProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
            children: [

              /// Movie Information
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          poster,
                          width: 120,
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month,
                                  color: Colors.pinkAccent,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  showDate,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                const Icon(
                                  Icons.access_time,
                                  color: Colors.pinkAccent,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  showTime,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "Select Your Seat",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Consumer<MovieProvider>(
                builder: (context, movieProvider, child) {
                  final movies = movieProvider.movieModel?.movies;

                  if (movies == null) {
                    providerObject.getMoviesProvider();

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final movie = movies.firstWhere(
                        (element) => element["id"] == movieId,
                  );

                  final seats = movie["seats"];

                  return Expanded(
                    child: GridView.builder(
                      itemCount: seats.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        final seat = seats[index];

                        return GestureDetector(
                          onTap: () {
                            if (seat["status"] == "Available") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BookSeatPage(
                                    movieId: movieId,
                                    seatId: seat["seatId"],
                                    seatNumber: seat["seatNumber"],
                                    poster: poster,
                                    name: name,
                                    showDate: showDate,
                                    showTime: showTime,
                                  ),
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BookingDetailsPage(
                                    bookingId: seat["bookingId"],
                                    movieId: movieId,
                                    seatId: seat["seatId"],
                                    seatNumber: seat["seatNumber"],
                                    poster: poster,
                                    name: name,
                                    showDate: showDate,
                                    showTime: showTime,
                                  ),
                                ),
                              );
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: seat["status"] == "Available"
                                  ? Colors.amberAccent
                                  : Colors.red,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                seat["seatNumber"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ]
        ),

      ),
    );
  }
}