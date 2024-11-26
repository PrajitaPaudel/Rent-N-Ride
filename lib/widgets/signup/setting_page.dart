import 'package:flutter/material.dart';
import 'package:vehicle_rental_frontendui/controller/update_user_controller.dart';
import 'package:vehicle_rental_frontendui/model/signup_body_model.dart';

import '../../model/login_model.dart';
import '../../storage/app_storage.dart';
import '../../utils/constants/colors.dart';



class UpdateUserPage extends StatefulWidget {
  final String userId;


  UpdateUserPage({required this.userId, });

  @override
  _UpdateUserPageState createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  late UserUpdateController _userController;
  LoginModel? loginModel;

  @override
  void initState() {
    super.initState();
    var userData = AppStorage.readUser; // This should be a Map
    if (userData != null) {
      loginModel = LoginModel.fromJson(userData); // Convert it back to LoginModel
    }
    // Initialize the UserController with the service
    _userController = UserUpdateController();

    // Example: Populate fields with existing user data
    _userController.populateFields(
      UserUpdateModel(
        userName:loginModel?.userName ?? 'Name',
        firstName: loginModel?.firstName ?? 'Name',
        lastName: loginModel?.lastName ?? 'Name',
        email: loginModel?.email ?? 'Name',
        contactNo: loginModel?.contactNo ?? 'Name',
        address: loginModel?.address ?? 'Name',
        driverLicInfo: loginModel?.driverLicInfo ?? 'Name',
      ),
    );
  }

  @override
  void dispose() {
    _userController.disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Update User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: 20,),
            TextField(
              controller: _userController.userNameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _userController.firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _userController.lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _userController.emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _userController.contactNoController,
              decoration: InputDecoration(labelText: 'Contact No'),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _userController.addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _userController.driverLicInfoController,
              decoration: InputDecoration(labelText: 'Driver License Info'),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _userController.currentPasswordController,
              obscureText: false,
              decoration: InputDecoration(labelText: 'Current Password'),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _userController.newPasswordController,
              obscureText: false,
              decoration: InputDecoration(labelText: 'New Password'),
            ),

            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                bool success =
                await _userController.updateUserDetails(widget.userId);
                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('User updated successfully!')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to update user.')),
                  );
                }
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
