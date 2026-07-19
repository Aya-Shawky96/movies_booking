import 'package:flutter/material.dart';

import '../screens/seats_page.dart';
import 'package:flutter/material.dart';
import '../screens/seats_page.dart';

class MovieItem extends StatelessWidget {
  final int movieId;
  final String name;
  final String poster;
  final String showDate;
  final String showTime;
  final List seats;

  const MovieItem({
    super.key,
    required this.movieId,
    required this.name,
    required this.poster,
    required this.showDate,
    required this.showTime,
    required this.seats,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MovieSeatsPage(
              movieId: movieId,
              name: name,
              poster: poster,
              showDate: showDate,
              showTime: showTime,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Image.network(
                poster,
                width: 100,
                height: 140,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Icon(Icons.event),
                      const SizedBox(width: 5),
                      Text(showDate),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 5),
                      Text(showTime),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}