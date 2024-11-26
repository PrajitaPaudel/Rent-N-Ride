import 'package:flutter/material.dart';
import 'package:vehicle_rental_frontendui/model/dealer/booked_vehicle_model.dart';
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



class DealerBookedHistoryDetailedPage extends StatelessWidget {
  final Vehicle vehicle;
  final Booking booking;

  final defaultImageUrl = "assets/logos/logo-white.png";
  const DealerBookedHistoryDetailedPage({super.key, required this.vehicle,   required this.booking, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            THeaderAppBar(text: 'Booked History',),
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
                      imageUrl: vehicle.imageUrl??defaultImageUrl,
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
                            SmallText(text:vehicle.category??'', size: 15,fontWeight:FontWeight.bold ,textColor: TColors.blueGery,),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            TRoundedImages(
                              isNetworkingImage: true,
                              imageUrl: vehicle.imageUrl??'',
                              defaultAssetImage: defaultImageUrl,
                              width: 22,
                              height: 22,
                            ),
                            SizedBox(width: 3),
                            TBrandTextVerify(title:vehicle.brand??"",),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            SmallText(text: 'Model:',size: 15,fontWeight:FontWeight.bold ,),
                            SizedBox(width: 8,),
                            SmallText(text:vehicle.model??'', size: 15,fontWeight:FontWeight.bold ,textColor: TColors.blueGery,),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SmallText(text: 'Price:',size: 15,fontWeight:FontWeight.bold ,),
                            SizedBox(width: 5),
                            SmallText(text:vehicle.price.toString()??'', size: 15,fontWeight:FontWeight.bold ,textColor: TColors.success,),
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
                            SmallText(text: booking.startDate.toString()??"",fontWeight: FontWeight.bold,textColor: TColors.blueGery,size: 15,),
                          ],
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            SmallText(text: "Start Date:",size: 15,fontWeight:FontWeight.bold ,),
                            SizedBox(width: 7,),
                            SmallText(text: booking.endDate.toString()??"",fontWeight: FontWeight.bold,textColor: TColors.blueGery,size: 15,),
                          ],
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            SmallText(text: "Place:",size: 15,fontWeight:FontWeight.bold ,),
                            SizedBox(width: 7,),
                            SmallText(text: booking.place??"",fontWeight: FontWeight.bold,textColor: TColors.blueGery,size: 15,),
                          ],
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            SmallText(text: "Phone Number:",size: 15,fontWeight:FontWeight.bold ,),
                            SizedBox(width: 7,),
                            SmallText(text: booking.phoneNumber??"",fontWeight: FontWeight.bold,textColor: TColors.blueGery,size: 15,),
                          ],
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            SmallText(text: "Email:",size: 15,fontWeight:FontWeight.bold ,),
                            SizedBox(width: 7,),
                            SmallText(text: booking.email??"",fontWeight: FontWeight.bold,textColor: TColors.blueGery,size: 15,),
                          ],
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            SmallText(text: "Billing Address:",size: 15,fontWeight:FontWeight.bold ,),
                            SizedBox(width: 7,),
                            SmallText(text: booking.billingAddress??"",fontWeight: FontWeight.bold,textColor: TColors.blueGery,size: 15,),
                          ],
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            SmallText(text: "Insurance Required:",size: 15,fontWeight:FontWeight.bold ,),
                            SizedBox(width: 7,),
                            SmallText(text: booking.insuranceRequired==true?"Yes":"No",fontWeight: FontWeight.bold,textColor: TColors.blueGery,size: 15,),
                          ],
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            SmallText(text: "Special Request:",size: 15,fontWeight:FontWeight.bold ,),
                            SizedBox(width: 7,),
                            SmallText(text: booking.specialRequests??"",fontWeight: FontWeight.bold,textColor: TColors.blueGery,size: 15,),
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
  }}