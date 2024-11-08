import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../utils/constants/image_strings.dart';


class CategoryController extends GetxController {
  // Observable list of category images and titles
  var categoryImages = [
    TImages.bike,
    TImages.scooter,
    TImages.cycle,
    TImages.car,
    TImages.jeep,
    TImages.Scorpio,
    TImages.sumo,
    TImages.bus,
    TImages.microBus,
    TImages.miniVan,
    TImages.tempo,
    TImages.truck,
    TImages.van,


  ].obs; // Make it observable to update the UI reactively

  // var categories = <CategoryModel>[].obs;

  var categoryTitles = [
    'Bike',
    'Scooter',
    'Cycle',
    'Car',
    'jeep',
    'Scorpio',
    'Sumo',
    'Bus',
    'MicroBus',
    'MiniVan',
    'Auto',
    'Truck',
    'Van'
  ].obs;





}
