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

class TVehicleMetaData extends StatelessWidget {
  final String productName;
  final String brand;
  final String imageUrl;
  final String? defaultAssetImage;
  final String price;
  final String available;
  final String userId;

  final String status;
  final String category;
  final String damages;
  final String description;

  const TVehicleMetaData({
    Key? key,
    required this.productName,
    required this.brand,
    required this.imageUrl,
    required this.price,


    required this.status,
    required this.category,
    required this.damages,
    required this.description,
     this.defaultAssetImage, required this.available, required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TCircularContainer(
      padding: 15,
      backgroundColor: Colors.blueGrey.shade50,
      border: Border.all(color:Colors.blueGrey.shade50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [

              BigText(text:"\$$price", size: 25,fontWeight: FontWeight.bold,),
            ],
          ),
          SizedBox(height: 20),
          SmallText(text: productName, fontWeight: FontWeight.w600,size: 22,),
          SizedBox(height: 10),
          Row(
            children: [
              TRoundedImages(
                isNetworkingImage: true,
                imageUrl: imageUrl,
                defaultAssetImage: defaultAssetImage,
                width: 22,
                height: 22,
              ),
              SizedBox(width: 3),
              TBrandTextVerify(title: brand),
            ],
          ),
          SizedBox(height: 10),

          _buildInfoRow('Popular:', status),
          _buildInfoRow('Category:', category),
          _buildInfoRow('Damages:', damages),
          _buildInfoRow('Available:',available),
          _buildInfoRow('UserId:', userId),
          SizedBox(height: 32),
          BigText(text: "Description", fontWeight: FontWeight.w800),
          ReadMoreText(
            description,
            trimLines: 2,
            trimMode: TrimMode.Line,
            trimCollapsedText: "Show more",
            trimExpandedText: "less",
            moreStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
            lessStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 32),
          Divider(),
          SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        SmallText(text: label),
        SizedBox(width: 10),
        SmallText(text: value, fontWeight: FontWeight.bold,size: 16,),
      ],
    );
  }
}
