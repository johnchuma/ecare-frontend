import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitializationController extends GetxController {
  Rx<String> as = "Patient".obs;
  Rx<Color> dropdownItemTextColor = BrandColor.text_color.obs;

  void changeUserType(var value) {
    as.value = value;
  }

  void changeDropdownItemTextColor(Color color) {
    dropdownItemTextColor.value = color;
  }
}
