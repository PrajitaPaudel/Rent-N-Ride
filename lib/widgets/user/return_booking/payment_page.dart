
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:vehicle_rental_frontendui/widgets/common%20widget/appbar/header_curveappbar.dart';

import '../../../controller/user_controller/return_booking_controller.dart';
import '../../../model/user/booking_payment_list_model.dart';
import '../../../utils/constants/colors.dart';
import '../../common widget/button/Custom_button.dart';
import '../../common widget/container/circular_container.dart';
import '../../common widget/text/big_text.dart';
import '../../common widget/text/small_text.dart';


class PaymentPage extends StatefulWidget {
  final int returnId;
  final int bookingId;

  PaymentPage({Key? key, required this.returnId, required this.bookingId}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final ReturnController controller = Get.put(ReturnController());
  final TextEditingController emailController = TextEditingController();
  String? selectedPaymentMethod;

  @override
  void initState() {
    super.initState();
    // Fetch the return total when the page loads
    controller.fetchReturnTotal(widget.returnId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: TColors.lightGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            THeaderAppBar(text: 'Return Confirmation',backgroundColor:  Colors.blueGrey.shade300),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Return Confirmation Summary',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.grey.shade600),
                  ),
                  SizedBox(height: 20),
                  Obx(() {
                    final returnTotal = controller.returnTotal.value;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TCircularContainer(

                          border: Border.all(color: Colors.grey),
                          padding: 10,
                          height: 120,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SmallText(
                                    text: 'TotalAmountBeforeFees:',
                                    fontWeight: FontWeight.bold,
                                    size: 17,
                                  ),
                                  SmallText(
                                    text: '\$${returnTotal.totalAmountBeforeFees.toStringAsFixed(2)}',
                                    fontWeight: FontWeight.bold,
                                    size: 17,
                                    textColor: Colors.blue,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SmallText(
                                    text: 'Total Late Fees:',
                                    fontWeight: FontWeight.bold,
                                    size: 17,
                                  ),
                                  SmallText(
                                    text: '\$${returnTotal.totalLateFees.toStringAsFixed(2)}',
                                    fontWeight: FontWeight.bold,
                                    size: 17,
                                    textColor: Colors.blue,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SmallText(
                                    text: 'DamageFee',
                                    fontWeight: FontWeight.bold,
                                    size: 17,
                                  ),
                                  SmallText(
                                    text: '\$${returnTotal.damageFee.toStringAsFixed(2)}',
                                    fontWeight: FontWeight.bold,
                                    size: 17,
                                    textColor: Colors.blue,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        TCircularContainer(
                          border: Border.all(color: Colors.grey),
                          padding: 16,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              BigText(
                                text: 'Payment Method',
                                size: 23,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade600,
                              ),
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
                                    items: returnTotal.paymentMethods.map((method) {
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
                        if (selectedPaymentMethod != null &&
                            selectedPaymentMethod != "Cash on Delivery") ...[
                          SizedBox(height: 20),
                          TCircularContainer(
                            backgroundColor: Colors.blueGrey.shade50,
                            border: Border.all(color: Colors.grey.shade50),
                            padding: 20,
                            child: TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:Colors.grey.shade50 ,
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
                                bookingId: widget.bookingId,  // Make sure to pass the correct booking ID
                                paymentMethod: selectedPaymentMethod!,
                                email: selectedPaymentMethod != "Cash on Delivery" ? emailController.text : null,
                              );

                              // Pass the returnId and bookingConfirmation to the controller
                              controller.confirmReturn(widget.returnId, bookingConfirmation);
                            }
                          },
                        ),
                      ],
                    );
                  }),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



