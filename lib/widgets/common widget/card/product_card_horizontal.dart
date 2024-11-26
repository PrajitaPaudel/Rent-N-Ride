import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/big_text.dart';

import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/small_text.dart';

import '../../../../utils/constants/colors.dart';
import '../container/circular_container.dart';
import '../image/t_rounded_images.dart';



class TProductCardHorizontal extends StatelessWidget {
  final String imageUrl;
  final String? defaultAssetImage;
  final String name;
  final String category;
  final String model;
  final String? price;
  final String? delete; // Nullable discount text for conditional rendering
  final VoidCallback onTap;
  final VoidCallback? onPress;// Custom onTap

  const TProductCardHorizontal({
    required this.imageUrl,
    required this.name,
    required this.category,
    required this.model,
    this.delete,
    this.onPress,
    required this.onTap,
    this.defaultAssetImage,
    Key? key, this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Trigger the custom onTap when tapped
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(1),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 4,
              spreadRadius: 2,
            )
          ],
          color: TColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            TCircularContainer(
              height: 120,
              width: 120,
              padding: 8.0,
              backgroundColor: TColors.light,
              radius: 15,
              child: Stack(
                children: [
                  TRoundedImages(
                    imageUrl: imageUrl,
                    applyImageRadius: true,
                    height: 120,
                    width: 120,
                    isNetworkingImage: true,
                    defaultAssetImage: defaultAssetImage,
                    fit: BoxFit.cover,
                  ),
                  SmallText(text: delete??"",textColor: Colors.transparent,)
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      children:[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: TColors.darkBlueGery,
                          ),
                        ),
                        if (delete != null && delete!.isNotEmpty) // Only show if discount exists
                          Positioned(

                            child: TCircularContainer(
                              onTap: onPress,
                              radius: 8,
                              backgroundColor: TColors.warning.withOpacity(0.1),
                              padding: 8,
                              child: Icon(Icons.delete,color:TColors.blueGery,)
                            ),
                          ),
                      ],
                    ),
                    ],),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        // Category
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: TColors.blueGery.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            category,
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Icon(Iconsax.verify5, color: TColors.primary, size: 16),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      model,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          price.toString(),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green[700],
                            fontWeight: FontWeight.bold,
                          ),
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
                            child: Icon(Iconsax.arrow_right_34, color: TColors.white,size: 20,),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
