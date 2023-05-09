import 'package:doctor/includes/custom_heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void errorToast(String error) {
  Get.snackbar(
      "Error",
      backgroundColor: Colors.white,
      titleText: customHeading("Error", 16, null, Colors.red),
      error);
}

void successToast(String text) {
  Get.snackbar(
      "Success",
      backgroundColor: Colors.white,
      titleText: customHeading("Success", 16, null, Colors.green),
      text);
}
