import 'package:flutter/material.dart';
import '../services/booking_service.dart';

class BookingProvider extends ChangeNotifier {

  Future<void> createBookingProvider({

    required int movieId,
    required int seatId,
    required String customerName,

  }) async {

    var response =
    await BookingServices.createBooking(

      movieId: movieId,
      seatId: seatId,
      customerName: customerName,

    );

    print(response.data);

    notifyListeners();

  }

  Future<void> updateBookingProvider({

    required int bookingId,
    required String customerName,

  }) async {

    var response =
    await BookingServices.updateBooking(

      bookingId: bookingId,
      customerName: customerName,

    );

    print(response.data);

    notifyListeners();

  }

  Future<void> deleteBookingProvider(
      int bookingId) async {

    var response =
    await BookingServices.deleteBooking(
        bookingId);

    print(response.data);

    notifyListeners();

  }

}