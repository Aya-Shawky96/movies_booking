import 'package:flutter/material.dart';
import 'package:movies_booking/providers/booking_provider.dart';
import 'package:movies_booking/providers/movie_provider.dart';
import 'package:movies_booking/providers/registeration_provider.dart';
import 'package:movies_booking/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegistrationProvider()),
        ChangeNotifierProvider(create: (context) => MovieProvider()),
        ChangeNotifierProvider(create: (context) => BookingProvider()),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()),
    );
  }
}
