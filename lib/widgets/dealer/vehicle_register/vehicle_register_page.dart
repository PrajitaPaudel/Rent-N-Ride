import 'package:flutter/material.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/appbar/header_curveappbar.dart';
import 'package:vehicle_rental_frontendui/widgets/dealer/vehicle_register/vehicle_registration_form.dart';

import '../../../model/dealer/vehicle_registration_model.dart';
import '../../../utils/constants/colors.dart';
import '../../common widget/text/big_text.dart';
import '../../common widget/text/small_text.dart';


class VehicleRegisterPage extends StatelessWidget {
  final VRegistrationBody? vRegistration;
  const VehicleRegisterPage({super.key,  this.vRegistration});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            THeaderAppBar(text: "Register Vehicle"),
            Column(
              children: [
                BigText(
                  text: 'Add Details',
                  size: 21,
                  fontWeight: FontWeight.w800,
                  color: TColors.darkGrey,
                ),
                SizedBox(height: 8),
                SmallText(
                  text: 'You are required to fill information correctly',
                  textColor: TColors.darkGrey,
                ),
                SizedBox(height: 16),
                VRegistrationFrom(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
