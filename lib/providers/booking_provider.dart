import 'package:flutter/material.dart';
import '../services/booking_service.dart';

class BookingProvider extends ChangeNotifier {
  Future<void> createBookingProvider({
    required int movieId,
    required int seatId,
    required String customerName,
  }) async {
    await BookingServices.createBooking(
      movieId: movieId,
      seatId: seatId,
      customerName: customerName,
    );

    notifyListeners();
  }

  Future<void> updateBookingProvider({
    required int bookingId,
    required String customerName,
  }) async {
    await BookingServices.updateBooking(
      bookingId: bookingId,
      customerName: customerName,
    );

    notifyListeners();
  }

  Future<void> deleteBookingProvider(int bookingId) async {
    await BookingServices.deleteBooking(bookingId);

    notifyListeners();
  }
}
