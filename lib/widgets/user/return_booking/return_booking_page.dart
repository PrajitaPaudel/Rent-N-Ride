
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/appbar/header_curveappbar.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/button/Custom_button.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/container/circular_container.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/big_text.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/small_text.dart';

import '../../../controller/dealer_controller/damage_dropdown_controller.dart';
import '../../../controller/user_controller/return_booking_controller.dart';
import '../../../utils/constants/colors.dart';




class ReturnPage extends StatefulWidget {
  final int bookingId;
  const ReturnPage({super.key, required this.bookingId});


  @override
  _ReturnPageState createState() => _ReturnPageState();

}

class _ReturnPageState extends State<ReturnPage> {
  final ReturnController _returnController = ReturnController();
  final VDamageController vDamageController = Get.put(VDamageController());
  DateTime returnDate=DateTime.now();
  int selectedRating = 1;
  String returnLocation = '';



  Widget buildStarRating() {
    return TCircularContainer(
      height: 200,
      padding: 12,
      border: Border.all(color: Colors.grey),
      backgroundColor: Colors.blueGrey.shade50,

      child: Column(
        children: [
          BigText(text: 'Rating...🤍! ',fontWeight: FontWeight.w700,size: 22,color: Colors.grey.shade600,),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return IconButton(
                onPressed: () {
                  setState(() {
                    selectedRating = index + 1; // Set rating based on star clicked
                  });
                },
                icon: Icon(
                  Icons.star,
                  color: index < selectedRating ? Colors.orange : Colors.grey,
                ),
                iconSize: 54.0,
              );
            }),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.lightGrey,

      body: SingleChildScrollView(

        child: Column(
          children: [
            THeaderAppBar(text: 'Return Vehicle',backgroundColor:  Colors.blueGrey.shade300),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      SmallText(text: 'Please fill the form to return...!',textColor: Colors.grey.shade500,size: 17,fontWeight: FontWeight.bold,)
                    ],
                  ),
                  SizedBox(height: 30,),

                  TCircularContainer(
                    height: 70,
                    border: Border.all(color: Colors.grey),
                    backgroundColor: Colors.blueGrey.shade50,

                    child: ListTile(
                      title: Text(
                        'ReturnDate: ${returnDate!= null ? returnDate.toString() : 'Select Date'}',
                        style: const TextStyle(fontSize: 16),
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
                            returnDate = picked;

                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 20,),
                  TCircularContainer(

                    backgroundColor:Colors.blueGrey.shade50 ,
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Return Location',
                      fillColor:Colors.blueGrey.shade50,
                      filled: true),

                      onChanged: (value) {
                        returnLocation = value;
                      },
                    ),
                  ),
                   SizedBox(height: 22,),
                  Obx(() {
                    return DropdownButtonFormField<String>(
                      isExpanded: true,
                      value: vDamageController.selectedDamage.value.isEmpty
                          ? null
                          : VDamageController().selectedDamage.value,
                      decoration:  InputDecoration(
                        fillColor:Colors.blueGrey.shade50 ,
                        filled: true,
                        labelText: "Select Damages",
                        labelStyle: TextStyle(
                          color: TColors.darkerGrey,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          vDamageController.setSelectedDamage(newValue);
                        }
                      },
                      items: vDamageController.damage
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    );
                  }),
                  SizedBox(height: 20,),
                  buildStarRating(),
                  SizedBox(height: 20,),
                  CustomButton(
                    onTap: () {
                      _returnController.submitReturn(
                        bookingId:widget.bookingId,  // Pass the bookingId directly
                        returnDate:  returnDate,
                        returnLocation: returnLocation,
                        rating: selectedRating,
                        damageReported: vDamageController.selectedDamage.value,
                      );
                    },
                    text: 'Submit Return',
                    width: 410,

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

