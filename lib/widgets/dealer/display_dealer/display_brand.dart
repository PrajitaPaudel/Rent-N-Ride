import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vehicle_rental_frontendui/model/dealer/brand_model.dart';
import 'package:vehicle_rental_frontendui/widgets/admin/edit/edit_brand_page.dart';
import 'package:vehicle_rental_frontendui/widgets/admin/widget/category_card_widget.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/appbar/header_curveappbar.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/container/curved_widget.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/small_text.dart';
import 'package:vehicle_rental_frontendui/widgets/dealer/vehicle_register/add_brand_page.dart';

import '../../../controller/dealer_controller/brand_controller.dart';
import '../../../controller/dealer_controller/vehicle_model_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../admin/add/add_new_brand-page.dart';
import '../../common widget/layout/row_grid_layot.dart';
import '../add_dealer/add_new_brand-page.dart';
import '../edit_dealer/edit_brand_page.dart';



class DealerDisplayBrand extends StatelessWidget {
  DealerDisplayBrand({super.key});
  final BrandController brandController = Get.put(BrandController());

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
                    backgroundColor: TColors.subPrimary,
                    title: Text(
                      'Brand',
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
                        icon: Icon(Icons.add, color: Colors.white,size: 20,),
                        onPressed: () {
                          Get.to(()=>DAddBrand());
                          print('Add Category Pressed');
                        },
                      ),
                    ],
                  ),
                )

            ),




            Obx(() {
              if (brandController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else if (brandController.brands.isEmpty) {
                return Center(child: Text('No Data Available'));
              } else {
                return TVerticalRowLayout(
                  itemCount: brandController.brands.length,
                  itemBuilder: (_, index) {
                    var brand = brandController.brands[index];

                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0,left: 10,right: 10,bottom: 10),
                      child: THCard(
                        title: brand.vehicleBrandName,
                        color: Colors.blueGrey.shade50,
                        child: SmallText(text: brand.rentalCharge.toString(),fontWeight: FontWeight.bold,size: 16,),
                        edit: () {
                          Get.to(()=>DEditBrand( brandId:brand.brandId,));
                        },
                        delete: (){
                          brandController.deleteBrand( brand.brandId,);
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




