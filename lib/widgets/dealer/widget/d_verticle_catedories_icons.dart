import 'package:flutter/material.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/image/t_rounded_images.dart';

import '../../../utils/constants/colors.dart';




class TDCategoresImage extends StatelessWidget {
  const TDCategoresImage({
    super.key,
    required this.image,
    required this.title,
    this.textColor=TColors.black,
    this.backgroundColor=TColors.lightGrey,
    this.onTap, this.onPressed,
  });

  final String image,title;
  final Color textColor;
  final Color backgroundColor;
  final void Function()? onTap;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Padding(
        padding: const EdgeInsets.only(right:10.0,left: 10),
        child: Row(

          children: [
            Container(
               width: 56,
              height: 56,

              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(200),
              ),
              child: TRoundedImages(
                padding: EdgeInsets.all(5),
                imageUrl:image,
                fit: BoxFit.cover,
              ),
            ),
             const SizedBox(width:20,),
            SizedBox(
                width:70,
                child: Text(
                  title,
                  maxLines: 2,
                   overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),)),
             const SizedBox(width:180,),

            IconButton(
              icon: Icon(Icons.arrow_forward, color: TColors.primary),
              onPressed: onPressed,
            )],
        ),
      ),
    );
  }
}
