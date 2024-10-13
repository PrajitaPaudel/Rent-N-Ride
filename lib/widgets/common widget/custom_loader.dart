

import 'package:vehicle_rental_frontendui/utils/constants/colors.dart';
import 'package:flutter/material.dart';



class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    print("I am printing loading state");
    return Container(
      height:100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color:TColors.primary,
      ),
      alignment: Alignment.center,
      child: CircularProgressIndicator(color: TColors.white,),
    );
  }
}
