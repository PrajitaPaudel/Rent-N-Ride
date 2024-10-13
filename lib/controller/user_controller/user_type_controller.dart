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
  // User type selection
  var selectedAvailableType = ''.obs;

  // Method to update the selected user type
  void setAvailableType(String available) {
    selectedAvailableType.value = available;
  }
}



class PopularController extends GetxController {
  // User type selection
  var selectedPopularType = ''.obs;

  // Method to update the selected user type
  void setPopularType(String popular) {
    selectedPopularType.value = popular;
  }
}
