
import 'package:get/get.dart';
import 'package:vehicle_rental_frontendui/home_page.dart';
import 'package:vehicle_rental_frontendui/navigation_menu.dart';
import 'package:vehicle_rental_frontendui/service/auth_service.dart';
import 'package:vehicle_rental_frontendui/storage/app_storage.dart';
import 'package:vehicle_rental_frontendui/widgets/admin/display/admin_dashboard_page.dart';
import 'package:vehicle_rental_frontendui/widgets/user/user_dasboard.dart';
import 'package:vehicle_rental_frontendui/widgets/common widget/show_custom_snakebar.dart';

import '../../model/login_model.dart';
import '../../model/signup_body_model.dart';
import '../../widgets/dealer/dealer_dashboard_page.dart';
import '../../widgets/login/login_page.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var isLoggedIn = false.obs; // New observable for login status

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus(); // Check login status when the controller initializes
  }

  Future<void> login({String? username, String? password}) async {
    try {
      isLoading.value = true;
      var data = await AuthService().login(username: username, password: password);

      if (data != null) {
        LoginModel loginModel = LoginModel.fromJson(data);

        // Save user data, token, and user ID
        AppStorage.saveIsLoggedin(true);
        AppStorage.saveUser(loginModel.toJson());
        AppStorage.saveUserType(loginModel.userType);
        AppStorage.saveToken(loginModel.token ?? ''); // Save token
        AppStorage.saveUserId(loginModel.userId ?? '');    // Save user ID

        // Verify and print user ID after saving
        String? savedUserId = AppStorage.getUserId();
        print("User ID after saving and retrieving: $savedUserId"); // Debug log

        // Update login status and navigate based on user type
        isLoggedIn.value = true;
        if (loginModel.userType == 'User') {
          Get.offAll(UserDashboardPage());
        } else if (loginModel.userType == 'Dealer') {
          Get.offAll(DealerDashboardPage());

        }else if (loginModel.userType == 'Admin') {
          Get.offAll(AdminDashboardPage());
        }
      } else {
        Get.snackbar("Login Error", "Invalid username or password.");
      }
    } catch (e) {
      Get.snackbar("Login Error", "Something went wrong. Please try again.");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> registration({
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

        // Navigate to LoginPage
        Get.to(LoginPage());
      } else {
        isLoading.value = false;
        Get.snackbar("Registration Failed", "Unable to register. Try again later.");
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", e.toString());
      print(e);
    }
  }

  void checkLoginStatus() {
    // Check login status from AppStorage
    isLoggedIn.value = AppStorage.getIsLoggedin();
  }

  void logout() {
    AppStorage.removeStorage(); // Clear storage on logout
    isLoggedIn.value = false; // Update login status
    Get.offAll(HomePage()); // Redirect to home page
  }
}

