import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../service/dealer/image_service.dart';


class UploaderController extends GetxController {

  final ImageService _imageService = ImageService();
  final ImagePicker _picker = ImagePicker();

  var imageOne = Rxn<File>();
  // var imageTwo = Rxn<File>();
  // var imageThree = Rxn<File>();
  // var imageFour = Rxn<File>();

  // Method to pick images
  Future<void> pickImage(String type) async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      if (type == 'one') {
        imageOne.value = File(pickedImage.path);

        // } else if (type == 'two') {
        //   imageTwo.value = File(pickedImage.path);
        // } else if (type == 'three') {
        //   imageThree.value = File(pickedImage.path);
        // } else if (type == 'four') {
        //   imageFour.value = File(pickedImage.path);
        // }
      }
    }


//   // Upload images using the new ImageService
//   Future<void> uploadImagesToBackend() async {
//     if (imageOne.value != null) {
//       String? result = await _imageService.uploadImage(imageOne.value!, 'one');
//       if (result != null) {
//         print('Image One: $result');
//       } else {
//         print('Failed to upload Image One');
//       }
//     }
//
//     if (imageTwo.value != null) {
//       String? result = await _imageService.uploadImage(imageTwo.value!, 'two');
//       if (result != null) {
//         print('Image Two: $result');
//       } else {
//         print('Failed to upload Image Two');
//       }
//     }
//
//     if (imageThree.value != null) {
//       String? result = await _imageService.uploadImage(imageThree.value!, 'three');
//       if (result != null) {
//         print('Image Three: $result');
//       } else {
//         print('Failed to upload Image Three');
//       }
//     }
//
//     if (imageFour.value != null) {
//       String? result = await _imageService.uploadImage(imageFour.value!, 'four');
//       if (result != null) {
//         print('Image Four: $result');
//       } else {
//         print('Failed to upload Image Four');
//       }
//     }
  }
 }
