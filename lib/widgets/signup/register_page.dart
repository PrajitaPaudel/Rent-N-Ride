import 'package:flutter/material.dart';
import 'package:vehicle_rental_frontendui/widgets/signup/signup_form.dart';

import '../../utils/constants/text_strings.dart';
import '../common widget/text/big_text.dart';
class Register extends StatelessWidget {
  const Register({super.key});



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(),
      body:SingleChildScrollView(
        physics:BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            children: [
              BigText(text: TTexts.signupTitle,
                fontWeight: FontWeight.w700,
                size: 20,

              ),
              SizedBox(height:30,),
              TSignUpForm(),


            ],
          ),
        ),
      )

    );
  }
}


