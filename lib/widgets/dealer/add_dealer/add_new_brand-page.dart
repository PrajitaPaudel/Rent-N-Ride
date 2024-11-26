import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_frontendui/controller/dealer_controller/brand_controller.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/appbar/header_curveappbar.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/show_custom_snakebar.dart';

import '../../../utils/constants/colors.dart';
import '../../common widget/button/Custom_button.dart';
import '../../common widget/text/big_text.dart';
import '../../common widget/text/small_text.dart';

class DAddBrand extends StatefulWidget {
  const DAddBrand({super.key});

  @override
  State<DAddBrand> createState() => _AddBrandState();
}

class _AddBrandState extends State<DAddBrand> {
  final  BrandController brandController=Get.put(BrandController());

  final TextEditingController _brandNameController = TextEditingController();
  final TextEditingController _rentalChargeController = TextEditingController();

  Future<void> _submit() async {
    final brandName = _brandNameController.text;
    final rentalCharge = double.tryParse(_rentalChargeController.text);

    if (brandName.isEmpty || rentalCharge == null) {

      showCustomSnakeBar("Please enter valid data.",color: TColors.warning,title: 'Form');
      return;
    }
      await brandController.addVehicleBrand(brandName, rentalCharge);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          THeaderAppBar(text: "Add Brand",),
      Column(
              children: [
                BigText(
                  text: 'Add New Brand',
                  size: 21,
                  fontWeight: FontWeight.w800,
                  color: TColors.darkGrey,
                ),
                SizedBox(height: 8),
                SmallText(
                  text: 'You are required to fill information correctly',
                  textColor: TColors.darkGrey,
                ),
                ]
      ),
                SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _brandNameController,
                  decoration: InputDecoration(labelText: "Brand Name"),
                ),


          SizedBox(height: 12,),
          TextField(
            controller: _rentalChargeController,
            decoration: InputDecoration(labelText: "Rental Charge"),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          SizedBox(height: 40,),
          CustomButton(
            color:Colors.teal.shade300,

            width: 400,
            text: "Add",
            onTap: () => {
              _submit(),
            },
          ),
    ],),
          ),
        ],
      ),
    );
  }
}
