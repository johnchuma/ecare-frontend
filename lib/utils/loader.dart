import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void launchLoader() {
  Get.defaultDialog(
      backgroundColor: Colors.transparent,
      title: "",
      content: Center(
        child: ClipOval(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(color: BrandColor.main_color),
            ),
          ),
        ),
      ));
}

void removeGetWidget() {
  Get.back();
}
