

class BookingTotalModel {
  final double rentalCharge;
  final double totalAmountBeforeDiscount;
  final double discountAmount;
  final double totalAmount;
  final List<String> paymentMethods;

  BookingTotalModel({
    required this.rentalCharge,
    required this.totalAmountBeforeDiscount,
    required this.discountAmount,
    required this.totalAmount,
    required this.paymentMethods,
  });

  factory BookingTotalModel.fromJson(Map<String, dynamic> json) {
    return BookingTotalModel(
      rentalCharge: json['rentalCharge'],
      totalAmountBeforeDiscount: json['totalAmountBeforeDiscount'],
      discountAmount: json['discountAmount'],
      totalAmount: json['totalAmount'],
      paymentMethods: List<String>.from(json['paymentMethods']),
    );
  }

}



class BookingConfirmationModel {
  final int bookingId;
  final String paymentMethod;
  final String? email;

  BookingConfirmationModel({
    required this.bookingId,
    required this.paymentMethod,
    this.email,
  });

  // Convert model to JSON
  Map<String, dynamic> toJson() => {
    "BookingId": bookingId,
    "PaymentMethod": paymentMethod,
    "Email": email,
  };
}
