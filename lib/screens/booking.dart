import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import '../providers/booking_provider.dart';

class BookSeatPage extends StatelessWidget {
  final int movieId;
  final int seatId;
  final String poster;
  final String name;
  final String showDate;
  final String showTime;
  final String seatNumber;

  BookSeatPage({
    super.key,
    required this.movieId,
    required this.seatId,
    required this.poster,
    required this.name,
    required this.showDate,
    required this.showTime,
    required this.seatNumber,
  });

  final TextEditingController customerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var bookingProvider = Provider.of<BookingProvider>(context, listen: false);

    var movieProvider = Provider.of<MovieProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Book Seat",
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
                                color: Colors.green,
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

            const SizedBox(height: 40),

            const Text(
              "Enter Your Name",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: customerController,

              decoration: InputDecoration(
                hintText: "Full Name",

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const Spacer(),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    child: const Text("Cancel"),
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      await bookingProvider.createBookingProvider(
                        movieId: movieId,
                        seatId: seatId,
                        customerName: customerController.text,
                      );

                      await movieProvider.getMoviesProvider();

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Booking Created")),
                      );

                      Navigator.pop(context, true);
                    },

                    child: const Text("Confirm"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
