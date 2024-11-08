import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/button/Custom_button.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/big_text.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/container/circular_container.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/small_text.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/image/t_rounded_images.dart';
import 'package:vehicle_rental_frontendui/widgets/user/order/order_page.dart';
import 'package:vehicle_rental_frontendui/widgets/user/product_details/widget/brand_text_verify.dart';

import 'package:vehicle_rental_frontendui/widgets/user/product_details/widget/product_price_text.dart';
import 'package:vehicle_rental_frontendui/widgets/user/product_details/widget/product_review_page.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';


import 'package:flutter/material.dart';

class TProductMetaData extends StatelessWidget {
  final String productName;
  final String brand;
  final String imageUrl;
  final String? defaultAssetImage;
  final String originalPrice;
  final String discountedPrice;
  final String discountPercentage;
  final String status;
  final String category;
  final String damages;
  final String description;
  final int reviewCount;
  final VoidCallback onCheckout;
  final VoidCallback onViewReviews;

  const TProductMetaData({
    Key? key,
    required this.productName,
    required this.brand,
    required this.imageUrl,
    required this.originalPrice,
    required this.discountedPrice,
    required this.discountPercentage,
    required this.status,
    required this.category,
    required this.damages,
    required this.description,
    required this.reviewCount,
    required this.onCheckout,
    required this.onViewReviews, this.defaultAssetImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TCircularContainer(
              radius: 8,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: 8,
              child: SmallText(text: discountPercentage, textColor: TColors.black),
            ),
            SizedBox(width: 10),
            Text(
              "\$$originalPrice",
              style: Theme.of(context).textTheme.labelSmall!.apply(decoration: TextDecoration.lineThrough),
            ),
            SizedBox(width: 10),
            TProductPriceText(price: discountedPrice, isLarge: true),
          ],
        ),
        SizedBox(height: 20),
        SmallText(text: productName, fontWeight: FontWeight.w600),
        SizedBox(height: 20),
        Row(
          children: [
            TRoundedImages(
              isNetworkingImage: true,
              imageUrl: imageUrl,
              defaultAssetImage: defaultAssetImage,
              width: 19,
              height: 19,
            ),
            SizedBox(width: 3),
            TBrandTextVerify(title: brand),
          ],
        ),
        SizedBox(height: 10),
        _buildInfoRow('Status:', status),
        _buildInfoRow('Category:', category),
        _buildInfoRow('Damages:', damages),
        SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: CustomButton(text: 'CheckOut', onTap: onCheckout),
        ),
        SizedBox(height: 32),
        BigText(text: "Description", fontWeight: FontWeight.w800),
        ReadMoreText(
          description,
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: "Show more",
          trimExpandedText: "less",
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        ),
        Divider(),
        SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BigText(text: "Review($reviewCount)", fontWeight: FontWeight.w600),
            IconButton(
              onPressed: onViewReviews,
              icon: Icon(Iconsax.arrow_right_3, size: 18),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        SmallText(text: label),
        SizedBox(width: 10),
        SmallText(text: value, fontWeight: FontWeight.bold),
      ],
    );
  }
}
