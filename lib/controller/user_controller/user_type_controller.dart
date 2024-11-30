import 'package:get/get.dart';

class UserTypeController extends GetxController {

  var selectedUserType = ''.obs;

  
  void setUserType(String userType) {
    selectedUserType.value = userType;
  }
}


class AvailableController extends GetxController {
  
  var selectedAvailableType = false.obs;

  
  void setAvailableType(bool available) {
    selectedAvailableType.value = available;
  }
}




class PPopularController extends GetxController {

  var selectedPopularType = false.obs;

 
  void setPopularType(bool popular) {
    selectedPopularType.value = popular;
  }
}


class InsuranceController extends GetxController {

  var selectedInsuranceType = false.obs;


  void setInsuranceType(bool yes) {
    selectedInsuranceType.value = yes;
  }
}

