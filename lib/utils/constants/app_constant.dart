class AppConstant{
  static const String APP_NAME="vehicle_rental_frontendui";


  static const String BASE_URL='http://192.168.1.4:5283/';
  static const String REGISTRATION_URL="api/Users/Registration";
  static const String LOGIN_URL="api/Users/login";
   static const String IMAGE_UPLOAD_URL="";
  static const String IMAGE_BASE_URL = 'api/Vehicle/images/';
  static const String Add_Vehicle="api/Vehicle/AddVehicle";
  static const String Get_All_Vehicle="api/Vehicle/GetVehicles";
  static const String Popular_Vehicle="api/Vehicle/GetPopularVehicles";
  static const String Vehicle_Category="api/Vehicle/GetVehiclesByCategory/";
  static const String Latest_VehicleId="api/Vehicle/GetLatestVehicleId";
  static const String Update_vehicle="api/Vehicle/UpdateVehicle/";
  static const String Booking_URL="api/Booking/AddBooking";
  static const String Update_Booking="api/Booking/UpdateBooking/";
  static const String Booking_Total="api/BookingConfirmation/GetTotalAmount/";
  static const String Confirm_Booking="api/BookingConfirmation/ConfirmBooking/";
  static const String Get_All_Booking="api/BookingConfirmation/GetBookingConfirmationDetails/";
  static const String UserName="";
  static const String NUMBER="";
  static const String PASSWORD="";







}


List<String>orderList=[
  "New order",
  "Pending",
  "Delivered",
  "Cancelled"

];