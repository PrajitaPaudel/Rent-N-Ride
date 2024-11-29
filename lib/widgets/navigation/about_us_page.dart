import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:vehicle_rental_frontendui/utils/constants/colors.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/appbar/header_curveappbar.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/container/circular_container.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(

          children: [
            THeaderAppBar(text: 'About Us'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome!!  ',
                            style: TextStyle(
                              fontSize: 33.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade500
                            ),

                            textAlign: TextAlign.center,
                          ),
                       SizedBox(height: 10,),
                          SizedBox(

                            width: 800,
                            child: Text(
                              ' to  Rental N\' Ride',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade500
                              ),

                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    Text(
                      "Our Mission",
                      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600,color: TColors.blueGery),
                    ),
                    SizedBox(height: 10),
                    TCircularContainer(
                      padding: 20,
                      child: Text(
                        "To provide a secure, transparent, and seamless platform for renting vehicles, ensuring convenience and trust for our customers.",
                        style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Why Choose Us?",
                      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600,color: TColors.blueGery),
                    ),
                    SizedBox(height: 10),
                    TCircularContainer(
                      padding: 20,
                      child: Text(
                        "1. A wide range of vehicles.\n"
                            "2. Secure booking and transparent pricing.\n"
                            "3. 24/7 customer support.\n"
                            "4. User-friendly interface for an effortless experience.",
                        style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Image.asset(
                        'assets/logos/logo-white.png', // Replace with your logo
                        height: 150,
                      ),
                    ),
                    SizedBox(height: 20),
                    TCircularContainer(
                      padding: 20,
                      child: Text(
                        "Founded in 2024, we are committed to redefining vehicle rentals with innovation and customer-centric services.",
                        style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
