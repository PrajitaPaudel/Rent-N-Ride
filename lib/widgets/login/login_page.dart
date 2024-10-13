import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:vehicle_rental_frontendui/helper/helper_function.dart';
import 'package:vehicle_rental_frontendui/utils/constants/colors.dart';
import 'package:vehicle_rental_frontendui/utils/constants/text_strings.dart';
import 'package:vehicle_rental_frontendui/widgets/signup/register_page.dart';
import '../../utils/constants/image_strings.dart';
import 'package:iconsax/iconsax.dart';

import '../common widget/button/Custom_button.dart';
import '../common widget/text/big_text.dart';
import '../common widget/text/small_text.dart';
import '../common widget/login_style.dart';
import 'login_from.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});


  @override
  Widget build(BuildContext context) {
    final dark=THelperFunction.isDarkMood(context);
    return  Scaffold(
      body:SingleChildScrollView(
        padding: TStyle.paddingWithAppBarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
                height: 150,
                image: AssetImage(dark?TImages.darkAppLogo:TImages.lightAppLogo)),

             // BigText(TTexts.loginTitle,style: Theme.of(context).textTheme.headlineMedium,),
            BigText(text:TTexts.loginTitle,
            fontWeight: FontWeight.w700,
            size: 25,),
            const SizedBox(height: 8.0),
            SmallText(text: TTexts.loginSubTitle,
            textColor: TColors.darkerGrey,),
            const SizedBox(height: 20.0),
            TLoginFrom(),
          ],
        ),


      ) ,
    );
  }
}

