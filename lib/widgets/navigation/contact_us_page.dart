import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vehicle_rental_frontendui/utils/constants/image_strings.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/appbar/header_curveappbar.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/card/product_card_horizontal.dart';

import 'package:flutter/material.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/container/circular_container.dart';
import 'package:vehicle_rental_frontendui/widgets/common%20widget/text/big_text.dart';

import '../../utils/constants/colors.dart';

class ContactUsPage extends StatelessWidget {
  final String facebookUrl = 'https://www.facebook.com/prajita.paudel.39';
  final String instagramUrl = 'https://flutter.dev';

  void _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: SingleChildScrollView(

        child: Column(
          children: [
            THeaderAppBar(text: 'Contact Us'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: BigText(text:
                      'Get in Touch',
                           size: 24.0,
                        fontWeight: FontWeight.bold,
                      color: Colors.grey.shade500,
                      ),
                    ),
        
                  SizedBox(height: 30),
                   TCircularContainer(
                     height: 190,
                    backgroundColor:Colors.blueGrey.shade50,
                    padding: 20,
                    margin: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email: support@vehiclerental.com",
                          style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w500),
        
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Phone: +123-456-7890",
                          style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Address: 123 Main Street, City, Country",
                          style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
        
                  SizedBox(height: 20),
                  Center(
                    child: BigText(text:
                    'Business Hours',
                      size: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  SizedBox(height: 30),
                  TCircularContainer(
                    height: 170,
                    width: 400,
                    backgroundColor:Colors.blueGrey.shade50,
                    padding: 20,
                    margin: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        SizedBox(height: 15,),
                        Text(
                          "Monday - Friday: 9 AM - 6 PM\nSaturday: 10 AM - 4 PM\nSunday: Closed",
                          style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: Text(
                      'Follow Us on Social Media',
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade700
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.facebook),
                        onPressed: () => _launchUrl(facebookUrl),
                      ),
                      IconButton(
                        icon: Icon(Iconsax.instagram),
                        onPressed: () => _launchUrl(instagramUrl),
                      ),
                      IconButton(
                        icon: Icon(Icons.discord ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

