import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_frontendui/controller/dealer_controller/brand_controller.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/appbar/header_curveappbar.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/show_custom_snakebar.dart';

import '../../../controller/dealer_controller/c_dropdown_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../common widget/button/Custom_button.dart';
import '../../common widget/text/big_text.dart';
import '../../common widget/text/small_text.dart';






class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final  VCategoryController categoryController=Get.put(VCategoryController());

  final TextEditingController _categoryNameController = TextEditingController();


  Future<void> _submit() async {
    final categoryName = _categoryNameController.text;


    if (categoryName.isEmpty ) {

      showCustomSnakeBar("Please enter valid data.",color: TColors.warning,title: 'Form');
      return;
    }
    await categoryController.addVehicleCategory(categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          THeaderAppBar(text: "Add Category",backgroundColor: Colors.blueGrey.shade800,),
          Column(
              children: [
                BigText(
                  text: 'Add New Category',
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
                  controller: _categoryNameController,
                  decoration: InputDecoration(labelText: "Category Name"),
                ),

                SizedBox(height: 40,),
                CustomButton(
                  color: TColors.blueGery,

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
