import 'package:flutter/material.dart';
import 'package:vehicle_rental_frontendui/utils/constants/colors.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/image/t_rounded_images.dart';

class HomeTitle extends StatelessWidget {
  final String iconPath;
  final String text;
  final VoidCallback onTap;
   final Color color;
  const HomeTitle({
    super.key,
    required this.iconPath,
    required this.text,
    required this.onTap,
    this.color=TColors.darkGrey,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Navigate to next page when tapped
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image.asset(
          //   iconPath, // Display the icon from the asset path
          //   width: 50,
          //   height: 50,
          //
          // ),
          TRoundedImages(
              imageUrl: iconPath,
            width: 40,
            height: 40,
          ),
          SizedBox(width: 10), // Space between icon and text
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: color,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
