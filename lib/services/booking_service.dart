import 'package:dio/dio.dart';

class BookingServices {
  static Dio dio = Dio();

  static const String baseUrl = "https://apimovie.runasp.net/api";

  // Create Booking
  static Future<void> createBooking({
    required int movieId,
    required int seatId,
    required String customerName,
  }) async {
    try {
      await dio.post(
        "$baseUrl/Bookings",
        data: {
          "movieId": movieId,
          "seatId": seatId,
          "customerName": customerName,
        },
      );
    } on DioException catch (dioException) {
      throw Exception("Dio Error: ${dioException.message}");
    } catch (other) {
      throw Exception("Other Error: ${other.toString()}");
    }
  }

  // Update Booking
  static Future<void> updateBooking({
    required int bookingId,
    required String customerName,
  }) async {
    try {
      await dio.put(
        "$baseUrl/Bookings/$bookingId",
        data: {"customerName": customerName},
      );
    } on DioException catch (dioException) {
      throw Exception("Dio Error: ${dioException.message}");
    } catch (other) {
      throw Exception("Other Error: ${other.toString()}");
    }
  }

  // Delete Booking
  static Future<void> deleteBooking(int bookingId) async {
    try {
      await dio.delete("$baseUrl/Bookings/$bookingId");
    } on DioException catch (dioException) {
      throw Exception("Dio Error: ${dioException.message}");
    } catch (other) {
      throw Exception("Other Error: ${other.toString()}");
    }
  }
}
