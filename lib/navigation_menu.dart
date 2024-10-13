import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_frontendui/home_page.dart';
import 'package:vehicle_rental_frontendui/widgets/navigation/about_us_page.dart';
import 'package:vehicle_rental_frontendui/widgets/navigation/vehicle_gallery_page.dart';
import 'package:vehicle_rental_frontendui/widgets/navigation/contact_us_page.dart';
import 'package:vehicle_rental_frontendui/widgets/navigation/profile_page.dart';

class NavigationMenu extends StatelessWidget {

  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(NavigationController());



    return  Scaffold(
      bottomNavigationBar: Obx(
            ()=>  NavigationBar(
          height: 80,
          elevation:0,


          indicatorColor:const Color(0xFF7dd5c8) ,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index)=>controller.selectedIndex.value=index,
          destinations: const [
            NavigationDestination(icon:Icon(Icons.home) , label: 'Home'),
            NavigationDestination(icon:Icon(Icons.category) , label: 'Gallery'),
            NavigationDestination(icon:Icon(Icons.phone) , label: 'Contact Us'),
            NavigationDestination(icon:Icon(Icons.person_pin_circle_outlined) , label: 'About Us'),
            NavigationDestination(icon:Icon(Icons.person) , label: 'Profile'),
        
          ],
        ),
      ),
      body:Obx(()=>controller.screens[controller.selectedIndex.value]),
    );
  }
}



class NavigationController extends GetxController{
  final Rx<int> selectedIndex= 0.obs;
  final screens=[HomePage(),VehicleGallery(),ContactUs(),AboutUs(),Profile()];

}