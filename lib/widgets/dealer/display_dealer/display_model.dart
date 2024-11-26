import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vehicle_rental_frontendui/widgets/admin/add/add_new_model.dart';
import 'package:vehicle_rental_frontendui/widgets/admin/widget/category_card_widget.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/appbar/header_curveappbar.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/container/curved_widget.dart';

import '../../../controller/dealer_controller/vehicle_model_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../admin/edit/edit_model_page.dart';
import '../../common widget/layout/row_grid_layot.dart';
import '../add_dealer/add_new_model.dart';
import '../edit_dealer/edit_model_page.dart';



class DealerDisplayModel extends StatelessWidget {
  DealerDisplayModel({super.key});
  final VehicleModelController modelController = Get.put(VehicleModelController());

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
                      'Model',
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
                          Get.to(()=>DAddModel());
                          // Add your category adding logic here
                          print('Add Category Pressed');
                        },
                      ),
                    ],
                  ),
                )

            ),



            Obx(() {
              if (modelController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else if (modelController.models.isEmpty) {
                return Center(child: Text('No Data Available'));
              } else {
                return TVerticalRowLayout(
                  itemCount: modelController.models.length,
                  itemBuilder: (_, index) {
                    var model = modelController.models[index];

                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0,left: 10,right: 10,bottom: 10),
                      child: THCard(
                        title: model.vehicleModelName,
                        color: Colors.blueGrey.shade50,
                        edit: () {
                          Get.to(()=>DEditModel(modelId: model.modelId,));
                        },
                        delete: (){

                          modelController.deleteModel( model.modelId,);
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




