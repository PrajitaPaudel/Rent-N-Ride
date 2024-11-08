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

import 'package:flutter/material.dart';

class TProductCardVertical extends StatelessWidget {
  final String imageUrl;
  final String? defaultAssetImage;
  final String name;
  final String category;
  final double price;
  final String? discount; // Nullable discount text for conditional rendering
  final VoidCallback onTap; // Custom onTap

  const TProductCardVertical({
    required this.imageUrl,
    required this.name,
    required this.category,
    required this.price,
    this.discount,
    required this.onTap,
    this.defaultAssetImage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Trigger the custom onTap when tapped
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4, spreadRadius: 2)],
          color: TColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TCircularContainer(
              height: 180,
              padding: 8.0,
              backgroundColor: TColors.light,
              radius: 15,
              child: Stack(
                children: [
                  TRoundedImages(
                    imageUrl: imageUrl,
                    applyImageRadius: true,
                    height: 180,
                    isNetworkingImage: true,
                    defaultAssetImage: defaultAssetImage,
                    fit: BoxFit.cover,
                  ),
                  if (discount != null && discount!.isNotEmpty) // Only show if discount exists
                    Positioned(
                      top: 12,
                      child: TCircularContainer(
                        radius: 8,
                        backgroundColor: TColors.secondary.withOpacity(0.8),
                        padding: 8,
                        child: Text(
                          discount!,
                          style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),
                        ),
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
                  SmallText(
                    text: name,
                    fontWeight: FontWeight.w800,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        category,
                        style: TextStyle(color: TColors.darkGrey),
                      ),
                      const SizedBox(width: 5),
                      Icon(Iconsax.verify5, color: TColors.primary, size: 10),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(
                        text: '\$$price',
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                        child: SizedBox(
                          width: 32,
                          height: 32,
                          child: Icon(Iconsax.add, color: TColors.white),
                        ),
                      ),
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
