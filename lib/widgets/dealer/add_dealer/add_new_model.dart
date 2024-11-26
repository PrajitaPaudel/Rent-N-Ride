import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_frontendui/controller/dealer_controller/brand_controller.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/appbar/header_curveappbar.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/show_custom_snakebar.dart';

import '../../../controller/dealer_controller/c_dropdown_controller.dart';
import '../../../controller/dealer_controller/vehicle_model_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../common widget/button/Custom_button.dart';
import '../../common widget/text/big_text.dart';
import '../../common widget/text/small_text.dart';



class DAddModel extends StatefulWidget {
  const DAddModel({super.key});

  @override
  State<DAddModel> createState() => _AddModelState();
}

class _AddModelState extends State<DAddModel> {
  final  VehicleModelController modelController=Get.put(VehicleModelController());

  final TextEditingController _modelNameController = TextEditingController();


  Future<void> _submit() async {
    final modelName = _modelNameController.text;


    if (modelName.isEmpty ) {

      showCustomSnakeBar("Please enter valid data.",color: TColors.warning,title: 'Form');
      return;
    }
    await modelController.addVehicleModel(modelName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          THeaderAppBar(text: "Add Model",),
          Column(
              children: [
                BigText(
                  text: 'Add New Model',
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
                  controller: _modelNameController,
                  decoration: InputDecoration(labelText: "Model Name"),
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
