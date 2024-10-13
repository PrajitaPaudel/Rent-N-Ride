import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/big_text.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/shadows.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/small_text.dart';
import 'package:vehicle_rental_frontendui/widgets/user/product_details/product_detail_page.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../common widget/container/circular_container.dart';
import '../../../common widget/image/t_rounded_images.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Get.to(()=>ProductDetailScreen()),

      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),

        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadows],
          color: TColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TCircularContainer(
              height: 180,
              padding:8.0,
              backgroundColor: TColors.light,
              child: Stack(
                children: [
                  /// -- Thumbnail Image
                  TRoundedImages(imageUrl: TImages.categories1, applyImageRadius: true,
                    height: 180,

                    fit: BoxFit.cover,
                  ),

                  /// -- Sale Tag
                  Positioned(
                    top: 12,
                    child: TCircularContainer(
                      radius: 8,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding:8,
                      child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
                    ),
                  ),



                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(text: 'FZ25 YAMAHA',
                  fontWeight: FontWeight.w800,),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text( 'Bike',style:TextStyle(
                        color: TColors.darkGrey,)),
                      SizedBox(width: 5),
                      Icon(Iconsax.verify5,color: TColors.primary,size: 10,)
                    ],
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(
                     text: '\$100',
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                    ),

                    Container(
                        decoration: BoxDecoration(
                            color: TColors.dark,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomRight: Radius.circular(16),
                            )
                        ),

                        child: SizedBox(
                          width: 32,
                            height: 32,
                            child: Icon(Iconsax.add,color: TColors.white)))
                  ],
                ),

                ],
              ),
            ),
          ],

        ),
      ),
    );
  }
}


