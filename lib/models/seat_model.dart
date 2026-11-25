class Seat {
  final int seatId;
  final int? bookingId;
  final String seatNumber;
  final String status;
  final String customerName;

  const Seat({
    required this.seatId,
    required this.seatNumber,
    required this.status,
    this.bookingId,
    this.customerName = '',
  });

  factory Seat.fromJson(Map<String, dynamic> json) {
    return Seat(
      seatId: json['seatId'] as int,
      bookingId: json['bookingId'] as int?,
      seatNumber: json['seatNumber'] as String,
      status: json['status'] as String,
      customerName: json['customerName'] as String? ?? '',
    );
  }
}
