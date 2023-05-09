import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget backArrow() {
  return GestureDetector(
    onTap: () {
      Get.back();
    },
    child: const Icon(
      Icons.arrow_back,
      color: Colors.black,
    ),
  );
}
