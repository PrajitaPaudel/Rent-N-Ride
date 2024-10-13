import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vehicle_rental_frontendui/utils/constants/colors.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/small_text.dart';

class TBrandTextVerify extends StatelessWidget {
  const TBrandTextVerify({super.key,
    required this.title,

    this.iconColor = TColors.primary,
    this.textAlign = TextAlign.center,

  });

  final String title;
  final Color?  iconColor;
  final TextAlign? textAlign;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: SmallText(
            text: title,
            textColor: TColors.grey,
            textAlign: textAlign,
            fontWeight: FontWeight.bold,

          ),
        ),
        const SizedBox(width: 7),
        Icon(Iconsax.verify5, color: iconColor, size:15),
      ],
    );
  }
}
