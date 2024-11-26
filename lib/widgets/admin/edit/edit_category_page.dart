import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_frontendui/controller/dealer_controller/brand_controller.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/appbar/header_curveappbar.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/show_custom_snakebar.dart';

import '../../../controller/dealer_controller/c_dropdown_controller.dart';
import '../../../model/dealer/category_model.dart';
import '../../../utils/constants/colors.dart';
import '../../common widget/button/Custom_button.dart';
import '../../common widget/text/big_text.dart';
import '../../common widget/text/small_text.dart';






class EditCategory extends StatefulWidget {
  final VehicleCategoryModel? category;
final int? categoryId;
  const EditCategory({super.key, this.categoryId, this.category,});

  @override
  State<EditCategory> createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {
  final  VCategoryController categoryController=Get.put(VCategoryController());

  final TextEditingController _categoryNameController = TextEditingController();
  void initState() {
    super.initState();

    // Load brand details after the initial frame to avoid build conflicts
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _loadBrandData();
    });
  }

  Future<void> _loadBrandData() async {
    if (widget.categoryId != null) {
      await categoryController.loadBrandDetails(widget.categoryId!);

      // Populate text fields if the data is loaded successfully
      if (categoryController.currentBrand.value != null) {
        _categoryNameController.text = categoryController.currentBrand.value?.vehicleCategoryName ?? '';
      }
    }
  }


  Future<void> _submit() async {
    final categoryName = _categoryNameController.text;


    if (categoryName.isEmpty ) {

      showCustomSnakeBar("Please enter valid data.",color: TColors.warning,title: 'Form');
      return;
    }
    await categoryController.updateVehicleCategory(widget.categoryId,categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          THeaderAppBar(text: "Edit Category",backgroundColor: Colors.blueGrey.shade800,),
          Column(
              children: [
                BigText(
                  text: 'Edit New Category',
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
