
class ReturnModel {
  final String? userId;
  final int bookingId;
  final DateTime actualReturnDate;
  final String? damageReported;
  final int rating;
  final String returnLocation;

  ReturnModel({
    this.userId,
    required this.bookingId,
    required this.actualReturnDate,
    this.damageReported,
    required this.rating,
    required this.returnLocation,
  });


  Map<String, dynamic> toJson() {
    final Map<String,dynamic>data=new Map<String,dynamic>();
    data['BookingId']= this.bookingId;
    data['ActualReturnDate']= this.actualReturnDate.toIso8601String();
    data['DamageReported']= this.damageReported;
    data['Rating']=this.rating;
    data['ReturnLocation']= this.returnLocation;
    data['UserId']= this.userId;
    return data;
  }
}
