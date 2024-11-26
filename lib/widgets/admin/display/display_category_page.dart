import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vehicle_rental_frontendui/widgets/admin/add/add_new_category.dart';
import 'package:vehicle_rental_frontendui/widgets/admin/edit/edit_category_page.dart';
import 'package:vehicle_rental_frontendui/widgets/admin/widget/category_card_widget.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/appbar/header_curveappbar.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/container/curved_widget.dart';

import '../../../controller/dealer_controller/c_dropdown_controller.dart';
import '../../common widget/layout/grid_layout.dart';
import '../../common widget/layout/row_grid_layot.dart';

class AdminDisplayCategory extends StatelessWidget {
  AdminDisplayCategory({super.key});
  final VCategoryController vCategoryController = Get.put(
      VCategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TCurvedWidget(
              child: SizedBox(
                height: 150,
                child: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.blueGrey.shade700,
                  title: Text(
                    'Category',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'poppins',
                      fontSize: 22,
                    ),
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.add, color: Colors.white),
                      onPressed: () {
                        Get.to(()=>AddCategory());
                        // Add your category adding logic here
                        print('Add Category Pressed');
                      },
                    ),
                  ],
                ),
              )

            ),



            Obx(() {
              if (vCategoryController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else if (vCategoryController.categories.isEmpty) {
                return Center(child: Text('No Data Available'));
              } else {
                return TVerticalRowLayout(
                  itemCount: vCategoryController.categories.length,
                  itemBuilder: (_, index) {
                    var category = vCategoryController.categories[index];

                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0,left: 10,right: 10,bottom: 10),
                      child: THCard(
                        title: category.vehicleCategoryName,
                        color: Colors.blueGrey.shade50,
                        edit: () {
                         Get.to(()=>EditCategory(categoryId: category.categoryId,));
                        },
                        delete: (){
                          vCategoryController.deleteCategory( category.categoryId);
                        },
                      ),
                    );
                  },
                );
              }
            }),




          ],
        ),
      ),
    );
  }
}




