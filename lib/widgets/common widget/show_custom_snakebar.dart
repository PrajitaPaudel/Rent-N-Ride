import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'text/big_text.dart';

void showCustomSnakeBar(String message, {Color? color, bool isError = true, String title = "Error"}) {
  Get.snackbar(
    title,
    message,
    titleText: BigText(text: title),
    messageText: Text(
      message,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    backgroundColor: color ?? Colors.red,  // Use red as the default if color is not provided
  );
}
