// ignore_for_file: unnecessary_import

import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget roundedIcon(IconData iconData) {
  return ClipOval(
      child: Container(
    color: Colors.grey[200],
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Icon(
        iconData,
        color: BrandColor.main_color,
      ),
    ),
  ));
}
