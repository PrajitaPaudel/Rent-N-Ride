import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_frontendui/controller/dealer_controller/brand_controller.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/appbar/header_curveappbar.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/show_custom_snakebar.dart';

import '../../../../utils/constants/colors.dart';

import '../../../model/dealer/brand_model.dart';
import '../../common widget/button/Custom_button.dart';
import '../../common widget/text/big_text.dart';
import '../../common widget/text/small_text.dart';

class EditBrand extends StatefulWidget {
  final VehicleBrandModel? brandModel;
  final int? brandId;

  const EditBrand({super.key, this.brandModel,  this.brandId});

  @override
  State<EditBrand> createState() => _EditBrandState();
}

class _EditBrandState extends State<EditBrand> {
  late String brandName;
  late double rentalCharge ;
  final  BrandController brandController=Get.put(BrandController());

  final TextEditingController _brandNameController = TextEditingController();
  final TextEditingController _rentalChargeController = TextEditingController();

  void initState() {
    super.initState();

    // Load brand details after the initial frame to avoid build conflicts
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _loadBrandData();
    });
  }

  Future<void> _loadBrandData() async {
    if (widget.brandId != null) {
      await brandController.loadBrandDetails(widget.brandId!);

      // Populate text fields if the data is loaded successfully
      if (brandController.currentBrand.value != null) {
        _brandNameController.text = brandController.currentBrand.value?.vehicleBrandName ?? '';
        _rentalChargeController.text = brandController.currentBrand.value?.rentalCharge.toString() ?? '';
      }
    }
  }

  Future<void> _submit() async {
    final brandName = _brandNameController.text;
    final rentalCharge = double.tryParse(_rentalChargeController.text);

    if (brandName.isEmpty || rentalCharge == null) {

      showCustomSnakeBar("Please enter valid data.",color: TColors.warning,title: 'Form');
      return;
    }
    await brandController.updateVehicleBrand(widget.brandId??0, brandName, rentalCharge);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          THeaderAppBar(text: "Edit Brand",backgroundColor: Colors.blueGrey.shade800,),
          Column(
              children: [
                BigText(
                  text: 'Edit New Brand',
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
                  color: TColors.blueGery,

                  width: 400,
                  text: "Update",
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
