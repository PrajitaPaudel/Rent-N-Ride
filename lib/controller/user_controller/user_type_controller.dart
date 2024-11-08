import 'package:get/get.dart';

class UserTypeController extends GetxController {
  // User type selection
  var selectedUserType = ''.obs;

  // Method to update the selected user type
  void setUserType(String userType) {
    selectedUserType.value = userType;
  }
}


class AvailableController extends GetxController {
  // Available type selection, now using bool
  var selectedAvailableType = false.obs;

  // Method to update the selected available type
  void setAvailableType(bool available) {
    selectedAvailableType.value = available;
  }
}




class PPopularController extends GetxController {
  // Popular type selection, now using bool
  var selectedPopularType = false.obs;

  // Method to update the selected popular type
  void setPopularType(bool popular) {
    selectedPopularType.value = popular;
  }
}


class InsuranceController extends GetxController {
  // Available type selection, now using bool
  var selectedInsuranceType = false.obs;

  // Method to update the selected available type
  void setInsuranceType(bool yes) {
    selectedInsuranceType.value = yes;
  }
}

