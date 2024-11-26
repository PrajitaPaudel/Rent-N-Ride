

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vehicle_rental_frontendui/model/signup_body_model.dart';
import 'package:vehicle_rental_frontendui/widgets/dealer/dealer_dashboard_page.dart';

import '../../controller/user_controller/auth_controller.dart';
import '../../controller/user_controller/user_type_controller.dart';
import '../../home_page.dart';
import '../../utils/constants/text_strings.dart';
import '../common widget/button/Custom_button.dart';
import 'package:vehicle_rental_frontendui/widgets/common widget/show_custom_snakebar.dart';
import 'package:vehicle_rental_frontendui/widgets/user/user_dasboard.dart';

class TSignUpForm extends StatefulWidget {
  const TSignUpForm({super.key});



  @override
  State<TSignUpForm> createState() => _TSignUpFormState();

}

class _TSignUpFormState extends State<TSignUpForm> {
  var controller = Get.put(AuthController());


  // TextEditingControllers for each field
  var usernameController = TextEditingController();
  var firstnameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var contactController = TextEditingController();
  var addressController = TextEditingController();
  var atlEmailController = TextEditingController();
  var altContactController = TextEditingController();
  var driverLController = TextEditingController();
  var passwordCController = TextEditingController();
  final userTypeController = Get.put(UserTypeController());

  void _registration() {
    String uname = usernameController.text.trim();
    String fName = firstnameController.text.trim();
    String lName = lastNameController.text.trim();
    String email = emailController.text.trim();
    String contact = contactController.text.trim();
    String address = addressController.text.trim();
    String altEmail = atlEmailController.text.trim();
    String altContact = altContactController.text.trim();
    String driverL = driverLController.text.trim();
    String password = passwordCController.text.trim();
    String userType = userTypeController.selectedUserType.value;

    // Validation logic
    if (uname.isEmpty) {
      showCustomSnakeBar('Type your user name', title: "uname");
    } else if (fName.isEmpty) {
      showCustomSnakeBar('Type your first name', title: "fname");
    } else if (lName.isEmpty) {
      showCustomSnakeBar('Type your last name', title: "lname");
    } else if (!GetUtils.isEmail(email)) {
      showCustomSnakeBar('Type a valid email', title: "email");
    } else if (!GetUtils.isPhoneNumber(contact)) {
      showCustomSnakeBar('Type a valid contact number', title: "contact");
    } else if (address.isEmpty) {
      showCustomSnakeBar('Type your address', title: "Address");
    }  else if (driverL.length < 5) {
      showCustomSnakeBar('Type a valid driver’s license', title: "driverL");
    } else if (password.length < 6) {
      showCustomSnakeBar('Password must be at least 6 characters', title: "password");
    } else if (userType.isEmpty) {
      showCustomSnakeBar('Select a user type', title: "userType");
    } else {
      // Proceed to registration if validation is successful
      // SignUpBody signUpBody = SignUpBody(
      //   uname: uname,
      //   fname: fName,
      //   lname: lName,
      //   contact: contact,
      //   email: email,
      //   address: address,
      //   password: password,
      //   driverL: driverL,
      //   userType: userType,
      // );

      controller.registration(
        uname: uname,
        fname: fName,
        lname: lName,
        contact: contact,
        email: email,
        address: address,
        password: password,
        driverL: driverL,
        userType: userType,
      );
    }
  }
  var  _isPasswordVisible = false;

  @override
  void initState(){
    super.initState();
    _isPasswordVisible = true;
  }

  @override
  Widget build(BuildContext context) {

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                      labelText: TTexts.username,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: firstnameController,
                  decoration: const InputDecoration(
                      labelText: TTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          TextFormField(
            controller: lastNameController,
            decoration: const InputDecoration(
                labelText: TTexts.lastName, prefixIcon: Icon(Iconsax.user)),
          ),
          const SizedBox(height: 10.0),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
                labelText: TTexts.email, prefixIcon: Icon(Iconsax.directbox_send)),
          ),
          const SizedBox(height: 10.0),
          TextFormField(
            controller: contactController,
            decoration: const InputDecoration(
                labelText: TTexts.contact, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: 10.0),
          TextFormField(
            controller: addressController,
            decoration: const InputDecoration(
                labelText: TTexts.address, prefixIcon: Icon(Iconsax.location)),
          ),

          const SizedBox(height: 10.0),
          TextFormField(
            controller: driverLController,
            decoration: const InputDecoration(
                labelText: TTexts.driverL, prefixIcon: Icon(Iconsax.card)),
          ),
          const SizedBox(height: 10.0),


    TextFormField(

    obscureText:_isPasswordVisible, // Toggle visibility
    controller: passwordCController,
    decoration: InputDecoration(
    prefixIcon: Icon(Iconsax.password_check),
    labelText: TTexts.password,
    suffixIcon: IconButton(
      icon:_isPasswordVisible ?const  Icon(Icons.visibility_off,):const Icon(Icons.visibility,color: Colors.blue,),
      onPressed: (){
        setState(() {
          _isPasswordVisible = !_isPasswordVisible;
        });
      },
    ),

    ),
    ),

    const SizedBox(height: 15.0),
          Obx(() => SizedBox(
            height: 90,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text('User'),
                        value: 'User',
                        groupValue: userTypeController.selectedUserType.value,
                        onChanged: (value) {
                          userTypeController.setUserType(value!);
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: const Text('Dealer'),
                        value: 'Dealer',
                        groupValue: userTypeController.selectedUserType.value,
                        onChanged: (value) {
                          userTypeController.setUserType(value!);
                        },
                      ),
                    ),

                  ],
                ),
                Expanded(
                  child: RadioListTile(
                    title: const Text('Admin'),
                    value: 'Admin',
                    groupValue: userTypeController.selectedUserType.value,
                    onChanged: (value) {
                      userTypeController.setUserType(value!);
                    },
                  ),
                ),
              ],
            ),
          )),
          const SizedBox(height: 40),
          CustomButton(
            text: "Create Account",
            onTap: () {
              _registration(); // Call the registration function
              print('Create Account button pressed');
            },
          ),
          const SizedBox(height: 5),
          CustomButton(
            text: "Cancel",
            onTap: () => Get.to(() => HomePage()),
          ),
        ],
      ),
    );
  }
}
