class AppConstant{
  static const String APP_NAME="vehicle_rental_frontendui";


  static const String BASE_URL='http://192.168.1.3:5283/';
  static const String REGISTRATION_URL="api/Users/Registration";
  static const String LOGIN_URL="api/Users/login";
   static const String IMAGE_UPLOAD_URL="";
  static const String IMAGE_BASE_URL = 'api/Vehicle/images/';
  static const String Add_Vehicle="api/Vehicle/AddVehicle";
  static const String Get_All_Vehicle="api/Vehicle/GetAvailableVehicles";
  static const String Popular_Vehicle="api/Vehicle/GetPopularVehicles";
  static const String Vehicle_Category="api/Vehicle/GetVehiclesByCategory/";
  static const String Latest_VehicleId="api/Vehicle/GetLatestVehicleId";
  static const String Update_vehicle="api/Vehicle/UpdateVehicle/";
  static const String Booking_URL="api/Booking/AddBooking";
  static const String Update_Booking="api/Booking/UpdateBooking/";
  static const String Booking_Total="api/BookingConfirmation/GetTotalAmount/";
  static const String Confirm_Booking="api/BookingConfirmation/ConfirmBooking/";
  static const String Damage_Url="api/ReturnConfirmation/GetTotalAmount/";
  static const String Damage_Payment="api/ReturnConfirmation/ConfirmReturn/";
  static const String Get_All_Booking="api/BookingConfirmation/GetBookingConfirmationDetails/";
  static const String Return_Booking="api/Return/AddReturn";
  static const String Delete_Booking="api/Booking/DeleteBooking/";
  static const String Delete_Vehicle="api/Vehicle/DeleteVehicle/";

  static const String Get_Categories="api/Category/GetVehicleCategories";
  static const String Add_Categories="api/Category/AddVehicleCategory";
  static const String Get_Categories_By_Id="api/Category/GetVehicleCategory/";
  static const String Update_Categories="api/Category/UpdateVehicleCategory/";
  static const String Delete_Categories="api/Category/DeleteVehicleCategory/";


  static const String Add_Brand="api/VehicleBrand/AddVehicleBrand";
  static const String Get_Vehicle_Brand_By_Id="api/VehicleBrand/GetVehicleBrand/";
  static const String Get_Brand="api/VehicleBrand/GetVehicleBrands";
  static const String Update_Brand="api/VehicleBrand/UpdateVehicleBrand/";
  static const String Delete_Brand="api/VehicleBrand/DeleteVehicleBrand/";

  static const String Get_Model="api/VehicleModel/GetVehicleModels";
  static const String Add_Model="api/VehicleModel/AddVehicleModel";
  static const String Get_Model_By_Id="api/VehicleModel/GetVehicleModel/";
  static const String Update_Model="api/VehicleModel/UpdateVehicleModel/";
  static const String Delete_Model="api/VehicleModel/DeleteVehicleModel/";

  static const String Rental_History="api/RentalHistory/GetAllRentalHistory";
  static const String Rental_History_User="api/RentalHistory/GetRentalHistory";
  static const String User_List_Admin="api/Users/GetAllUsers";
  static const String Booking_List_Admin="api/BookingConfirmation/GetAllBookingDetails";
  static const String Admin_Total="api/RentalHistory/GetAdminEarnings";
  static const String Dealer_Total="api/RentalHistory/GetDealerEarnings";
  static const String Get_All_Vehicle_Admin="";
  static const String Search_Vehicle="api/Vehicle/SearchVehicles?query=";


  static const String Dealer_Vehicle="api/Vehicle/GetUserVehicles";
  static const String Dealer_Vehicle_By_Id="api/Vehicle/GetVehicleById/";
  static const String User_Booking_detailed="api/BookingConfirmation/GetAllBookingConfirmationDetails";
  static const String One_Dealer_Earning="api/RentalHistory/GetOneDealerEarning";

  static const String UserName="";
  static const String NUMBER="";
  static const String PASSWORD="";







}


List<String>orderList=[
  "Home Page",
  "Vehicle",
  "Booked",
   "Delivered"

];