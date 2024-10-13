import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vehicle_rental_frontendui/controller/user_controller/auth_controller.dart';
import 'package:vehicle_rental_frontendui/service/auth_service.dart';


import '../../utils/constants/colors.dart';
import '../../utils/constants/text_strings.dart';
import '../common widget/button/Custom_button.dart';
import '../common widget/show_custom_snakebar.dart';
import '../common widget/text/small_text.dart';
import '../dealer/dealer_dashboard_page.dart';
import '../signup/register_page.dart';
import '../user/user_dasboard.dart';
import 'package:get/get_core/src/get_main.dart';

class TLoginFrom extends StatefulWidget {
  const TLoginFrom({super.key});

  @override
  State<TLoginFrom> createState() => _TLoginFromState();
}

class _TLoginFromState extends State<TLoginFrom> {
  var controller = Get.put(AuthController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var usernameController = TextEditingController();
    var passwordCController = TextEditingController();

    void _login() {
      controller.login(
          username: usernameController.text.trim(),
          password: passwordCController.text.trim());

      // var authController=Get.find<AuthController>();
      //
      // String uname =usernameController.text.trim();
      // String password =passwordCController.text.trim();
      //
      //
      // if(uname.isEmpty){
      //   showCustomSnakeBar('Type your user name',title: "uname");
      // }else if (password.length<6){
      //   showCustomSnakeBar('password is less than 6',title: "password");
      //
      // }
      // else{
      //
      //
      //   authController.login(uname,password).then((status){
      //     if(status.isSuccess){
      //       print("Success registration");
      //       String userType = authController.userType;
      //       if (userType == 'User') {
      //         Get.to(() => UserDashboardPage());
      //       } else if (userType == 'Dealer') {
      //         Get.to(() => DealerDashboardPage());
      //       }
      //     }else{
      //       showCustomSnakeBar(status.message);
      //     }
      //
      //   });
      //
      // }
    }

    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 17),
        child: Stack(
          children: [
            Column(
              children: [
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: TTexts.username,
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: passwordCController,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.password_check),
                      labelText: TTexts.password,
                      suffixIcon: Icon(Iconsax.eye_slash)),
                ),
                const SizedBox(height: 5.0),
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    SmallText(
                      text: TTexts.rememberMe,
                      textColor: TColors.darkerGrey,
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomButton(
                      text: 'login',
                      onTap: () {
                        print("Buttom is press");
                        _login();
                      },
                      margin: EdgeInsets.all(40),
                    ),
                    CustomButton(
                      text: 'Create Account',
                      onTap: () => Get.to(() => Register()),
                      margin: EdgeInsets.all(40),
                    ),
                  ],
                )
              ],
            ),
            Obx(() => controller.isLoading.value == true
                ? Center(
                    child: CircularProgressIndicator(color: Colors.red,),
                  )
                : Container())
          ],
        ),
      ),
    );
  }
}
