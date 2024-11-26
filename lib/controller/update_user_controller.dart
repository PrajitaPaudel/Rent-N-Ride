import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/signup_body_model.dart';
import '../service/auth_service.dart';


class UserUpdateController {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactNoController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController driverLicInfoController = TextEditingController();
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  final AuthService _userService=Get.put(AuthService());



  void populateFields(UserUpdateModel userDetails) {
    userNameController.text = userDetails.userName ?? '';
    firstNameController.text = userDetails.firstName ?? '';
    lastNameController.text = userDetails.lastName ?? '';
    emailController.text = userDetails.email ?? '';
    contactNoController.text = userDetails.contactNo ?? '';
    addressController.text = userDetails.address ?? '';
    driverLicInfoController.text = userDetails.driverLicInfo ?? '';
    currentPasswordController.text = '';
    newPasswordController.text = '';
  }

  Future<bool> updateUserDetails(String userId) async {
    UserUpdateModel userDetails = UserUpdateModel(
      userName: userNameController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      contactNo: contactNoController.text,
      address: addressController.text,
      driverLicInfo: driverLicInfoController.text,
      currentPassword: currentPasswordController.text,
      newPassword: newPasswordController.text,
    );

    return await _userService.updateUserDetails(userId, userDetails);
  }

  void disposeControllers() {
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    contactNoController.dispose();
    addressController.dispose();
    driverLicInfoController.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
  }
}
