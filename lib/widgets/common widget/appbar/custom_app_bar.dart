import 'package:flutter/material.dart';
import 'package:vehicle_rental_frontendui/utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';



class TAppBar extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String titleText;
  final String subtitleText;
  final double logoRadius;
  final String titleFontFamily;
  final double titleFontSize;
  final FontWeight titleFontWeight;
  final double size;
  final double height;
  final FontWeight? fontWeight;
  final Color subtextColor;
  final Widget? customIcon; // Custom icon parameter

  const TAppBar({
    Key? key,
    required this.backgroundColor,
    this.textColor = Colors.teal,
    this.titleText = "RentN'Ride",
    this.subtitleText = "Unlock your freedom",
    this.logoRadius = 30.0,
    this.titleFontFamily = 'Pacifico',
    this.titleFontSize = 20.0,
    this.titleFontWeight = FontWeight.w800,
    this.height = 1.5,
    this.size = 12,
    this.fontWeight = FontWeight.normal,
    this.subtextColor = TColors.darkerGrey,
    this.customIcon,  // Initialize custom icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 45, bottom: 45),
      padding: const EdgeInsets.only(left: 0, right: 20),
      color: backgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: logoRadius,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(TImages.lightAppLogo),
              ),
              SizedBox(width: 10), // Spacing between logo and text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleText,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: titleFontFamily,
                      color: textColor,
                      fontSize: titleFontSize,
                      fontWeight: titleFontWeight,
                    ),
                  ),
                  Text(
                    subtitleText,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: subtextColor,
                      fontSize: size,
                      fontWeight: fontWeight,
                      height: height,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(width: 90),
          if (customIcon != null) customIcon! // Show the custom icon if available
        ],
      ),
    );
  }
}


