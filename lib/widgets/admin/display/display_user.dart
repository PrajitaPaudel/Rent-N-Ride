import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/layout/row_grid_layot.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/small_text.dart';

import '../../../controller/admin/user_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../common widget/appbar/header_curveappbar.dart';

class UserListPage extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            THeaderAppBar(text: 'User List',backgroundColor: TColors.blueGery,),

        
            Obx(() {
              if (userController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              final userList = userController.userList.value;
              if (userList == null || userList.users.isEmpty) {
                return Center(child: Text('No users found.'));
              }

              return TVerticalRowLayout(
                itemCount: userList.users.length,
                itemBuilder: (context, index) {
                  final user = userList.users[index];
                  return Expanded(
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(10),
                        title: SmallText(text: '${user.firstName} ${user.lastName}',size: 15,fontWeight: FontWeight.bold,),
                        subtitle: SmallText(text: 'Email: ${user.emailId}\nContact: ${user.contactNo}\nLicence: ${user.driverLicInfo}',size: 15,fontWeight: FontWeight.w500,),
                        trailing: SmallText(text:user.userType,size: 15,fontWeight: FontWeight.bold,),
                        onTap: () {
                          // Handle tap action
                        },
                      ),
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
