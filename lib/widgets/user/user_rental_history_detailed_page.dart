import 'package:flutter/material.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/appbar/header_curveappbar.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/container/circular_container.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/image/t_rounded_images.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/big_text.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/small_text.dart';
import 'package:vehicle_rental_frontendui/widgets/user/product_details/widget/brand_text_verify.dart';
import 'package:vehicle_rental_frontendui/widgets/user/product_details/widget/product_meta_data.dart';
import 'package:vehicle_rental_frontendui/widgets/user/product_details/widget/rating_sharing_widget.dart';

import '../../../model/admin/rental_history_model.dart';
import '../../../utils/constants/colors.dart';



class UserRentalHistoryDetailedPage extends StatelessWidget {
  final Values values;
  final defaultImageUrl = "assets/logos/logo-white.png";
  UserRentalHistoryDetailedPage({super.key, required this.values});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
          THeaderAppBar(text: 'Rental History',),
            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TCircularContainer(
                    padding: 20,
                    border: Border.all(color: TColors.grey),
                    backgroundColor: Colors.blueGrey.shade50 ,
                    child: TRoundedImages(
                      padding: EdgeInsets.all(12),
                      imageUrl: (values.vehicleImages != null && values.vehicleImages!.isNotEmpty)
                          ? values.vehicleImages!.first ?? ''
                          : '',
                     isNetworkingImage: true,
                      defaultAssetImage: defaultImageUrl,


                    ),


                  ),
                  SizedBox(height: 21,),
                  Divider(endIndent: 180,thickness: 3,),
                  SizedBox(height: 21,),
                  TCircularContainer(
                    padding: 15,
                    backgroundColor: Colors.blueGrey.shade50 ,
                    border: Border.all(color: TColors.grey),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BigText(text: 'Vehicle',size: 20,fontWeight: FontWeight.w800,color: Colors.grey.shade500,textAlign: TextAlign.center,),
                        SizedBox(height:8),
                        Row(
                          children: [
                            SmallText(text: 'Category:',size: 15,fontWeight:FontWeight.bold ,),
                            SizedBox(width: 8,),
                            SmallText(text:values.vehicleCategory??'', size: 15,fontWeight:FontWeight.bold ,textColor: TColors.blueGery,),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            TRoundedImages(
                              isNetworkingImage: true,
                              imageUrl: values.vehicleImageUrl??'',
                              defaultAssetImage: defaultImageUrl,
                              width: 22,
                              height: 22,
                            ),
                            SizedBox(width: 3),
                            TBrandTextVerify(title:values.vehicleBrand??"",),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            SmallText(text: 'Model:',size: 15,fontWeight:FontWeight.bold ,),
                            SizedBox(width: 8,),
                            SmallText(text:values.vehicleModel??'', size: 15,fontWeight:FontWeight.bold ,textColor: TColors.blueGery,),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SmallText(text: 'Rating:',size: 15,fontWeight:FontWeight.bold ,),
                            SizedBox(width: 5),
                            TRatingAndShare(
                              rating: (values.rating?.toString() ?? ''), // Ensure the value is a string

                            ),
                          ],
                        ),
                      ],
                    ),

                  ),

                  SizedBox(height: 21,),
                  Divider(indent: 180,thickness: 3,),
                  SizedBox(height: 21,),
                  TCircularContainer(
                    padding: 15,
                    backgroundColor: Colors.blueGrey.shade50  ,
                    border: Border.all(color: TColors.grey),
                    child: Column(
                      children: [
                          BigText(text: 'Booking',size: 20,fontWeight: FontWeight.w800,color: Colors.grey.shade500,),
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            SmallText(text: "Start Date:",size: 15,fontWeight:FontWeight.bold ,),
                              SizedBox(width: 7,),
                            SmallText(text: values.startDate??"",fontWeight: FontWeight.bold,textColor: TColors.blueGery,size: 15,),
                          ],
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            SmallText(text: "Start Date:",size: 15,fontWeight:FontWeight.bold ,),
                            SizedBox(width: 7,),
                            SmallText(text: values.endDate??"",fontWeight: FontWeight.bold,textColor: TColors.blueGery,size: 15,),
                          ],
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            SmallText(text: "Return Date:",size: 15,fontWeight:FontWeight.bold ,),
                            SizedBox(width: 7,),
                            SmallText(text: values.actualReturnDate??"--",fontWeight: FontWeight.bold,textColor: TColors.blueGery,size: 15,),
                          ],
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            SmallText(text: "Total Amount:",size: 15,fontWeight:FontWeight.bold ,),
                            SizedBox(width: 7,),
                            SmallText(text: values.totalAmount.toString()??'',fontWeight: FontWeight.bold,textColor: TColors.blueGery,size: 15,),
                          ],
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            SmallText(text: "Payment Method:",size: 15,fontWeight:FontWeight.bold ,),
                            SizedBox(width: 7,),
                            SmallText(text: values.paymentMethod??"--",fontWeight: FontWeight.bold,textColor: TColors.blueGery,size: 15,),
                          ],
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            SmallText(text: "Place:",size: 15,fontWeight:FontWeight.bold ,),
                            SizedBox(width: 7,),
                            SmallText(text: values.place??"--",fontWeight: FontWeight.bold,textColor: TColors.blueGery,size: 15,),
                          ],
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            SmallText(text: "Damage Report:",size: 15,fontWeight:FontWeight.bold ,),
                            SizedBox(width: 7,),
                            SmallText(text: values.damageReported??"--",fontWeight: FontWeight.bold,textColor: TColors.blueGery,size: 15,),
                          ],
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Divider(endIndent: 180,thickness: 3,),
                  SizedBox(height: 21,),
                ],
              ),

            ),



          ],
        ),
      ),

    );
  }
}


