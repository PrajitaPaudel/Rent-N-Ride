// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:vehicle_rental_frontendui/widgets/common%20widget/button/Custom_button.dart';
// import 'package:vehicle_rental_frontendui/widgets/common%20widget/container/circular_container.dart';
// import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/big_text.dart';
// import 'package:vehicle_rental_frontendui/widgets/user/user_dasboard.dart';
//
// import '../../../utils/constants/colors.dart';
// import 'order_page.dart';
//
//
// class OrderDetailPage extends StatelessWidget {
//   // final OrderModel order;
//
//   // OrderDetailPage({required this.order});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: BigText(text: 'Order Details',fontWeight:FontWeight.w700,),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 70.0,bottom: 16,right: 16,left: 16),
//         child: Column(
//
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TCircularContainer(
//               backgroundColor: TColors.lightGrey,
//               border: Border.all(color: Colors.grey.shade700),
//               padding: 19,
//               child: Column(
//                 children: [
//                   Text(
//                     'Order Summary',
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.grey.shade700),
//                   ),
//                   SizedBox(height: 30),
//
//                   // Displaying Vehicle ID
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Vehicle ID: ${order.vehicleId}',
//                         style: TextStyle(fontSize: 18,color: Colors.grey.shade600),
//                       ),
//                       SizedBox(height: 10),
//
//                       // Displaying User ID
//                       Text(
//                         'User ID: ${order.userId}',
//                         style: TextStyle(fontSize: 18,color: Colors.grey.shade600),
//                       ),
//                       SizedBox(height: 10),
//
//                       // Display Rental Start Date
//                       Text(
//                         'Start Date: ${order.startDate}',
//                         style: TextStyle(fontSize: 18,color: Colors.grey.shade600),
//                       ),
//                       SizedBox(height: 10),
//
//                       // Display Rental End Date
//                       Text(
//                         'End Date: ${order.endDate}',
//                         style: TextStyle(fontSize: 18,color: Colors.grey.shade600),
//                       ),
//                       SizedBox(height: 10),
//
//                       // Display Total Cost
//                       Text(
//                         'Total Cost: \$${order.totalCost.toStringAsFixed(2)}',
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.grey.shade600),
//                       ),
//                       SizedBox(height: 20),
//
//                       // Display Payment Method (if available)
//                       Text(
//                         'Payment Method: ${order.paymentMethod}', // Assuming the user used a credit card
//                         style: TextStyle(fontSize: 18,color: Colors.grey.shade600,fontWeight: FontWeight.w600),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 40),
//
//             // Button to Go Back to Home or Make a New Order
//             Center(
//               child: CustomButton(
//                 width: 400,
//                 height: 50,
//                 onTap: () {
//                   Get.to(()=>UserDashboardPage());
//                 },
//                  text: 'Back to Dashboard',
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
