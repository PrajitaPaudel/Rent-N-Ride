


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'dart:io';

import '../../../controller/user_controller/booking_controller.dart';
import '../../../controller/user_controller/user_type_controller.dart';
import '../../../model/login_model.dart';
import '../../../model/user/booking_model.dart';
import '../../../model/user/popular_model.dart';
import '../../../storage/app_storage.dart';
import '../../../utils/constants/colors.dart';
import '../../common widget/button/Custom_button.dart';
import '../../common widget/container/circular_container.dart';
import '../../common widget/image/t_rounded_images.dart';
import '../../common widget/show_custom_snakebar.dart';
import '../../common widget/text/big_text.dart';
import '../../common widget/text/small_text.dart';


//
//
// class EditOrderPage extends StatefulWidget {
//   final BookingModel booking; // Pass the BookingModel instance
//   final Vehicle? vehicle;
//   const EditOrderPage({Key? key, required this.booking, this.vehicle}) : super(key: key);
//
//   @override
//   _EditOrderPageState createState() => _EditOrderPageState();
// }
//
// class _EditOrderPageState extends State<EditOrderPage> {
//   final BookingController bookingController = Get.put(BookingController());
//   LoginModel? loginModel;
//   DateTime? startDate;
//   DateTime? endDate;
//   int id=0 ;
//   final ImagePicker imagePicker = ImagePicker();
//   List<XFile>? imagefiles = [];
//
//   final TextEditingController addressController = TextEditingController();
//   final TextEditingController billingAddressController = TextEditingController();
//   final TextEditingController phoneNumberController = TextEditingController();
//   final TextEditingController specialRequestController = TextEditingController();
//   final InsuranceController insuranceController = Get.put(InsuranceController());
//
//
//
//   @override
//   void initState() {
//     super.initState();
//     id= widget.booking.id!;
//     var userData = AppStorage.readUser; // This should be a Map
//     if (userData != null) {
//       // loginModel = LoginModel.fromJson(userData);
//       // Initialize with the existing booking details
//       startDate = widget.booking.startDate;
//       endDate = widget.booking.endDate;
//       addressController.text = widget.booking.place;
//       billingAddressController.text = widget.booking.billingAddress ?? '';
//       phoneNumberController.text = widget.booking.phoneNumber;
//       specialRequestController.text = widget.booking.specialRequests ?? '';
//     }
//   }
//
//   final defaultImageUrl = "assets/logos/logo-white.png";
//
//   void _onUpdateBooking() async {
//     // Prepare updated booking data
//     BookingModel updatedBooking = BookingModel(
//       id: id,
//       startDate: startDate ?? widget.booking.startDate, // Ensure a non-null value
//       endDate: endDate ?? widget.booking.endDate,
//       files: imagefiles?.map((file) => File(file.path)).toList(),
//       place: addressController.text.trim(),
//       // vehicleId: widget.booking.vehicleId,
//       phoneNumber: phoneNumberController.text.trim(),
//
//       vehicleId: widget.vehicle?.vehicleId,
//       // email:loginModel?.emailId ?? 'No email' ,
//        email: widget.booking.email,
//       address: addressController.text.trim(),
//       billingAddress: billingAddressController.text.trim(),
//       insuranceRequired: insuranceController.selectedInsuranceType.value,
//       specialRequests: specialRequestController.text.trim(),
//     );
//
//     // Call the update service
//     await bookingController.updateBooking(widget.booking.id!, updatedBooking);
//     // Optionally, navigate back or show a success message
//     Get.back(); // Navigate back to the previous page
//   }
//   Future<void> openImages() async {
//     var pickedFiles = await imagePicker.pickMultiImage();
//
//     if (pickedFiles != null && pickedFiles.isNotEmpty) {
//       List<XFile> validImages = [];
//       for (var pickedFile in pickedFiles) {
//         if (await _isValidFile(pickedFile)) {
//           validImages.add(pickedFile);
//         }
//       }
//
//       if (validImages.isNotEmpty) {
//         setState(() {
//           imagefiles = validImages;
//         });
//       } else {
//         showCustomSnakeBar("No valid images to upload.");
//       }
//     }
//   }
//
//   Future<bool> _isValidFile(XFile file) async {
//     String fileExtension = file.path
//         .split('.')
//         .last
//         .toLowerCase();
//     if (!['jpg', 'jpeg', 'png'].contains(fileExtension)) {
//       showCustomSnakeBar(
//           "File ${file.name} must be a PNG, JPG, or JPEG image.");
//       return false;
//     }
//
//     final fileSize = await File(file.path).length();
//     if (fileSize > 102400) {
//       showCustomSnakeBar(
//           "File ${file.name} is too large. It must be less than 100KB.");
//       return false;
//     }
//
//     return true;
//   }
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: BigText(text: 'Confirm Rental', fontWeight: FontWeight.w700),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.only(top: 60.0, bottom: 16, left: 16, right: 16),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//
//           children: [
//             TCircularContainer(
//               height: 80,
//               border: Border.all(color: Colors.grey),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     TRoundedImages(
//                       border: Border.all(color: Colors.grey),
//                       isNetworkingImage: true,
//                       height: 200,
//                       imageUrl: widget.vehicle?.vehicleImages?.isNotEmpty == true
//                           ? widget.vehicle?.vehicleImages![0].imagePath ?? ''
//                           : '',
//                       defaultAssetImage: defaultImageUrl,
//                     ),
//                     const SizedBox(width: 40),
//                     Flexible(  // Use Flexible instead of Expanded
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               SmallText(text: 'Brand:', fontWeight: FontWeight.bold, size: 13),
//                               const SizedBox(width: 5),
//                               SmallText(text: widget.vehicle?.brand?.vehicleBrandName ?? "Unknown", fontWeight: FontWeight.bold, size: 13),
//                             ],
//                           ),
//                           const SizedBox(height: 2),
//                           Row(
//                             children: [
//                               SmallText(text: 'Model:', fontWeight: FontWeight.bold, size: 13),
//                               const SizedBox(width: 5),
//                               SmallText(text: widget.vehicle?.model?.vehicleModelName ?? "Unknown", fontWeight: FontWeight.bold, size: 13),
//                             ],
//                           ),
//                           const SizedBox(height: 2),
//                           Row(
//                             children: [
//                               SmallText(text: 'Category:', fontWeight: FontWeight.bold, size: 13),
//                               const SizedBox(width: 5),
//                               SmallText(text: widget.vehicle?.category?.vehicleCategoryName ?? "Unknown", fontWeight: FontWeight.bold, size: 13),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             // Rental Dates Section
//             TCircularContainer(
//               border: Border.all(color: Colors.grey),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   ListTile(
//                     title: Text(
//                       'Start Date: ${startDate != null ? startDate.toString() : 'Select Date'}',
//                       style: const TextStyle(fontSize: 15),
//                     ),
//                     onTap: () async {
//                       DateTime? picked = await showDatePicker(
//                         context: context,
//                         initialDate: DateTime.now(),
//                         firstDate: DateTime.now(),
//                         lastDate: DateTime(2101),
//                       );
//                       if (picked != null) {
//                         setState(() {
//                           startDate = picked;
//
//                         });
//                       }
//                     },
//                   ),
//                   ListTile(
//                     title: Text(
//                       'End Date: ${endDate != null ? endDate.toString() : 'Select Date'}',
//                       style: const TextStyle(fontSize: 15),
//                     ),
//                     onTap: () async {
//                       DateTime? picked = await showDatePicker(
//                         context: context,
//                         initialDate: DateTime.now(),
//                         firstDate: DateTime.now(),
//                         lastDate: DateTime(2101),
//                       );
//                       if (picked != null) {
//                         setState(() {
//                           endDate = picked;
//
//                         });
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             TextFormField(
//               controller: addressController,
//               decoration: const InputDecoration(
//                 labelText: 'Address',
//                 prefixIcon: Icon(Icons.location_on),
//               ),
//             ),
//             const SizedBox(height: 20),
//             TextFormField(
//               controller: billingAddressController,
//               decoration: const InputDecoration(
//                 labelText: 'Billing Address',
//                 prefixIcon: Icon(Icons.location_on),
//               ),
//             ),
//             const SizedBox(height: 20),
//             TextFormField(
//               controller: phoneNumberController,
//               decoration: const InputDecoration(
//                 labelText: 'Phone Number',
//                 prefixIcon: Icon(Icons.phone),
//               ),
//             ),
//             const SizedBox(height: 20),
//             TCircularContainer(
//               border: Border.all(color: Colors.grey),
//               child: SizedBox(
//                 height: 100,
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     TCircularContainer(
//                       onTap: () {
//                         openImages();
//                       },
//                       border: Border.all(color: Colors.grey),
//                       height: 100,
//                       width: 100,
//                       child: SizedBox(
//                         height: 20,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             const Icon(Icons.camera_alt),
//                             const SizedBox(height: 5),
//                             BigText(
//                               text: 'Upload',
//                               size: 15,
//                               color: Colors.black,
//                               fontWeight: FontWeight.w800,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 5),
//                     Expanded(
//                       child: TCircularContainer(
//                         padding: 8.0,
//                         child: imagefiles != null && imagefiles!.isNotEmpty
//                             ? GridView.builder(
//                           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 3,
//                             crossAxisSpacing: 5.0,
//                             mainAxisSpacing: 5.0,
//                           ),
//                           itemCount: imagefiles!.length,
//                           itemBuilder: (context, index) {
//                             File imageFile = File(imagefiles![index].path);
//                             return Image.file(imageFile, fit: BoxFit.cover);
//                           },
//                         )
//                             : const Center(
//                           child: Text("Upload Driving License"),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             TCircularContainer(
//               border:  Border.all(color: Colors.grey),// Wrap the Row in a Container to ensure proper layout
//               padding: 8,
//
//               child:
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SmallText(text: 'Insurance Required:',fontWeight: FontWeight.w600,size: 13,),
//                   Obx(
//                         () => Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//
//                         Expanded(
//                           child: RadioListTile<bool>(
//                             title: SmallText(
//                                 text: 'Yes',
//                                 textColor: TColors.darkerGrey,
//                                 fontWeight: FontWeight.w600),
//                             value: true,
//                             groupValue:insuranceController.selectedInsuranceType.value,
//                             onChanged: (value) {
//                               insuranceController.setInsuranceType(value!);
//                             },
//                           ),
//                         ),
//                         Expanded(
//                           child: RadioListTile<bool>(
//                             title: SmallText(
//                                 text: 'NO',
//                                 textColor: TColors.darkerGrey,
//                                 fontWeight: FontWeight.w600),
//                             value: false,
//                             groupValue: insuranceController.selectedInsuranceType.value,
//                             onChanged: (value) {
//                               insuranceController.setInsuranceType(value!);
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             SizedBox(height: 20,),
//             TextFormField(
//               controller: specialRequestController,
//               maxLines: 2,
//               decoration: InputDecoration(
//                 labelText: 'Special Request',
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 hintText: 'Any Request',
//                 labelStyle: TextStyle(
//                   color: TColors.darkerGrey,
//                 ),
//                 hintStyle: TextStyle(
//                   color: TColors.darkerGrey,
//                   fontSize: 10,
//                 ),
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12.0),
//                     borderSide: BorderSide(color: TColors.darkerGrey)),
//               ),
//             ),
//
//             SizedBox(height: 40),
//             CustomButton(
//               width: 400,
//               text: "Update",
//               onTap: () => {
//                 print('Button is press'),
//                 _onUpdateBooking(),
//               },
//             ),
//
//
//           ],
//         ),
//       ),
//     );
//   }
//
//
// }
