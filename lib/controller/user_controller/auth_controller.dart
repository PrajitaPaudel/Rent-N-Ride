
import 'package:get/get.dart';
import 'package:vehicle_rental_frontendui/home_page.dart';
import 'package:vehicle_rental_frontendui/service/auth_service.dart';
import 'package:vehicle_rental_frontendui/storage/app_storage.dart';
import 'package:vehicle_rental_frontendui/widgets/user/user_dasboard.dart';
import 'package:vehicle_rental_frontendui/widgets/common widget/show_custom_snakebar.dart';

import '../../model/login_model.dart';
import '../../model/signup_body_model.dart';
import '../../widgets/dealer/dealer_dashboard_page.dart';
import '../../widgets/login/login_page.dart';

class AuthController extends GetxController {

  var isLoading = false.obs;



  Future<void> login({String? username, String? password}) async {
    try {
      isLoading.value = true;
      var data = await AuthService().login(username: username, password: password);
      if (data != null) {
        isLoading.value = false;

        LoginModel loginModel = LoginModel.fromJson(data);

        // Save user data
        AppStorage.saveIsLoggedin(true);
        AppStorage.saveUser(loginModel.toJson());
        AppStorage.saveUserType(loginModel.userType);


        // Navigate based on userType
        if (loginModel.userType == 'User') {
          Get.to(UserDashboardPage());
        } else if (loginModel.userType == 'Dealer') {
          Get.to(DealerDashboardPage());
        }


        // UserModel model = UserModel.fromJson(data);
      }
    } on Exception catch (e) {
      isLoading.value = false;
      Get.snackbar("Login Error", e.toString());
      print(e.toString());
    }
  }
  //................................
  void logout() {
    AppStorage.removeStorage();
    Get.offAll(HomePage()); // Redirect to login page
  }


  Future<void>registration({
    required String uname,
    required String fname,
    required String lname,
    required String contact,
    required String email,
    required String address,
    required String password,
    required String driverL,
    required String userType,
  }) async {
    try {
      isLoading.value = true;

      // Create the SignUpBody with all required fields
      SignUpBody signUpBody = SignUpBody(
        uname: uname,
        fname: fname,
        lname: lname,
        contact: contact,
        email: email,
        address: address,
        password: password,
        driverL: driverL,
        userType: userType,
      );

      // Call the registration service
      var data = await AuthService().register(body: signUpBody);

      if (data != null) {

        isLoading.value = false;

        // Save user details (optional)
         AppStorage.saveIsLoggedin(true);
        // AppStorage.saveUserType(data["userType"]);

        // Navigate based on userType
        if (userType == 'User') {
          Get.to(UserDashboardPage());
        } else if (userType == 'Dealer') {
          Get.to(DealerDashboardPage());
        }
      } else {
        isLoading.value = false;
        // Handle registration failure
        Get.snackbar(
            "Registration Failed", "Unable to register. Try again later.");
      }
    } catch (e) {
      isLoading.value = false;
      // Handle the error (network issue, backend issue, etc.)
      Get.snackbar("Error", e.toString());
      print(e);
    }
  }




}
