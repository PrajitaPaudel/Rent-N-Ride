import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vehicle_rental_frontendui/controller/user_controller/category_by_id_controller.dart';
import 'package:vehicle_rental_frontendui/controller/user_controller/user_type_controller.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/container/circular_container.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/show_custom_snakebar.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/big_text.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/small_text.dart';
import 'dart:convert';
import 'dart:io';



import '../../../controller/dealer_controller/uploader_controller.dart';
import '../../../controller/user_controller/booking_controller.dart';
import '../../../model/login_model.dart';
import '../../../model/user/popular_model.dart';
import '../../../storage/app_storage.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/text_strings.dart';
import '../../common widget/button/Custom_button.dart';
import '../../common widget/image/t_rounded_images.dart';
import 'order_detail_page.dart';




class OrderPage extends StatefulWidget {
  final Vehicle vehicle;




  const OrderPage({Key? key, required this.vehicle, }) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
   LoginModel? loginModel;
  DateTime? startDate;
  DateTime? endDate;



  @override
  void initState() {
    super.initState();


    // Retrieve user data from AppStorage
    var userData = AppStorage.readUser; // This should be a Map
    if (userData != null) {
        loginModel = LoginModel.fromJson(userData); // Convert it back to LoginModel
    }
  }


  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imagefiles = [];

  String? selectedPaymentMethod;
  final TextEditingController creditCardController = TextEditingController();
  final TextEditingController paypalController = TextEditingController();
  final InsuranceController insuranceController = Get.put(InsuranceController());
  final BookingController bookingController = Get.put(BookingController());
  final TextEditingController addressController = TextEditingController();
  final TextEditingController billingAddressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController specialRequestController = TextEditingController();



  List<String> paymentMethods = [
    'Credit Card',
    'Debit Card',
    'Paypal',
    'Cash on Delivery',
  ];


  final defaultImageUrl = "assets/logos/logo-white.png";




  void _onSubmitBooking() async {
    bool insurance = insuranceController.selectedInsuranceType.value;
    String address = addressController.text .trim();
    String phoneNumber=phoneNumberController.text.trim();
    String billingAddress=billingAddressController.text.trim();
    String specialRequest=specialRequestController.text.trim();



    if (startDate == null || endDate == null) {
      showCustomSnakeBar("Please select rental dates.", title: "Error");
      return;
    }else if(address.isEmpty){
      showCustomSnakeBar('Enter Address',title: 'Address');
    }else if  (!GetUtils.isPhoneNumber(phoneNumber)) {
    showCustomSnakeBar('Type a valid contact number', title: "contact");
    }else if(billingAddress.isEmpty){
      showCustomSnakeBar('Enter Address',title: 'BillingAddress');
    }else

    await bookingController.createBooking(
      startDate: startDate!,
      endDate: endDate!,
      place:address ,
      vehicleId: widget.vehicle.vehicleId,
      email:loginModel?.email ?? 'No email' ,
      phoneNumber: phoneNumber,
      // Replace with actual user email if needed
      address: address,
      billingAddress: billingAddress,
      insuranceRequired: insurance, // Adjust based on actual insurance toggle
      specialRequests:specialRequest,
      images: imagefiles!,
    );
  }


  Future<void> openImages() async {
    var pickedFiles = await imagePicker.pickMultiImage();

    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      List<XFile> validImages = [];
      for (var pickedFile in pickedFiles) {
        if (await _isValidFile(pickedFile)) {
          validImages.add(pickedFile);
        }
      }

      if (validImages.isNotEmpty) {
        setState(() {
          imagefiles = validImages;
        });
      } else {
        showCustomSnakeBar("No valid images to upload.");
      }
    }
  }

  Future<bool> _isValidFile(XFile file) async {
    String fileExtension = file.path
        .split('.')
        .last
        .toLowerCase();
    if (!['jpg', 'jpeg', 'png'].contains(fileExtension)) {
      showCustomSnakeBar(
          "File ${file.name} must be a PNG, JPG, or JPEG image.");
      return false;
    }

    final fileSize = await File(file.path).length();
    if (fileSize > 102400) {
      showCustomSnakeBar(
          "File ${file.name} is too large. It must be less than 100KB.");
      return false;
    }

    return true;
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BigText(text: 'Confirm Rental', fontWeight: FontWeight.w700),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 60.0, bottom: 16, left: 16, right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            TCircularContainer(
              height: 80,
              border: Border.all(color: Colors.grey),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TRoundedImages(
                      border: Border.all(color: Colors.grey),
                      isNetworkingImage: true,
                      height: 200,
                      imageUrl: widget.vehicle.vehicleImages?.isNotEmpty == true
                          ? widget.vehicle.vehicleImages![0].imagePath ?? ''
                          : '',
                      defaultAssetImage: defaultImageUrl,
                    ),
                    const SizedBox(width: 40),
                    Flexible(  // Use Flexible instead of Expanded
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SmallText(text: 'Brand:', fontWeight: FontWeight.bold, size: 13),
                              const SizedBox(width: 5),
                              SmallText(text: widget.vehicle.brand?.vehicleBrandName ?? "Unknown", fontWeight: FontWeight.bold, size: 13),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              SmallText(text: 'Model:', fontWeight: FontWeight.bold, size: 13),
                              const SizedBox(width: 5),
                              SmallText(text: widget.vehicle.model?.vehicleModelName ?? "Unknown", fontWeight: FontWeight.bold, size: 13),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              SmallText(text: 'Category:', fontWeight: FontWeight.bold, size: 13),
                              const SizedBox(width: 5),
                              SmallText(text: widget.vehicle.category?.vehicleCategoryName ?? "Unknown", fontWeight: FontWeight.bold, size: 13),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Rental Dates Section
            TCircularContainer(
              border: Border.all(color: Colors.grey),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text(
                      'Start Date: ${startDate != null ? startDate.toString() : 'Select Date'}',
                      style: const TextStyle(fontSize: 15),
                    ),
                    onTap: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101),
                      );
                      if (picked != null) {
                        setState(() {
                          startDate = picked;

                        });
                      }
                    },
                  ),
                  ListTile(
                    title: Text(
                      'End Date: ${endDate != null ? endDate.toString() : 'Select Date'}',
                      style: const TextStyle(fontSize: 15),
                    ),
                    onTap: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101),
                      );
                      if (picked != null) {
                        setState(() {
                          endDate = picked;

                        });
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: 'Address',
                prefixIcon: Icon(Icons.location_on),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: billingAddressController,
              decoration: const InputDecoration(
                labelText: 'Billing Address',
                prefixIcon: Icon(Icons.location_on),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: phoneNumberController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            const SizedBox(height: 20),
            TCircularContainer(
              border: Border.all(color: Colors.grey),
              child: SizedBox(
                height: 100,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TCircularContainer(
                      onTap: () {
                        openImages();
                      },
                      border: Border.all(color: Colors.grey),
                      height: 100,
                      width: 100,
                      child: SizedBox(
                        height: 20,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.camera_alt),
                            const SizedBox(height: 5),
                             BigText(
                              text: 'Upload',
                              size: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: TCircularContainer(
                        padding: 8.0,
                        child: imagefiles != null && imagefiles!.isNotEmpty
                            ? GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                          ),
                          itemCount: imagefiles!.length,
                          itemBuilder: (context, index) {
                            File imageFile = File(imagefiles![index].path);
                            return Image.file(imageFile, fit: BoxFit.cover);
                          },
                        )
                            : const Center(
                          child: Text("Upload Driving License"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            TCircularContainer(
              border:  Border.all(color: Colors.grey),// Wrap the Row in a Container to ensure proper layout
              padding: 8,

              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(text: 'Insurance Required:',fontWeight: FontWeight.w600,size: 13,),
                  Obx(
                        () => Row(
                          mainAxisSize: MainAxisSize.min,
                      children: [

                        Expanded(
                          child: RadioListTile<bool>(
                            title: SmallText(
                                text: 'Yes',
                                textColor: TColors.darkerGrey,
                                fontWeight: FontWeight.w600),
                            value: true,
                            groupValue:insuranceController.selectedInsuranceType.value,
                            onChanged: (value) {
                              insuranceController.setInsuranceType(value!);
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<bool>(
                            title: SmallText(
                                text: 'NO',
                                textColor: TColors.darkerGrey,
                                fontWeight: FontWeight.w600),
                            value: false,
                            groupValue: insuranceController.selectedInsuranceType.value,
                            onChanged: (value) {
                              insuranceController.setInsuranceType(value!);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20,),
            TextFormField(
              controller: specialRequestController,
              maxLines: 2,
              decoration: InputDecoration(
                labelText: 'Special Request',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Any Request',
                labelStyle: TextStyle(
                  color: TColors.darkerGrey,
                ),
                hintStyle: TextStyle(
                  color: TColors.darkerGrey,
                  fontSize: 10,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: TColors.darkerGrey)),
              ),
            ),

            SizedBox(height: 40),
            CustomButton(
              width: 400,
              text: "Proceed",
              onTap: () => {
                _onSubmitBooking(),
              },
            ),


          ],
        ),
      ),
    );
  }

}







// Total Cost Section
// SizedBox(height: 20),
// TCircularContainer(
//   padding: 16,
//   border: Border.all(color: Colors.grey),
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     crossAxisAlignment: CrossAxisAlignment.stretch,
//     children: [
//       BigText(
//         text: 'Total Cost',
//         size: 20,
//         textAlign: TextAlign.center,
//         fontWeight: FontWeight.bold,
//       ),
//       SizedBox(height: 25),
//       Center(
//         child: Text(
//           'Total Cost: \$${totalCost.toStringAsFixed(2)}',
//           style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
//         ),
//       ),
//     ],
//   ),
// ),



//             SizedBox(height: 40),
//             TextFormField(
//
//               decoration: const InputDecoration(
//                   labelText: TTexts.address, prefixIcon: Icon(Iconsax.location)),
//             ),
//             SizedBox(height: 10),
//             TCircularContainer(
//               border: Border.all(color: Colors.grey),
//               child: Row(
//                 children: [
//                   TRoundedImages(
//                     height: 50,
//                     imageUrl:  widget.vehicle.vehicleImages?.isNotEmpty == true
//                         ?widget.vehicle.vehicleImages![0].imagePath ?? ''
//                         : '',
//                   ),
//                   Column(
//                     children: [
//                       Row(
//                         children: [
//                           SmallText(text: 'Brand:'),
//                           SizedBox(width: 5,),
//                           SmallText(text: widget.vehicle.brand?.vehicleBrandName ?? "Unknown Model"),
//                         ],
//                       ),
//                       SizedBox(height: 2,),
//                       Row(
//                         children: [
//                           SmallText(text: 'Model:'),
//                           SizedBox(width: 5,),
//                           SmallText(text: widget.vehicle.model?.vehicleModelName ?? "Unknown Model"),
//                         ],
//                       ),
//                       SizedBox(height: 2,),
//                       Row(
//                         children: [
//                           SmallText(text: 'Category:'),
//                           SizedBox(width: 5,),
//                           SmallText(text: widget.vehicle.category?.vehicleCategoryName ?? "Unknown Model"),
//                         ],
//                       ),
//
//                     ],
//                   )
//                 ],
//               ),
//             ),
//
//             // Payment Method Section
//             TCircularContainer(
//               border: Border.all(color: Colors.grey),
//               padding: 16,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   BigText(text: 'Payment Method', size: 20, textAlign: TextAlign.center, fontWeight: FontWeight.bold),
//                   SizedBox(height: 25),
//                   Center(
//                     child: DropdownButton<String>(
//                       value: selectedPaymentMethod,
//                       hint: Text('Select Payment Method'),
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           selectedPaymentMethod = newValue!;
//                           creditCardController.clear();
//                           paypalController.clear();
//                         });
//                       },
//                       items: paymentMethods.map<DropdownMenuItem<String>>((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//
//             // Payment Details Section
//             if (selectedPaymentMethod == 'Credit Card' || selectedPaymentMethod == 'Debit Card') ...[
//               TextField(
//                 controller: creditCardController,
//                 decoration: InputDecoration(labelText: 'Card Number'),
//                 keyboardType: TextInputType.number,
//               ),
//               TextField(
//                 decoration: InputDecoration(labelText: 'Expiry Date (MM/YY)'),
//               ),
//               TextField(
//                 decoration: InputDecoration(labelText: 'CVV', hintText: 'Card Verification Value'),
//                 keyboardType: TextInputType.number,
//               ),
//             ] else if (selectedPaymentMethod == 'Paypal') ...[
//               TextField(
//                 controller: paypalController,
//                 decoration: InputDecoration(labelText: 'Paypal Account Email'),
//               ),
//             ],
//             SizedBox(height: 40),
//
//             // Confirm Order Button
//             // CustomButton(
//             //   width: 400,
//             //   height: 70,
//             //
//             //   onTap: () {
//             //     if (startDate != null && endDate != null && selectedPaymentMethod != null) {
//             //       // Validate payment information
//             //       if ((selectedPaymentMethod == 'Credit Card' || selectedPaymentMethod == 'Debit Card') &&
//             //           creditCardController.text.isEmpty) {
//             //         showCustomSnakeBar('Please enter your card details');
//             //         return;
//             //       } else if (selectedPaymentMethod == 'Paypal' && paypalController.text.isEmpty) {
//             //         Get.snackbar('Error', 'Please enter your PayPal account email');
//             //         return;
//             //       }
//             //
//             //       // Create an order
//             //       OrderModel order = OrderModel(
//             //         vehicleId: 'vehicle_123',
//             //         userId: 'user_456',
//             //         startDate: startDate!,
//             //         endDate: endDate!,
//             //         totalCost: totalCost,
//             //         paymentMethod: selectedPaymentMethod!,
//             //       );
//             //   //     orderController.createOrder(order);
//             //   //     Get.to(() => OrderDetailPage(order: order));
//             //   //     showCustomSnakeBar(title: 'Success', 'Order Confirmed', color: Colors.green);
//             //   //   } else {
//             //   //     showCustomSnakeBar('Please select dates and payment method');
//             //   //   }
//             //   // },
//             //   // text: 'Confirm Order',
//             //
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }











