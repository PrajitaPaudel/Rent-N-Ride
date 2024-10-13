import 'package:flutter/material.dart';
import 'package:vehicle_rental_frontendui/utils/constants/colors.dart';

class TCircularContainer extends StatelessWidget {

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color? backgroundColor;
  final String? text;
  final Function()? onTap;
  final Border? border;

   TCircularContainer({
    super.key,
    this.width,
    this.height,
    this.radius=10,
     this.padding=0,
    this.margin,
    this.child,
    this.backgroundColor,
     this.text,  this.onTap,  this.border,


  });



  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(radius),
          border: border,
          color:backgroundColor,
        ),
        child: child ?? (text != null ? Text(text!) : null), // Display text if no child is provided

      ),
    );
  }
}
