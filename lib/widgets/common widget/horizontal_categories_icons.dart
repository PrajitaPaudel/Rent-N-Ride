import 'package:flutter/material.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/image/t_rounded_images.dart';

import '../../utils/constants/colors.dart';



class TCategoresImage extends StatelessWidget {
  const TCategoresImage({
    super.key,
    required this.image,
    required this.title,
    this.textColor=TColors.black,
    this.backgroundColor=TColors.lightGrey,
    this.onTap,
  });

  final String image,title;
  final Color textColor;
  final Color backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Padding(
        padding: const EdgeInsets.only(right:10.0,left: 10),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,

              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: TRoundedImages(
                padding: EdgeInsets.all(5),
                imageUrl:image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height:8,),
            SizedBox(
                width:55,
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,)),
          ],
        ),
      ),
    );
  }
}
