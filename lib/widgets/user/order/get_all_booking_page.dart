// booking_total_amount_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/appbar/header_curveappbar.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/container/circular_container.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/small_text.dart';
import 'package:vehicle_rental_frontendui/widgets/user/user_dasboard.dart';
import '../../../controller/user_controller/booking_controller.dart';
import '../../common widget/button/Custom_button.dart';
import '../../common widget/image/t_rounded_images.dart';




class GetAllBooking extends StatefulWidget {
  final int bookingId;

  const GetAllBooking({required this.bookingId});

  @override
  _GetAllBookingState createState() => _GetAllBookingState();
}

class _GetAllBookingState extends State<GetAllBooking> {
  final BookingController bookingController = Get.put(BookingController());
  final defaultImageUrl = "assets/logos/logo-white.png";

  @override
  void initState() {
    super.initState();
    bookingController.fetchBookingDetails(widget.bookingId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Obx(() {
        if (bookingController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final bookingConfirmation = bookingController.bookingConfirmationInfo.value;
        final bookingInfo = bookingController.bookingInfo.value;

        if (bookingConfirmation == null || bookingInfo == null) {
          return Center(child: Text("Booking details not available."));
        }

        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                THeaderAppBar(text: 'Booking Summary',backgroundColor:  Colors.blueGrey.shade300, ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      TCircularContainer(
                        height: 175,
                        border: Border.all(color: Colors.grey),
                        backgroundColor: Colors.blueGrey.shade100,
                        padding: 15,
                        child: Column(

                          children: [
                            Text('Vehicle Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.grey.shade700)),
                              SizedBox(height: 12,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TRoundedImages(
                                  border: Border.all(color: Colors.grey),
                                  isNetworkingImage: true,
                               height: 80,
                                  imageUrl: bookingInfo.vehicle?.imageUrl.isNotEmpty == true
                                      ? bookingInfo.vehicle?.imageUrl ?? ''
                                      : '',
                                  defaultAssetImage: defaultImageUrl,
                                ),
                                SizedBox(width: 30,),
                                Column(
                                  children: [
                                    SmallText(text:'Brand: ${bookingInfo.vehicle?.brand}',fontWeight: FontWeight.w700,size: 15,textColor: Colors.grey.shade600,),
                                    SmallText(text:'Model: ${bookingInfo.vehicle?.model}',fontWeight: FontWeight.w700,size: 15,textColor: Colors.grey.shade600,),
                                    SmallText(text:'Category: ${bookingInfo.vehicle?.category}',fontWeight: FontWeight.w700,size: 15,textColor: Colors.grey.shade600,),

                                  ],
                                ),

                              ],
                            ),
                          ],

                        ),
                      ),


                      SizedBox(height: 25,),
                      TCircularContainer(
                        height: 150,
                        border: Border.all(color: Colors.grey),
                        backgroundColor: Colors.blueGrey.shade100,
                        padding: 15,
                        child: Column(
                          children: [
                            Text('Booking Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.grey.shade700)),
                            SizedBox(height: 8,),



                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SmallText(text:'Place: ',fontWeight: FontWeight.w700,size: 16,textColor: Colors.grey.shade700,),
                                    SizedBox(width: 5,),
                                    SmallText(text:'${bookingInfo.place}',fontWeight: FontWeight.w700,size: 15,textColor: Colors.grey.shade600,),

                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SmallText(text:'Phone: ',fontWeight: FontWeight.w700,size: 16,textColor: Colors.grey.shade700,),
                                    SizedBox(width: 5,),
                                    SmallText(text:'${bookingInfo.phoneNumber}',fontWeight: FontWeight.w700,size: 15,textColor: Colors.grey.shade600,),

                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SmallText(text:'Special Requests: ',fontWeight: FontWeight.w700,size: 16,textColor: Colors.grey.shade700,),
                                    SizedBox(width: 5,),
                                    SmallText(text:' ${bookingInfo.specialRequests}',fontWeight: FontWeight.w700,size: 15,textColor: Colors.grey.shade600,),

                                  ],
                                ),

                              ],
                            ),
                          ],

                        ),
                      ),
                      SizedBox(height: 25,),
                      TCircularContainer(
                        height: 190,
                        border: Border.all(color: Colors.grey),
                        backgroundColor: Colors.blueGrey.shade100,
                        padding: 15,
                        child: Column(
                          children: [
                            Text('Booking Confirmation', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.grey.shade700)),
                            SizedBox(height: 8,),



                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SmallText(text:'Total Amount: ',fontWeight: FontWeight.w700,size: 16,textColor: Colors.grey.shade700,),
                                    SizedBox(width: 5,),
                                    SmallText(text: "\$${bookingConfirmation.totalAmount}",fontWeight: FontWeight.w700,size: 15,textColor: Colors.grey.shade600,),

                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SmallText(text:'Discount: ',fontWeight: FontWeight.w700,size: 16,textColor: Colors.grey.shade700,),
                                    SizedBox(width: 5,),
                                    SmallText(text:'\$${bookingConfirmation.discountAmount}',fontWeight: FontWeight.w700,size: 15,textColor: Colors.grey.shade600,),

                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SmallText(text:'Email: ',fontWeight: FontWeight.w700,size: 16,textColor: Colors.grey.shade700,),
                                    SizedBox(width: 5,),
                                    SmallText(text:' ${bookingConfirmation.email}',fontWeight: FontWeight.w700,size: 15,textColor: Colors.grey.shade600,),

                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SmallText(text:'Payment Method: ',fontWeight: FontWeight.w700,size: 16,textColor: Colors.grey.shade700,),
                                    SizedBox(width: 5,),
                                    SmallText(text:' ${bookingConfirmation.paymentMethod}',fontWeight: FontWeight.w700,size: 15,textColor: Colors.grey.shade600,),

                                  ],
                                ),


                              ],
                            ),
                          ],

                        ),
                      ),
                      SizedBox(height: 30),
                      CustomButton(
                        // color:  Colors.blueGrey.shade700,
                        width: 400,
                        text: "Return",
                        onTap: () => {
                          Get.to(()=>UserDashboardPage()),
                        },
                      ),CustomButton(
                        // color:  Colors.blueGrey.shade700,
                        width: 400,
                        text: "Cancel Booking",
                        onTap: () => {
                          Get.to(()=>UserDashboardPage()),
                        },
                      ),
                      CustomButton(
                        // color:  Colors.blueGrey.shade700,
                        width: 400,
                        text: "Go To Dashboard",
                        onTap: () => {
                          Get.to(()=>UserDashboardPage()),
                        },
                      ),
                      SizedBox(height: 30),

                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
