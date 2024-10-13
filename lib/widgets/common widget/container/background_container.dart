import 'package:flutter/material.dart';
import 'package:vehicle_rental_frontendui/utils/constants/colors.dart';

class TBackGroundContainer extends StatelessWidget {
  const TBackGroundContainer ({super.key,required this.child,this.color});

   final Color? color;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return  Container(
       width: 428,
       height: 2000,
      decoration: BoxDecoration(
        color:color?? TColors.white,
        borderRadius: BorderRadius.only(
            topLeft:Radius.circular(30),
          topRight: Radius.circular(30),

            )
      ),
      child: child,
    );
  }
}
