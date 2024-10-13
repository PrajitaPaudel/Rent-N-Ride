import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../utils/constants/image_strings.dart';


class CategoryController extends GetxController {
  // Observable list of category images and titles
  var categoryImages = [
    TImages.bike,
    TImages.car,
    TImages.bike1,
    TImages.bus,
    TImages.scooter,
    TImages.travel,
  ].obs; // Make it observable to update the UI reactively

  // var categories = <CategoryModel>[].obs;

  var categoryTitles = [
    'Bike',
    'Scorpio',
    'Cycle',
    'Bus',
    'Scooter',
    'Car',
  ].obs;





}
