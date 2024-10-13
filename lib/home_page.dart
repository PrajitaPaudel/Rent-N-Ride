import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vehicle_rental_frontendui/utils/constants/colors.dart';
import 'package:vehicle_rental_frontendui/utils/constants/text_strings.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/button/Custom_button.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/big_text.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/appbar/custom_app_bar.dart';
import 'package:vehicle_rental_frontendui/widgets/categories/slider_catogories.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/small_text.dart';
import 'package:vehicle_rental_frontendui/widgets/homepage/banner_slider.dart';
import 'package:vehicle_rental_frontendui/widgets/homepage/search_page.dart';
import 'package:vehicle_rental_frontendui/widgets/login/login_page.dart';
import 'package:vehicle_rental_frontendui/widgets/signup/register_page.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header part.......................................................//

            TAppBar(
              backgroundColor: Colors.white,
              textColor: TColors.subPrimary,
              customIcon: GestureDetector(
                onTap: () {
                  Get.to(() => SearchPage());
                },
                child: Container(
                  width: 45,
                  height: 45,
                  child: Icon(Icons.search, color: Colors.white),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.teal.shade300,
                  ),
                ),
              ),
            ),
        
            // Slider banners.......................................................//
            const BannerSlider(),
             const SizedBox(height:10),
             // login_button.................................//
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 CustomButton(
                   onTap: ()=>Get.to(()=>LoginPage()),
                   text:"Login",
                   color: TColors.subPrimary,
                   borderRadius:50,
                   width: 125,



                 ),
                 CustomButton(
                   
                   onTap: ()=>Get.to(()=>Register()),
              text:"Register",
              color: TColors.subPrimary,
                         borderRadius:50,
                   width: 125,


                       )
               ],
             ),
            const SizedBox(height:30),

            //welcome text........................................//
            Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                   width:600,
                  margin:EdgeInsets.all(30),

                  decoration: BoxDecoration(
                    color: TColors.grey,
                    borderRadius:BorderRadius.circular(40.0),
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BigText(text:TTexts.homeWelcomeTitle,
                          size:20,
                          fontWeight: FontWeight.w600,

                        ),
                        Padding(

                          padding: const EdgeInsets.all(8.0),
                          child: SmallText(text:TTexts.homeWelcomeDes,
                          textColor: TColors.textSecondary,
                            size: 13,
                            textAlign: TextAlign.justify,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),

                ),
              ],
            ),
            // const SizedBox(height:30),
            //slider categories.................................//
            Align(
              alignment: Alignment.centerLeft,

              child: BigText(text: "Popular  Catogories",
                fontWeight: FontWeight.w600,
                size:18,

                textAlign: TextAlign.left,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              ),
            ),
            const SizedBox(height:20),
            SliderCatogories(),
            const SizedBox(height:20),

        
          ],
        ),
      ),

    ) ;
  }
}

