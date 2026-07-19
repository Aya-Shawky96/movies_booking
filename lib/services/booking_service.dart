import 'package:dio/dio.dart';

class BookingServices {

  static Dio dio = Dio();

  static const String baseUrl =
      "https://apimovie.runasp.net/api";

  // Create Booking
  static Future<Response> createBooking({
    required int movieId,
    required int seatId,
    required String customerName,
  }) async {

    return await dio.post(
      "$baseUrl/Bookings",
      data: {
        "movieId": movieId,
        "seatId": seatId,
        "customerName": customerName,
      },
    );
  }

  // Update Booking
  static Future<Response> updateBooking({
    required int bookingId,
    required String customerName,
  }) async {

    return await dio.put(
      "$baseUrl/Bookings/$bookingId",
      data: {
        "customerName": customerName,
      },
    );
  }

  // Delete Booking
  static Future<Response> deleteBooking(
      int bookingId,
      ) async {

    return await dio.delete(
      "$baseUrl/Bookings/$bookingId",
    );
  }

}