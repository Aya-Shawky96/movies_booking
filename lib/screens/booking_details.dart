import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/booking_provider.dart';
import '../providers/movie_provider.dart';

class BookingDetailsPage extends StatelessWidget {
  final int bookingId;
  final int movieId;
  final int seatId;
  final String poster;
  final String name;
  final String showDate;
  final String showTime;
  final String seatNumber;

  BookingDetailsPage({
    super.key,
    required this.bookingId,
    required this.movieId,
    required this.seatId,
    required this.poster,
    required this.name,
    required this.showDate,
    required this.showTime,
    required this.seatNumber,
  });

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var providerObject = Provider.of<BookingProvider>(context, listen: false);
    var providerMovieObject = Provider.of<MovieProvider>(
      context,
      listen: false,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Booking Details",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
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

                      const SizedBox(height: 15),

                      Row(
                        children: [
                          const Icon(Icons.calendar_month),
                          const SizedBox(width: 5),
                          Text(showDate),
                        ],
                      ),

                      const SizedBox(height: 10),

                      Row(
                        children: [
                          const Icon(Icons.access_time),
                          const SizedBox(width: 5),
                          Text(showTime),
                        ],
                      ),

                      const SizedBox(height: 15),

                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                          ),

                          children: [
                            const TextSpan(text: "Seat : "),

                            TextSpan(
                              text: seatNumber,
                              style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 35),

            const Text(
              "Booked By",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Consumer<MovieProvider>(
              builder: (context, movieProvider, child) {
                final movie = movieProvider.movieModel!.movies.firstWhere(
                  (movie) => movie.id == movieId,
                );

                final seat = movie.seats.firstWhere(
                  (seat) => seat["seatId"] == seatId,
                );

                controller.text = seat["customerName"] ?? "";

                return TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: "Customer Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.person),
                  ),
                );
              },
            ),
            SizedBox(height: 20),

            const Text(
              "This seat is already booked.",
              style: TextStyle(fontSize: 16),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,

              child: OutlinedButton.icon(
                onPressed: () async {
                  await providerObject.deleteBookingProvider(bookingId);

                  await providerMovieObject.getMoviesProvider();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Booking Cancelled")),
                  );

                  Navigator.pop(context, true);
                },
                icon: const Icon(Icons.delete, color: Colors.red),
                label: const Text(
                  "Cancel Booking",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () async {
                  await providerObject.updateBookingProvider(
                    bookingId: bookingId,
                    customerName: controller.text,
                  );

                  await providerMovieObject.getMoviesProvider();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Customer Name Updated Successfully"),
                    ),
                  );

                  Navigator.pop(context, true);
                },
                icon: const Icon(Icons.edit, color: Colors.white),
                label: const Text(
                  "Update Name",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
