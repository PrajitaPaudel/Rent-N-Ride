import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vehicle_rental_frontendui/controller/user_controller/auth_controller.dart';
import 'package:vehicle_rental_frontendui/service/auth_service.dart';


import '../../utils/constants/colors.dart';
import '../../utils/constants/text_strings.dart';
import '../common widget/button/Custom_button.dart';

import '../common widget/text/small_text.dart';

import '../signup/register_page.dart';

import 'package:get/get_core/src/get_main.dart';

import 'package:shared_preferences/shared_preferences.dart';


class TLoginFrom extends StatefulWidget {
  const TLoginFrom({super.key});

  @override
  State<TLoginFrom> createState() => _TLoginFromState();
}

class _TLoginFromState extends State<TLoginFrom> {
  var controller = Get.put(AuthController());
  var usernameController = TextEditingController();
  var passwordCController = TextEditingController();
  var _isPasswordVisible = false;
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = true;
    _loadSavedCredentials();
  }

  Future<void> _loadSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      usernameController.text = prefs.getString('username') ?? '';
      passwordCController.text = prefs.getString('password') ?? '';
      rememberMe = prefs.getBool('rememberMe') ?? false;
    });
  }

  Future<void> _saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (rememberMe) {
      await prefs.setString('username', usernameController.text.trim());
      await prefs.setString('password', passwordCController.text.trim());
      await prefs.setBool('rememberMe', true);
    } else {
      await prefs.remove('username');
      await prefs.remove('password');
      await prefs.setBool('rememberMe', false);
    }
  }

  void _login() {
    controller.login(
      username: usernameController.text.trim(),
      password: passwordCController.text.trim(),
    );
    _saveCredentials(); // Save credentials based on "Remember Me"
  }

  @override
  Widget build(BuildContext context) {
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
                  obscureText: _isPasswordVisible,
                  controller: passwordCController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.password_check),
                    labelText: TTexts.password,
                    suffixIcon: IconButton(
                      icon: _isPasswordVisible
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility, color: Colors.blue),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value!;
                        });
                      },
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
                      text: 'Login',
                      onTap: () {
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
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            )
                : Container()),
          ],
        ),
      ),
    );
  }
}
