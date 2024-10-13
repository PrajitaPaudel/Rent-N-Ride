import 'package:get/get.dart';

class SliderController extends GetxController {
  static SliderController get instance =>Get.find();

  final carousalCurrentIndex= 0.obs;


  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }


}
