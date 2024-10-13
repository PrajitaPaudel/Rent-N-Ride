import 'package:flutter/material.dart';
import 'package:vehicle_rental_frontendui/utils/constants/colors.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/container/circular_container.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/big_text.dart';
class AccountWidget extends StatelessWidget {
  final IconData icon;
  final BigText bigText;
  final double? height;
  final double? width;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final Function()? onTap;




  AccountWidget({Key? key, required this.icon,
    required this.bigText,
    this.height=50,
     this.width=50,
     this.radius=50,
     this.padding=0,
    this.margin,
    this.backgroundColor=TColors.subPrimary,
    this.onTap,

  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.only(
          left: 20,
          top:10,
          bottom: 10,
        ),
        child: Row(
          children: [
            TCircularContainer(
              backgroundColor: backgroundColor,
              height: height,
              width: width,
              radius: radius,
              margin:margin,
              padding: padding,
              child: Icon(
                icon,
                color: Colors.white,
                // size: 20, // Adjust the size as needed
              ),
            ),
            bigText,
          ],
        ),
      ),
    );
  }
}
