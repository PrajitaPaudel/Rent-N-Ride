import 'package:flutter/material.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/account_widget.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/container/circular_container.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/big_text.dart';

import '../../controller/user_controller/auth_controller.dart';
import '../../model/login_model.dart';
import '../../storage/app_storage.dart';
import '../../utils/constants/colors.dart';

class Profile extends StatefulWidget {

  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  LoginModel? loginModel;


  @override
  void initState() {
    super.initState();
    // Retrieve user data from AppStorage
    var userData = AppStorage.readUser; // This should be a Map
    if (userData != null) {
      loginModel = LoginModel.fromJson(userData); // Convert it back to LoginModel
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        centerTitle: true,
        title: BigText(text:'Profile',fontWeight: FontWeight.w600,textAlign: TextAlign.center,color: TColors.textWhite,),
        backgroundColor: TColors.subPrimary,
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
            TCircularContainer(
              backgroundColor: TColors.subPrimary,
              height: 150,
              width: 150,
              radius: 100,
              margin: EdgeInsets.only(left: 110, top: 50, right: 110, bottom: 50),
              child: Icon(Icons.person, color: Colors.white, size: 70),
            ),
            AccountWidget(

              margin:EdgeInsets.only(left: 10,right: 20,top: 10,bottom: 10),
              icon: Icons.person,
              bigText: BigText(text: loginModel?.firstName ?? 'Name'),
            ),
            SizedBox(height: 8),
            AccountWidget(
              margin:EdgeInsets.only(left: 10,right: 20,top: 10,bottom: 10),
              icon: Icons.phone,
              backgroundColor: Colors.orange.shade300,
              bigText: BigText(text: loginModel?.contactNo ?? 'No contact'),
            ),
            SizedBox(height: 8),
            AccountWidget(
              margin:EdgeInsets.only(left: 10,right: 20,top: 10,bottom: 10),
              icon: Icons.email,
              backgroundColor: Colors.orange.shade300,
              bigText: BigText(text: loginModel?.emailId ?? 'No email'),
            ),
            SizedBox(height: 8),
            AccountWidget(
              margin:EdgeInsets.only(left: 10,right: 20,top: 10,bottom: 10),
              icon: Icons.card_membership,
              backgroundColor: Colors.orange.shade300,
              bigText: BigText(text: loginModel?.driverLicInfo ?? 'No license info'),
            ),
            SizedBox(height: 8),
            AccountWidget(
              margin:EdgeInsets.only(left: 10,right: 20,top: 10,bottom: 10),
              icon: Icons.location_on,
              backgroundColor: Colors.orange.shade300,
              bigText: BigText(text: loginModel?.address ?? 'No Address'),
            ),
            SizedBox(height: 8),
            AccountWidget(
              margin:EdgeInsets.only(left: 10,right: 20,top: 10,bottom: 10),
              onTap: (){
                AuthController().logout();
              },
              icon: Icons.logout_outlined,
              backgroundColor: Colors.red,
              bigText: BigText(text: 'Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
