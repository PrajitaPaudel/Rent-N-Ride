import 'package:flutter/material.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/card/vehicle_detailed_widget.dart';


import '../../../model/user/popular_model.dart';
import '../../../utils/constants/colors.dart';
import '../../common widget/appbar/header_curveappbar.dart';
import '../../common widget/container/circular_container.dart';
import '../../common widget/image/t_rounded_images.dart';

class VehicleDetailedPage extends StatelessWidget {
  final Vehicle? vehicle;
  const VehicleDetailedPage({super.key,  this.vehicle});


  @override
  Widget build(BuildContext context) {
    String defaultImageUrl = "assets/logos/logo-white.png";

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            THeaderAppBar(text: "ALL Vehicle",),


    Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    children: [
    TCircularContainer(
    padding: 20,
    border: Border.all(color: TColors.grey),
    backgroundColor: Colors.blueGrey.shade50 ,
    child:Stack(
      children: [

        SizedBox(
          height: 250,
          child: PageView.builder(
            itemCount: vehicle?.vehicleImages?.length ?? 1,
            itemBuilder: (context, index) {
              final imageUrl = vehicle?.vehicleImages != null
                  ? vehicle?.vehicleImages![index].imagePath ?? defaultImageUrl
                  : "assets/logos/logo-white.png";

              return Padding(
                padding: EdgeInsets.all(10),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {

                    return Image.asset(
                      defaultImageUrl,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              );
            },
          ),
        ),

      ],
    ),
    ),
      Divider(thickness: 1,),
    SizedBox(height: 1,),


      TVehicleMetaData(

          productName: vehicle?.model!.vehicleModelName??"",
          brand: vehicle?.brand!.vehicleBrandName??"",
          imageUrl: (vehicle?.vehicleImages?.isNotEmpty == true
              ? vehicle?.vehicleImages!.first.imagePath
              : null) ??
              defaultImageUrl,
          price: vehicle?.price.toString()??"",
          status: vehicle?.popular == true ? "Popular" : "Standard",
          category: vehicle?.category!.vehicleCategoryName??"",
          damages: vehicle?.damage.toString()??"",
          description: vehicle?.detail.toString()??"",
        available: vehicle?.available == true ? "Available" : "unAvailable",
        userId: vehicle?.userId??"",
      ),

          ],
        ),
    ),
          ],)
      ),
    );
  }
}
