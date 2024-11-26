import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vehicle_rental_frontendui/model/user/popular_model.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/container/circular_container.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/small_text.dart';

import '../../../controller/user_controller/booking_controller.dart';
import '../../../model/user/booking_payment_list_model.dart';
import '../../common widget/button/Custom_button.dart';
import '../../common widget/image/t_rounded_images.dart';
import '../../common widget/text/big_text.dart';





class BookingTotalAmountPage extends StatefulWidget {
  final int bookingId;
  final Vehicle vehicle;

  const BookingTotalAmountPage({required this.bookingId, required this.vehicle});

  @override
  _BookingTotalAmountPageState createState() => _BookingTotalAmountPageState();
}

class _BookingTotalAmountPageState extends State<BookingTotalAmountPage> {
  final BookingController bookingController = Get.put(BookingController());
  final TextEditingController emailController = TextEditingController();
  String? selectedPaymentMethod;
  final defaultImageUrl = "assets/logos/logo-white.png";
  @override
  void initState() {
    super.initState();
    bookingController.fetchBookingTotal(widget.bookingId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Booking Summary'),
      centerTitle: true,),
      body: Obx(() {
        final booking = bookingController.bookingTotal.value;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TCircularContainer(
              //   height: 80,
              //   border: Border.all(color: Colors.grey),
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         TRoundedImages(
              //           border: Border.all(color: Colors.grey),
              //           isNetworkingImage: true,
              //           height: 200,
              //           imageUrl: widget.vehicle.vehicleImages?.isNotEmpty == true
              //               ? widget.vehicle.vehicleImages![0].imagePath ?? ''
              //               : '',
              //           defaultAssetImage: defaultImageUrl,
              //         ),
              //         const SizedBox(width: 40),
              //         Flexible(  // Use Flexible instead of Expanded
              //           child: Column(
              //             mainAxisSize: MainAxisSize.min,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Row(
              //                 children: [
              //                   SmallText(text: 'Brand:', fontWeight: FontWeight.bold, size: 13),
              //                   const SizedBox(width: 5),
              //                   SmallText(text: widget.vehicle.brand?.vehicleBrandName ?? "Unknown", fontWeight: FontWeight.bold, size: 13),
              //                 ],
              //               ),
              //               const SizedBox(height: 2),
              //               Row(
              //                 children: [
              //                   SmallText(text: 'Model:', fontWeight: FontWeight.bold, size: 13),
              //                   const SizedBox(width: 5),
              //                   SmallText(text: widget.vehicle.model?.vehicleModelName ?? "Unknown", fontWeight: FontWeight.bold, size: 13),
              //                 ],
              //               ),
              //               const SizedBox(height: 2),
              //               Row(
              //                 children: [
              //                   SmallText(text: 'Category:', fontWeight: FontWeight.bold, size: 13),
              //                   const SizedBox(width: 5),
              //                   SmallText(text: widget.vehicle.category?.vehicleCategoryName ?? "Unknown", fontWeight: FontWeight.bold, size: 13),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              const SizedBox(height: 20),
              TCircularContainer(
                border:  Border.all(color: Colors.grey),
                  padding: 10,
                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallText( text:' Rental Charge:',fontWeight: FontWeight.bold,size: 13,),
                          SmallText( text:' \$${booking.rentalCharge}',fontWeight: FontWeight.bold,size: 13,textColor:Colors.blue),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallText( text:'Total Before Discount:',fontWeight: FontWeight.bold,size: 13),
                          SmallText( text:'\$${booking.totalAmountBeforeDiscount}',fontWeight: FontWeight.bold,size: 13,textColor:Colors.blue),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallText( text:'Discount:',fontWeight: FontWeight.bold,size: 13),
                          SmallText( text:'\$${booking.discountAmount}',fontWeight: FontWeight.bold,size: 13,textColor:Colors.blue,),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallText( text:'Total Amount:',fontWeight: FontWeight.bold,size: 15),
                          SmallText( text:'\$${booking.discountAmount}',fontWeight: FontWeight.bold,size: 15,textColor:Colors.red),
                        ],
                      ),

                    ],
                  )),
              SizedBox(height: 20),
              TCircularContainer(
              border: Border.all(color: Colors.grey),
              padding: 16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BigText(text: 'Payment Method', size: 20, textAlign: TextAlign.center, fontWeight: FontWeight.bold),
                  SizedBox(height: 25),
                  TCircularContainer(
                    border: Border.all(color: Colors.grey),
                    padding: 10,
                    child: Center(
                      child: DropdownButton<String>(
                        value: selectedPaymentMethod,
                        hint: Text('Select Payment Method'),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedPaymentMethod = newValue!;


                          });
                        },
                        items: booking.paymentMethods.map((method) {
                          return DropdownMenuItem<String>(
                            value: method,
                            child: Text(method),
                          );
                        }).toList(),

                      ),
                    ),
                  ),
                ],
              ),
            ),


              // Conditionally show email field based on payment method
              if (selectedPaymentMethod != null && selectedPaymentMethod != "Cash on Delivery") ...[
                SizedBox(height: 20),
                TCircularContainer(
                  backgroundColor: Colors.blueGrey.shade50,
                  border: Border.all(color: Colors.grey.shade50),
                  padding: 20,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
              SizedBox(height: 40),
              CustomButton(
                width: 400,
                text: "Confirm",
                onTap: () {
                  if (selectedPaymentMethod == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please select a payment method")),
                    );
                  } else {
                    final bookingConfirmation = BookingConfirmationModel(
                      bookingId: widget.bookingId,
                      paymentMethod: selectedPaymentMethod!,
                      email: selectedPaymentMethod != "Cash on Delivery" ? emailController.text : null,
                    );

                    bookingController.confirmBooking(bookingConfirmation);
                  }
                },
              ),
            ],

          ),
        );
      }),
    );
  }
}
